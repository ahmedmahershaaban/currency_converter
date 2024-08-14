import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/currency_conversion_model_dto/currency_conversion_model_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class MockBaseResponse extends Mock implements http.BaseResponse {}

class MockCurrencyConverterService extends Mock implements CurrencyConverterService {}

main() {
  late MockCurrencyConverterService mockCurrencyConverterService;
  late CurrencyConverterRepositoryImpl repository;
  late MockBaseResponse mockBaseResponse;

  setUp(() {
    mockCurrencyConverterService = MockCurrencyConverterService();
    repository = CurrencyConverterRepositoryImpl(currencyConverterService: mockCurrencyConverterService);
    mockBaseResponse = MockBaseResponse();
  });

  final tCountryNamesWithFlagsModelDto = CountryNamesWithFlagsModelDto.fromJson(json.decode(fixtureCorrectModelForCountryNamesWithFlagModelDto()));
  final tCurrencyConversionModelDto = CurrencyConversionModelDto.fromJson(json.decode(fixtureCorrectModelForCurrencyConversionFlagModelDto()));
  final tConversionHistoryModelDto = ConversionHistoryModelDto.fromJson(json.decode(fixtureCorrectModelForConversionHistoryModelDto()));

  const tFailureMessage = 'Error!';
  group('CurrencyConverterRepositoryImpl', () {
    group('getAllCountriesAndCurrencies scenarios', () {
      test('should return a list of countries and currencies on successful response', () async {
        // arrange
        final chopperResponse = Response<List<CountryNamesWithFlagsModelDto>>(
          mockBaseResponse,
          [tCountryNamesWithFlagsModelDto],
          error: null,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(200);
        when(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getAllCountriesAndCurrencies();

        // assert
        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), [tCountryNamesWithFlagsModelDto]);
        verify(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });
      test('should return a failure message on failed response or that has a codeStatus not equals 200', () async {
        // arrange
        final chopperResponse = Response<List<CountryNamesWithFlagsModelDto>>(
          mockBaseResponse,
          null,
          error: tFailureMessage,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(400);
        when(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getAllCountriesAndCurrencies();

        // assert
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => r), chopperResponse.error);
        verify(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });
    });

    group('getCurrencyConversionNow scenarios', () {
      const tCurrencyString = 'USD_PHP';

      test('should return a CurrencyConversionModelDto on successful response', () async {
        // arrange
        final chopperResponse = Response<CurrencyConversionModelDto>(
          mockBaseResponse,
          tCurrencyConversionModelDto,
          error: null,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(200);
        when(() => mockCurrencyConverterService.getCurrencyConversionNow(fromAndToMultipleCurrencies: any(named: 'fromAndToMultipleCurrencies')))
            .thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getCurrencyConversionNow(fromAndToMultipleCurrencies: tCurrencyString);

        // assert
        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), tCurrencyConversionModelDto);
        verify(() => mockCurrencyConverterService.getCurrencyConversionNow(fromAndToMultipleCurrencies: tCurrencyString)).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });

      test('should return a CurrencyConversionModelDto on failed response', () async {
        // arrange
        final chopperResponse = Response<CurrencyConversionModelDto>(
          mockBaseResponse,
          null,
          error: tFailureMessage,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(400);
        when(() => mockCurrencyConverterService.getCurrencyConversionNow(fromAndToMultipleCurrencies: any(named: 'fromAndToMultipleCurrencies')))
            .thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getCurrencyConversionNow(fromAndToMultipleCurrencies: tCurrencyString);

        // assert
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => r), chopperResponse.error);
        verify(() => mockCurrencyConverterService.getCurrencyConversionNow(fromAndToMultipleCurrencies: tCurrencyString)).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });
    });

    group('getCurrencyConversionHistory scenarios', () {
      const tFromAndToMultipleCurrencies = 'USD_PHP,PHP_USD';
      const tStartDate = 'startDate';
      const tEndDate = 'endDate';

      test('should return a ConversionHistoryModelDto on successful response', () async {
        // arrange
        final chopperResponse = Response<ConversionHistoryModelDto>(
          mockBaseResponse,
          tConversionHistoryModelDto,
          error: null,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(200);
        when(() => mockCurrencyConverterService.getCurrencyConversionHistory(
              fromAndToMultipleCurrencies: any(named: 'fromAndToMultipleCurrencies'),
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
            )).thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getCurrencyConversionHistory(
          fromAndToMultipleCurrencies: tFromAndToMultipleCurrencies,
          startDate: tStartDate,
          endDate: tEndDate,
        );

        // assert
        expect(result.isRight(), true);
        expect(result.fold((l) => l, (r) => r), tConversionHistoryModelDto);
        verify(() => mockCurrencyConverterService.getCurrencyConversionHistory(
              fromAndToMultipleCurrencies: tFromAndToMultipleCurrencies,
              startDate: tStartDate,
              endDate: tEndDate,
            )).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });

      test('should return a ConversionHistoryModelDto on failed response', () async {
        // arrange
        final chopperResponse = Response<ConversionHistoryModelDto>(
          mockBaseResponse,
          null,
          error: tFailureMessage,
        );
        when(() => mockBaseResponse.statusCode).thenReturn(400);
        when(() => mockCurrencyConverterService.getCurrencyConversionHistory(
              fromAndToMultipleCurrencies: any(named: 'fromAndToMultipleCurrencies'),
              startDate: any(named: 'startDate'),
              endDate: any(named: 'endDate'),
            )).thenAnswer((_) async => chopperResponse);

        // act
        final result = await repository.getCurrencyConversionHistory(
          fromAndToMultipleCurrencies: tFromAndToMultipleCurrencies,
          startDate: tStartDate,
          endDate: tEndDate,
        );

        // assert
        expect(result.isLeft(), true);
        expect(result.fold((l) => l, (r) => r), chopperResponse.error);
        verify(() => mockCurrencyConverterService.getCurrencyConversionHistory(
              fromAndToMultipleCurrencies: tFromAndToMultipleCurrencies,
              startDate: tStartDate,
              endDate: tEndDate,
            )).called(1);
        verifyNoMoreInteractions(mockCurrencyConverterService);
      });
    });
  });
}
