import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:currency_converter/domain/core/errors.dart';
import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'user_flow_event.dart';
import 'user_flow_state.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@LazySingleton()
class UserFlowBloc extends Bloc<UserFlowEvent, UserFlowState> {
  final GetAllCountriesNamesAndFlags getAllCountriesNamesAndFlags;
  final GetCurrencyConversionHistory getCurrencyConversionHistory;
  final GetCurrencyConversionNow getCurrencyConversionNow;

  UserFlowBloc(
    this.getAllCountriesNamesAndFlags,
    this.getCurrencyConversionHistory,
    this.getCurrencyConversionNow,
  ) : super(UserFlowState.initial()) {
    on<ThemeModeChangedEvent>(_onThemeModeChangedEvent, transformer: restartable());
    on<GetAllCountriesNamesAndFlagsEvent>(_onGetAllCountriesNamesAndFlagsEvent, transformer: restartable());
    on<GetCurrencyConversionNowEvent>(_onGetCurrencyConversionNowEvent, transformer: restartable());
    on<GetCurrencyConversionHistoryEvent>(_onGetCurrencyConversionHistoryEvent, transformer: restartable());
    on<UpdateNumberOfWeeksForHistoryEvent>(_onUpdateNumberOfWeeksForHistoryEvent, transformer: restartable());
    on<UpdateFromCurrencyValueEvent>(_onUpdateFromCurrencyValueEvent, transformer: restartable());
    on<UpdateIsCurrencyFlippedEvent>(_onUpdateIsCurrencyFlippedEvent, transformer: restartable());
    on<UpdateFromCountrySelectedEvent>(_onUpdateFromCountrySelectedEvent, transformer: restartable());
    on<UpdateToCountrySelectedEvent>(_onUpdateToCountrySelectedEvent, transformer: restartable());
  }

