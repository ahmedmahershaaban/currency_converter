import 'dart:io';

String fixtureForResponseOfGetAllCountriesAndCurrencies() =>
    File('test/fixtures/infrastructure/data_sources/remote_data_source/currency_converter_services/response_of_get_all_countries_and_currencies.json')
        .readAsStringSync();
String fixtureForResponseOfGetCurrencyConversionHistory() =>
    File('test/fixtures/infrastructure/data_sources/remote_data_source/currency_converter_services/response_of_get_currency_conversion_history.json')
        .readAsStringSync();

String fixtureForResponseOfGetCurrencyConversionNow() =>
    File('test/fixtures/infrastructure/data_sources/remote_data_source/currency_converter_services/response_of_get_currency_conversion_now.json')
        .readAsStringSync();

// ConversionHistoryModel
String fixtureCorrectModelForCountryNamesWithFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/correct/country_names_with_flags_model_dto.json').readAsStringSync();
String fixtureCorrectModelForCountryNamesWithFlagModelDrift() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/correct/country_names_with_flags_model_drift.json')
        .readAsStringSync();

String fixtureWrongModelForCountryNamesWithFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/wrong/country_names_with_flags_model_dto.json').readAsStringSync();
String fixtureWrongModelForCountryNamesWithFlagModelDrift() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/wrong/country_names_with_flags_model_drift.json').readAsStringSync();

// CountryNamesWithFlagModel

// CurrencyConversionModel
