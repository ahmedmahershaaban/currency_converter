import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class ValidatedNormalStringFake extends Fake implements ValidatedNormalString {}

class MockIUserFlowFacade extends Mock implements IUserFlowFacade {}

main() {
  late MockIUserFlowFacade mockIUserFlowFacade;
  late GetCurrencyConversionNow usecase;

  setUp(() {
    mockIUserFlowFacade = MockIUserFlowFacade();
    usecase = GetCurrencyConversionNow(mockIUserFlowFacade);
    registerFallbackValue(ValidatedNormalStringFake());
  });

  final validatedDouble = ValidatedDouble.fromNumber(1.1);
  final currencyConversionModel = CurrencyConversionModel(
    fromToConversion: validatedDouble,
    toFromConversion: validatedDouble,
  );
  final validatedNormalString = ValidatedNormalString('USD');
  final params = ParamsForGetCurrencyConversionNow(
    fromCurrency: validatedNormalString,
    toCurrency: validatedNormalString,
  );

  test('get CurrencyConversionModel from repository', () async {
    // arrange
    when(() => mockIUserFlowFacade.getCurrencyConversionNow(
          fromCurrency: any(named: 'fromCurrency'),
          toCurrency: any(named: 'toCurrency'),
        )).thenAnswer((_) async => Right(currencyConversionModel));

    // act
    final result = await usecase(params);

    // assert
    expect(result, Right(currencyConversionModel));
    verify(
      () => mockIUserFlowFacade.getCurrencyConversionNow(fromCurrency: params.fromCurrency, toCurrency: params.toCurrency),
    ).called(1);
    verifyNoMoreInteractions(mockIUserFlowFacade);
  });
}
