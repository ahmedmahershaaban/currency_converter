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

// CountryNamesWithFlagModel
String fixtureCorrectModelForCountryNamesWithFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/correct/country_names_with_flags_model_dto.json').readAsStringSync();
String fixtureWrongModelForCountryNamesWithFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/wrong/country_names_with_flags_model_dto.json').readAsStringSync();

// CurrencyConversionModel
String fixtureCorrectModelForCurrencyConversionFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/currency_conversion_model/correct/currency_conversion_model_dto.json').readAsStringSync();
String fixtureWrongModelForCurrencyConversionFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/currency_conversion_model/wrong/currency_conversion_model_dto.json').readAsStringSync();

// ConversionHistoryModel
String fixtureCorrectModelForConversionHistoryModelDto() =>
    File('test/fixtures/infrastructure/user_flow/conversion_history_model/correct/conversion_history_model_dto.json').readAsStringSync();
String fixtureWrongModelForConversionHistoryModelDto() =>
    File('test/fixtures/infrastructure/user_flow/conversion_history_model/wrong/conversion_history_model_dto.json').readAsStringSync();