  Future<void> _onThemeModeChangedEvent(ThemeModeChangedEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      placeHolderForThemeChange: !state.placeHolderForThemeChange,
      userFlowFailureOrSuccessOption: none(),
    ));
  }

  Future<void> _onGetAllCountriesNamesAndFlagsEvent(GetAllCountriesNamesAndFlagsEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      isLoadingForCountriesAndFlags: true,
      userFlowFailureOrSuccessOption: none(),
    ));
    final response = await getAllCountriesNamesAndFlags(NoParams());
    response.fold(
        (f) => emit(
              state.copyWith(
                  isLoadingForCountriesAndFlags: false,
                  countryNamesWithFlagsModels: none(),
                  userFlowFailureOrSuccessOption: some(
                    left(f),
                  )),
            ), (model) {
      if (state.currencyConversionModel.isNone()) {
        Option<CountryNamesWithFlagsModel> fromCountry = none();
        Option<CountryNamesWithFlagsModel> toCountry = none();
        for (int i = 0; i < model.size; i++) {
          if (model[i].countryShortName.getOrCrash() == 'KW') {
            toCountry = some(model[i]);
          } else if (model[i].countryShortName.getOrCrash() == 'US') {
            fromCountry = some(model[i]);
          }
        }

        if (fromCountry.isNone() || toCountry.isNone()) {
          emit(state.copyWith(
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          ));
        } else {
          emit(state.copyWith(
            isLoadingForCountriesAndFlags: false,
            countryNamesWithFlagsModels: some(model),
            toCountrySelected: toCountry,
            fromCountrySelected: fromCountry,
            userFlowFailureOrSuccessOption: some(right(none())),
          ));
        }
      }

      if (state.fromCountrySelected.isSome() && state.toCountrySelected.isSome()) {
        add(UserFlowEvent.getCurrencyConversionNowEvent(
          fromCurrency: state.toCountrySelected.getOrElse(() => throw UnexpectedNullValueError).currencyId,
          toCurrency: state.fromCountrySelected.getOrElse(() => throw UnexpectedNullValueError).currencyId,
        ));
      }
    });
  }

  Future<void> _onGetCurrencyConversionNowEvent(GetCurrencyConversionNowEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      isLoadingForCurrencyConversion: true,
      userFlowFailureOrSuccessOption: none(),
    ));
    final response = await getCurrencyConversionNow(ParamsForGetCurrencyConversionNow(
      fromCurrency: event.fromCurrency,
      toCurrency: event.toCurrency,
    ));

    response.fold(
        (f) => emit(
              state.copyWith(
                  isLoadingForCurrencyConversion: false,
                  currencyConversionModel: none(),
                  userFlowFailureOrSuccessOption: some(
                    left(f),
                  )),
            ), (model) {
      emit(state.copyWith(
        isLoadingForCurrencyConversion: false,
        currencyConversionModel: some(model),
        userFlowFailureOrSuccessOption: some(right(none())),
      ));
    });
  }

  Future<void> _onGetCurrencyConversionHistoryEvent(GetCurrencyConversionHistoryEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      isLoadingForConversionHistory: true,
      userFlowFailureOrSuccessOption: none(),
    ));

    // the the data is not loaded correctly and user tried to perform a request
    if (state.fromCountrySelected.isNone() || state.toCountrySelected.isNone()) {
      emit(state.copyWith(
        isLoadingForConversionHistory: false,
        userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
      ));
    } else {
      final response = await getCurrencyConversionHistory(ParamsForGetCurrencyConversionHistory(
        fromCurrency: state.fromCountrySelected.getOrElse(() => throw UnexpectedNullValueError).currencyId,
        toCurrency: state.toCountrySelected.getOrElse(() => throw UnexpectedNullValueError).currencyId,
        startDate: DuoDate(DateTime.now().add(Duration(days: -7 * state.numberOfWeeksForHistory.toInt()))),
        endDate: DuoDate.now(),
      ));
      response.fold(
          (f) => emit(
                state.copyWith(
                    isLoadingForConversionHistory: false,
                    countryNamesWithFlagsModels: none(),
                    userFlowFailureOrSuccessOption: some(
                      left(f),
                    )),
              ), (model) {
        emit(state.copyWith(
          isLoadingForConversionHistory: false,
          conversionHistoryModel: some(model),
          userFlowFailureOrSuccessOption: some(right(none())),
        ));
      });
    }
  }

  Future<void> _onUpdateNumberOfWeeksForHistoryEvent(UpdateNumberOfWeeksForHistoryEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      numberOfWeeksForHistory: event.number,
      userFlowFailureOrSuccessOption: none(),
    ));
    add(
      UserFlowEvent.getCurrencyConversionHistoryEvent(),
    );
  }

  /// 1- check the validation of currency conversion model
  /// 2- if not valid reset the from json
  /// 3- if valid make the conversion logic
  /// 4- update the state again
  Future<void> _onUpdateFromCurrencyValueEvent(UpdateFromCurrencyValueEvent event, Emitter<UserFlowState> emit) async {
    // to always show the error even if it was the same error!
    // resetting the state
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));

    if (state.currencyConversionModel.isNone()) {
      state.toCurrencyTextEditingController.clear();
      emit(state.copyWith(
        fromCurrencyValue: event.number,
        toCurrencyValue: ValidatedDouble.fromNumber(0.0),
        userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
      ));
    } else {
      // if the entered number is not valid. reset the to currency
      event.number.value.fold(
        (_) {
          state.toCurrencyTextEditingController.clear();
          emit(state.copyWith(
            fromCurrencyValue: event.number,
            toCurrencyValue: ValidatedDouble.fromNumber(0.0),
            userFlowFailureOrSuccessOption: none(),
          ));
        },
        (_) {
          final currencyConversion = state.currencyConversionModel.getOrElse(() => throw UnexpectedNullValueError);
          final fromCurrencyDouble = event.number.toDouble();
          final usedConversionRateDouble =
              state.isCurrencyFlipped ? currencyConversion.toFromConversion.toDouble() : currencyConversion.fromToConversion.toDouble();
          final toCurrencyValue = ValidatedDouble.fromNumber(fromCurrencyDouble * usedConversionRateDouble);

          state.toCurrencyTextEditingController.text = toCurrencyValue.getOrCrash();
          emit(state.copyWith(
            fromCurrencyValue: event.number,
            toCurrencyValue: toCurrencyValue,
            userFlowFailureOrSuccessOption: none(),
          ));
        },
      );
    }
  }

  Future<void> _onUpdateIsCurrencyFlippedEvent(UpdateIsCurrencyFlippedEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));

    state.currencyConversionModel.fold(() {
      state.toCurrencyTextEditingController.clear();
      emit(state.copyWith(
        toCurrencyValue: ValidatedDouble.fromNumber(0.0),
        userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
      ));
    }, (currencyConversion) {
      final fromCurrencyDouble = state.toCurrencyValue.toDouble();
      final isCurrencyFlipped = !state.isCurrencyFlipped;
      final usedConversionRateDouble =
          isCurrencyFlipped ? currencyConversion.toFromConversion.toDouble() : currencyConversion.fromToConversion.toDouble();
      final toCurrencyValue = ValidatedDouble.fromNumber(fromCurrencyDouble * usedConversionRateDouble);

      state.fromCurrencyTextEditingController.text = state.toCurrencyValue.getOrCrash();
      state.toCurrencyTextEditingController.text = toCurrencyValue.getOrCrash();
      emit(state.copyWith(
        isCurrencyFlipped: isCurrencyFlipped,
        fromCurrencyValue: state.toCurrencyValue,
        toCurrencyValue: toCurrencyValue,
        fromCountrySelected: state.toCountrySelected,
        toCountrySelected: state.fromCountrySelected,
        userFlowFailureOrSuccessOption: none(),
      ));
    });
  }

  Future<void> _onUpdateFromCountrySelectedEvent(UpdateFromCountrySelectedEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    state.fromCurrencyTextEditingController.clear();
    state.toCurrencyTextEditingController.clear();
    emit(state.copyWith(
      fromCurrencyValue: ValidatedDouble.fromNumber(0.0),
      toCurrencyValue: ValidatedDouble.fromNumber(0.0),
      fromCountrySelected: some(event.countryNamesWithFlagsModel),
      isCurrencyFlipped: false,
      userFlowFailureOrSuccessOption: none(),
    ));

    state.toCountrySelected.fold(() {
      emit(state.copyWith(
        userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
      ));
    }, (toCountrySelected) {
      add(
        UserFlowEvent.getCurrencyConversionNowEvent(
          fromCurrency: event.countryNamesWithFlagsModel.currencyId,
          toCurrency: toCountrySelected.currencyId,
        ),
      );
    });
  }

  Future<void> _onUpdateToCountrySelectedEvent(UpdateToCountrySelectedEvent event, Emitter<UserFlowState> emit) async {
    emit(state.copyWith(
      userFlowFailureOrSuccessOption: none(),
    ));
    state.fromCurrencyTextEditingController.clear();
    state.toCurrencyTextEditingController.clear();
    emit(state.copyWith(
      fromCurrencyValue: ValidatedDouble.fromNumber(0.0),
      toCurrencyValue: ValidatedDouble.fromNumber(0.0),
      isCurrencyFlipped: false,
      toCountrySelected: some(event.countryNamesWithFlagsModel),
      userFlowFailureOrSuccessOption: none(),
    ));

    state.fromCountrySelected.fold(() {
      emit(state.copyWith(
        userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
      ));
    }, (fromCountrySelected) {
      add(
        UserFlowEvent.getCurrencyConversionNowEvent(
          fromCurrency: fromCountrySelected.currencyId,
          toCurrency: event.countryNamesWithFlagsModel.currencyId,
        ),
      );
    });
  }
}
