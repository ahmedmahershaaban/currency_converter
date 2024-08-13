import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'user_flow_state.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowState with _$UserFlowState {
  const factory UserFlowState({
    required bool isLoadingForCountriesAndFlags,
    required bool isLoadingForCurrencyConversion,
    required bool isLoadingForConversionHistory,

    /// when the theme of the app is changed the bloc will receive [UserFlowEvent.ThemeModeChanged] that will change this
    /// value to update the `BlocBuilder` across the app.
    required bool placeHolderForThemeChange,
    required Option<KtList<CountryNamesWithFlagsModel>> countryNamesWithFlagsModels,
    required Option<CurrencyConversionModel> currencyConversionModel,
    required Option<ConversionHistoryModel> conversionHistoryModel,
    required ValidatedDouble fromCurrencyValue,
    required ValidatedDouble toCurrencyValue,
    required TextEditingController fromCurrencyTextEditingController,
    required TextEditingController toCurrencyTextEditingController,
    required Option<CountryNamesWithFlagsModel> fromCountrySelected,
    required Option<CountryNamesWithFlagsModel> toCountrySelected,
    required bool isCurrencyFlipped,
    required ValidatedInt numberOfWeeksForHistory,
    required Option<Either<UserFlowFailure, Option<String>>> userFlowFailureOrSuccessOption,
  }) = _userFlowState;

  factory UserFlowState.initial() => UserFlowState(
        isLoadingForCountriesAndFlags: true,
        isLoadingForCurrencyConversion: true,
        isLoadingForConversionHistory: false,
        placeHolderForThemeChange: false,
        countryNamesWithFlagsModels: none(),
        currencyConversionModel: none(),
        conversionHistoryModel: none(),
        fromCountrySelected: none(),
        toCountrySelected: none(),
        fromCurrencyTextEditingController: TextEditingController(),
        toCurrencyTextEditingController: TextEditingController(),
        fromCurrencyValue: ValidatedDouble('0.0'),
        toCurrencyValue: ValidatedDouble('0.0'),
        numberOfWeeksForHistory: ValidatedInt('1'),
        isCurrencyFlipped: false,
        userFlowFailureOrSuccessOption: none(),
      );
}
