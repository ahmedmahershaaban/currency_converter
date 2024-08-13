import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart';
import 'package:currency_converter/domain/user_flow/value_objects.dart';
import 'package:currency_converter/infrastructure/user_flow/user_flow_facade.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class MockIUserFlowFacade extends Mock implements UserFlowFacade {}

void main() {
  late GetAllCountriesNamesAndFlags usecase;
  late MockIUserFlowFacade mockIUserFlowFacade;

  setUp(() {
    mockIUserFlowFacade = MockIUserFlowFacade();
    usecase = GetAllCountriesNamesAndFlags(mockIUserFlowFacade);
  });

  final allCountriesNamesAndFlags = KtList.of(
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

  test('should get KtList of CountriesNamesAndFlags from the repository', () async {
    // arrange
    when(mockIUserFlowFacade.getAllCountriesNamesAndFlags).thenAnswer(
      (_) async => Right(allCountriesNamesAndFlags),
    );
    // act
    final result = await usecase(NoParams());
    // asset
    expect(result, Right(allCountriesNamesAndFlags));
    verify(mockIUserFlowFacade.getAllCountriesNamesAndFlags).called(1);
    verifyNoMoreInteractions(mockIUserFlowFacade);
  });
}
