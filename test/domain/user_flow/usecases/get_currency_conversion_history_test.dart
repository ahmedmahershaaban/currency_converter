import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kt_dart/kt.dart';
import 'package:mocktail/mocktail.dart';

class ValidatedNormalStringFake extends Fake implements ValidatedNormalString {}

class DuoDateFake extends Fake implements DuoDate {}

class MockIUserFlowFacade extends Mock implements IUserFlowFacade {}

main() {
  late MockIUserFlowFacade mockIUserFlowFacade;
  late GetCurrencyConversionHistory usecase;

  setUp(() {
    mockIUserFlowFacade = MockIUserFlowFacade();
    usecase = GetCurrencyConversionHistory(mockIUserFlowFacade);
    registerFallbackValue(ValidatedNormalStringFake());
    registerFallbackValue(DuoDateFake());
  });

  final mapData = KtMap.from({DuoDate.now(): ValidatedDouble.fromNumber(1.0)});
  final conversionHistoryModel = ConversionHistoryModel(
    fromToConversionHistory: mapData,
    toFromConversionHistory: mapData,
  );
  final params = ParamsForGetCurrencyConversionHistory(
    fromCurrency: ValidatedNormalString('USD'),
    toCurrency: ValidatedNormalString('PHP'),
    startDate: DuoDate.now(),
    endDate: DuoDate.now(),
  );

  test('should get ConversionHistoryModel form repository', () async {
    // arrange
    when(() => mockIUserFlowFacade.getCurrencyConversionHistory(
          fromCurrency: any(named: 'fromCurrency'),
          toCurrency: any(named: 'toCurrency'),
          startDate: any(named: 'startDate'),
          endDate: any(named: 'endDate'),
        )).thenAnswer((_) async => Right(conversionHistoryModel));

    // act
    final result = await usecase(params);

    //assert
    expect(result, Right(conversionHistoryModel));
    verify(
      () => mockIUserFlowFacade.getCurrencyConversionHistory(
        fromCurrency: params.fromCurrency,
        toCurrency: params.toCurrency,
        startDate: params.startDate,
        endDate: params.endDate,
      ),
    ).called(1);
    verifyNoMoreInteractions(mockIUserFlowFacade);
  });
}
