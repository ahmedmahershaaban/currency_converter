import 'package:bloc_test/bloc_test.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart';
import 'package:currency_converter/domain/user_flow/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class MockNoParams extends Fake implements NoParams {}

class MockGetAllCountriesNamesAndFlags extends Mock implements GetAllCountriesNamesAndFlags {}

class MockGetCurrencyConversionHistory extends Mock implements GetCurrencyConversionHistory {}

class MockGetCurrencyConversionNow extends Mock implements GetCurrencyConversionNow {}

void main() {
  late UserFlowBloc userFlowBloc;
  late MockGetAllCountriesNamesAndFlags mockGetAllCountriesNamesAndFlags;
  late MockGetCurrencyConversionHistory mockGetCurrencyConversionHistory;
  late MockGetCurrencyConversionNow mockGetCurrencyConversionNow;

  setUp(() {
    mockGetAllCountriesNamesAndFlags = MockGetAllCountriesNamesAndFlags();
    mockGetCurrencyConversionHistory = MockGetCurrencyConversionHistory();
    mockGetCurrencyConversionNow = MockGetCurrencyConversionNow();

    userFlowBloc = UserFlowBloc(
      mockGetAllCountriesNamesAndFlags,
      mockGetCurrencyConversionHistory,
      mockGetCurrencyConversionNow,
    );
  });

  tearDown(() {
    userFlowBloc.close();
  });

  final tFromCurrencyTextEditingController = TextEditingController();
  final tToCurrencyTextEditingController = TextEditingController();
  UserFlowState correctUserFLowState(UserFlowState userFlowState) {
    return userFlowState.copyWith(
      fromCurrencyTextEditingController: tFromCurrencyTextEditingController,
      toCurrencyTextEditingController: tToCurrencyTextEditingController,
    );
  }

  final KtList<CountryNamesWithFlagsModel> tCountryNamesWithFlagsModel = KtList.of(
    CountryNamesWithFlagsModel(
      countryFullName: ValidatedNormalString('United States of America'),
      countryShortName: ValidatedNormalString('US'),
      currencyFlagSvg: ValidatedFlagSvg(''),
      countryAlpha3: ValidatedNormalString('USA'),
      currencyFullName: ValidatedNormalString('United States dollar'),
      currencyId: ValidatedNormalString('USD'),
      currencySymbol: ValidatedNormalString('\$'),
    ),
  );

  group('UserFlowBloc Tests', () {
    blocTest<UserFlowBloc, UserFlowState>(
      'emits [] when no event is added',
      build: () => userFlowBloc,
      expect: () => [],
    );

    test('initial state is UserFlowState.initial()', () {
      expect(
        correctUserFLowState(userFlowBloc.state),
        correctUserFLowState(UserFlowState.initial()),
      );
    });

    /// I am still working on the bloc testing but then will test the API integrations
    /// But will push the code to github first then will continue the unit testing later.
    ///
    blocTest<UserFlowBloc, UserFlowState>(
      'emits states in order when GetAllCountriesNamesAndFlagsEvent is added',
      build: () {
        when(() => mockGetAllCountriesNamesAndFlags(MockNoParams())).thenAnswer((_) async => Right(tCountryNamesWithFlagsModel));
        return userFlowBloc;
      },
      act: (bloc) => bloc.add(const GetAllCountriesNamesAndFlagsEvent()),
      expect: () => [
        userFlowBloc.state.copyWith(
          isLoadingForCountriesAndFlags: true,
          userFlowFailureOrSuccessOption: none(),
        ),
        userFlowBloc.state.copyWith(
          isLoadingForCountriesAndFlags: false,
          countryNamesWithFlagsModels: some(tCountryNamesWithFlagsModel),
          userFlowFailureOrSuccessOption: none(),
        ),
      ],
      verify: (_) {
        verify(() => mockGetAllCountriesNamesAndFlags(any())).called(1);
      },
    );
  });
}
