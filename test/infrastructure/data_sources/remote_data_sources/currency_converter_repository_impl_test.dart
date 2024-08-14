import 'dart:convert';

import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../fixtures/fixture_reader.dart';

class MockBaseResponse extends Mock implements http.BaseResponse {}

class MockCurrencyConverterService extends Mock implements CurrencyConverterService {}

main() {
  late MockCurrencyConverterService mockCurrencyConverterService;
  late CurrencyConverterRepositoryImpl repository;

  setUp(() {
    mockCurrencyConverterService = MockCurrencyConverterService();
    repository = CurrencyConverterRepositoryImpl(currencyConverterService: mockCurrencyConverterService);
  });

  final tCountryNamesWithFlagsModelDto = CountryNamesWithFlagsModelDto.fromJson(json.decode(fixtureCorrectModelForCountryNamesWithFlagModelDto()));

  group('CurrencyConverterRepositoryImpl', () {
    // test('Get all countries and currencies from the service', () async {
    //   // arrange
    //   final chopperResponse = Response(
    //     MockBaseResponse(),
    //     [tCountryNamesWithFlagsModelDto],
    //     error: null,
    //   );
    //   when(() => chopperResponse.isSuccessful).thenReturn(true);
    //   when(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).thenAnswer((_) async => chopperResponse);
    //
    //   // act
    //   final result = await repository.getAllCountriesAndCurrencies();
    //
    //   // assert
    //   expect(result, right([tCountryNamesWithFlagsModelDto]));
    //   verify(() => mockCurrencyConverterService.getAllCountriesAndCurrencies()).called(1);
    //   verifyNoMoreInteractions(mockCurrencyConverterService);
    // });
  });
}
