import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:currency_converter/domain/user_flow/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class MockNoParams extends Fake implements NoParams {}

class MockParamsForGetCurrencyConversionNow extends Fake implements ParamsForGetCurrencyConversionNow {}

class MockParamsForGetCurrencyConversionHistory extends Fake implements ParamsForGetCurrencyConversionHistory {}

class MockValidatedNormalString extends Fake implements ValidatedNormalString {}

class MockGetAllCountriesNamesAndFlags extends Mock implements GetAllCountriesNamesAndFlags {}

class MockGetCurrencyConversionHistory extends Mock implements GetCurrencyConversionHistory {}

class MockGetCurrencyConversionNow extends Mock implements GetCurrencyConversionNow {}

void main() {
  late UserFlowBloc userFlowBloc;
  late MockGetAllCountriesNamesAndFlags mockGetAllCountriesNamesAndFlags;
  late MockGetCurrencyConversionHistory mockGetCurrencyConversionHistory;
  late MockGetCurrencyConversionNow mockGetCurrencyConversionNow;
  UserFlowState userFlowState = UserFlowState.initial();
  setUp(() {
    mockGetAllCountriesNamesAndFlags = MockGetAllCountriesNamesAndFlags();
    mockGetCurrencyConversionHistory = MockGetCurrencyConversionHistory();
    mockGetCurrencyConversionNow = MockGetCurrencyConversionNow();

    userFlowBloc = UserFlowBloc(
      mockGetAllCountriesNamesAndFlags,
      mockGetCurrencyConversionHistory,
      mockGetCurrencyConversionNow,
    );

    registerFallbackValue(MockNoParams());
    registerFallbackValue(MockValidatedNormalString());
    registerFallbackValue(MockParamsForGetCurrencyConversionHistory());
    registerFallbackValue(MockParamsForGetCurrencyConversionNow());
  });

  tearDown(() {
    userFlowBloc.close();
    userFlowState = UserFlowState.initial();
  });

  UserFlowState updateUserFlowState(UserFlowState state) {
    userFlowState = state;
    return userFlowState;
  }

  final KtList<CountryNamesWithFlagsModel> tCountryNamesWithFlagsModelKtList = KtList.of(
    CountryNamesWithFlagsModel(
      countryFullName: ValidatedNormalString('United States of America'),
      countryShortName: ValidatedNormalString('US'),
      currencyFlagSvg: ValidatedFlagSvg(''),
      countryAlpha3: ValidatedNormalString('USA'),
      currencyFullName: ValidatedNormalString('United States dollar'),
      currencyId: ValidatedNormalString('USD'),
      currencySymbol: ValidatedNormalString('\$'),
    ),
    CountryNamesWithFlagsModel(
      countryFullName: ValidatedNormalString('Kuwait'),
      countryShortName: ValidatedNormalString('KW'),
      currencyFlagSvg: ValidatedFlagSvg(''),
      countryAlpha3: ValidatedNormalString('KWT'),
      currencyFullName: ValidatedNormalString('Kuwaiti dinar'),
      currencyId: ValidatedNormalString('KWD'),
      currencySymbol: ValidatedNormalString('د.ك'),
    ),
  );
  final tCurrencyConversionModel = CurrencyConversionModel(
    fromToConversion: ValidatedDouble.fromNumber(2.0),
    toFromConversion: ValidatedDouble.fromNumber(0.5),
  );
  final tDuoDate = DuoDate.now();
  final tConversionHistoryModel = ConversionHistoryModel(
    fromToConversionHistory: KtMap.from({tDuoDate: ValidatedDouble.fromNumber(2.0)}),
    toFromConversionHistory: KtMap.from({tDuoDate: ValidatedDouble.fromNumber(0.5)}),
  );

  group('UserFlowBloc Tests', () {
    blocTest<UserFlowBloc, UserFlowState>(
      'emits [] when no event is added',
      build: () => userFlowBloc,
      expect: () => [],
    );

    test('initial state is UserFlowState.initial()', () {
      expect(
        userFlowBloc.state,
        userFlowState,
      );
    });

    blocTest<UserFlowBloc, UserFlowState>(
      'emits states in order when ThemeModeChangedEvent is added',
      build: () {
        return userFlowBloc;
      },
      act: (bloc) {
        bloc.add(const UserFlowEvent.themeModeChangedEvent());
      },
      expect: () => [
        updateUserFlowState(
          userFlowState.copyWith(
            placeHolderForThemeChange: !userFlowState.placeHolderForThemeChange,
            userFlowFailureOrSuccessOption: none(),
          ),
        ),
      ],
      verify: (_) {},
    );

    group('mockGetAllCountriesNamesAndFlags scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when state.currencyConversionModel.isNone() and usecases returns a right',
        build: () {
          when(() => mockGetAllCountriesNamesAndFlags(any())).thenAnswer((_) async => Right(tCountryNamesWithFlagsModelKtList));
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => Right(tCurrencyConversionModel));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(const UserFlowEvent.getAllCountriesNamesAndFlagsEvent());
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCountriesAndFlags: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCountriesAndFlags: false,
            countryNamesWithFlagsModels: some(tCountryNamesWithFlagsModelKtList),
            fromCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(0)),
            toCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(1)),
            userFlowFailureOrSuccessOption: some(right(none())),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: false,
            currencyConversionModel: some(tCurrencyConversionModel),
            userFlowFailureOrSuccessOption: some(right(none())),
          )),
        ],
        verify: (_) {
          verify(() => mockGetAllCountriesNamesAndFlags(any())).called(1);
          verify(() => mockGetCurrencyConversionNow(any())).called(1);
        },
      );
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when state.currencyConversionModel.isNone() and [mockGetAllCountriesNamesAndFlags] usecases returns a left',
        build: () {
          when(() => mockGetAllCountriesNamesAndFlags(any())).thenAnswer((_) async => const Left(UserFlowFailure.serverError()));
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => Right(tCurrencyConversionModel));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(const UserFlowEvent.getAllCountriesNamesAndFlagsEvent());
        },
        expect: () => [
          userFlowState.copyWith(
            isLoadingForCountriesAndFlags: true,
            userFlowFailureOrSuccessOption: none(),
          ),
          userFlowState.copyWith(
              isLoadingForCountriesAndFlags: false,
              countryNamesWithFlagsModels: none(),
              userFlowFailureOrSuccessOption: some(const Left(UserFlowFailure.serverError()))),
        ],
        verify: (_) {
          verify(() => mockGetAllCountriesNamesAndFlags(any())).called(1);
          verifyNever(() => mockGetCurrencyConversionNow(any()));
        },
      );
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when state.currencyConversionModel.isNone() and [mockGetCurrencyConversionNow] usecases returns a left',
        build: () {
          when(() => mockGetAllCountriesNamesAndFlags(any())).thenAnswer((_) async => Right(tCountryNamesWithFlagsModelKtList));
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => const Left(UserFlowFailure.serverError()));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(const UserFlowEvent.getAllCountriesNamesAndFlagsEvent());
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCountriesAndFlags: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCountriesAndFlags: false,
            countryNamesWithFlagsModels: some(tCountryNamesWithFlagsModelKtList),
            fromCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(0)),
            toCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(1)),
            userFlowFailureOrSuccessOption: some(right(none())),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: false,
            currencyConversionModel: none(),
            userFlowFailureOrSuccessOption: some(const Left(UserFlowFailure.serverError())),
          )),
        ],
        verify: (_) {
          verify(() => mockGetCurrencyConversionNow(any())).called(1);
          verifyNever(() => mockGetAllCountriesNamesAndFlags(MockNoParams()));
        },
      );
    });

    group('GetCurrencyConversionNowEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => Right(tCurrencyConversionModel));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.getCurrencyConversionNowEvent(fromCurrency: MockValidatedNormalString(), toCurrency: MockValidatedNormalString()));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: false,
            currencyConversionModel: some(tCurrencyConversionModel),
            userFlowFailureOrSuccessOption: some(right(none())),
          )),
        ],
        verify: (_) {
          verify(() => mockGetCurrencyConversionNow(any())).called(1);
        },
      );
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a left',
        build: () {
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => const Left(UserFlowFailure.serverError()));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.getCurrencyConversionNowEvent(fromCurrency: MockValidatedNormalString(), toCurrency: MockValidatedNormalString()));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: false,
            currencyConversionModel: none(),
            userFlowFailureOrSuccessOption: some(
              const Left(UserFlowFailure.serverError()),
            ),
          )),
        ],
        verify: (_) {
          verify(() => mockGetCurrencyConversionNow(any())).called(1);
        },
      );
    });

    group('GetCurrencyConversionHistoryEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          when(() => mockGetCurrencyConversionHistory(any())).thenAnswer((_) async => Right(tConversionHistoryModel));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.getCurrencyConversionHistoryEvent());
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForConversionHistory: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForConversionHistory: false,
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
        verify: (_) {
          verifyNever(() => mockGetCurrencyConversionHistory(any()));
        },
      );
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a left',
        build: () {
          when(() => mockGetCurrencyConversionNow(any())).thenAnswer((_) async => const Left(UserFlowFailure.serverError()));
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.getCurrencyConversionNowEvent(fromCurrency: MockValidatedNormalString(), toCurrency: MockValidatedNormalString()));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForCurrencyConversion: false,
            currencyConversionModel: none(),
            userFlowFailureOrSuccessOption: some(
              const Left(UserFlowFailure.serverError()),
            ),
          )),
        ],
        verify: (_) {
          verify(() => mockGetCurrencyConversionNow(any())).called(1);
        },
      );
    });

    group('UpdateNumberOfWeeksForHistoryEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.updateNumberOfWeeksForHistoryEvent(number: ValidatedInt.fromNumber(1)));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            numberOfWeeksForHistory: ValidatedInt.fromNumber(1),
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForConversionHistory: true,
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            isLoadingForConversionHistory: false,
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
      );
    });

    group('UpdateFromCurrencyValueEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.updateFromCurrencyValueEvent(number: ValidatedDouble.fromNumber(0.0)));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            fromCurrencyValue: ValidatedDouble.fromNumber(0.0),
            toCurrencyValue: ValidatedDouble.fromNumber(0.0),
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
      );
    });

    group('UpdateIsCurrencyFlippedEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(const UserFlowEvent.updateIsCurrencyFlippedEvent());
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            toCurrencyValue: ValidatedDouble.fromNumber(0.0),
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
      );
    });

    group('UpdateFromCountrySelectedEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.updateFromCountrySelectedEvent(countryNamesWithFlagsModel: tCountryNamesWithFlagsModelKtList.elementAt(0)));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            fromCurrencyValue: ValidatedDouble.fromNumber(0.0),
            toCurrencyValue: ValidatedDouble.fromNumber(0.0),
            isCurrencyFlipped: false,
            fromCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(0)),
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
      );
    });

    group('UpdateToCountrySelectedEvent scenarios', () {
      blocTest<UserFlowBloc, UserFlowState>(
        'emits states in order when usecases returns a right',
        build: () {
          return userFlowBloc;
        },
        act: (bloc) {
          bloc.add(UserFlowEvent.updateToCountrySelectedEvent(countryNamesWithFlagsModel: tCountryNamesWithFlagsModelKtList.elementAt(1)));
        },
        expect: () => [
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            fromCurrencyValue: ValidatedDouble.fromNumber(0.0),
            toCurrencyValue: ValidatedDouble.fromNumber(0.0),
            isCurrencyFlipped: false,
            toCountrySelected: some(tCountryNamesWithFlagsModelKtList.elementAt(1)),
            userFlowFailureOrSuccessOption: none(),
          )),
          updateUserFlowState(userFlowState.copyWith(
            userFlowFailureOrSuccessOption: some(left(const UserFlowFailure.serverError())),
          )),
        ],
      );
    });
  });
}
