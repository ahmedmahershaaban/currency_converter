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
String fixtureModelForConversionHistoryModel() =>
    File('test/fixtures/infrastructure/user_flow/conversion_history_model/conversion_history_model.json').readAsStringSync();
String fixtureModelForConversionHistoryModelDto() =>
    File('test/fixtures/infrastructure/user_flow/conversion_history_model/conversion_history_model_dto.json').readAsStringSync();
String fixtureModelForConversionHistoryModelDrift() =>
    File('test/fixtures/infrastructure/user_flow/conversion_history_model/conversion_history_model_drift.json').readAsStringSync();

// CountryNamesWithFlagModel
String fixtureModelForCountryNamesWithFlagModel() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/country_names_with_flags_model.json').readAsStringSync();
String fixtureModelForCountryNamesWithFlagModelDto() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/country_names_with_flags_model_dto.json').readAsStringSync();
String fixtureModelForCountryNamesWithFlagModelDrift() =>
    File('test/fixtures/infrastructure/user_flow/country_names_with_flags_model/country_names_with_flags_model_drift.json').readAsStringSync();

// CurrencyConversionModel
String fixtureModelForCurrencyConversionModel() =>
    File('test/fixtures/infrastructure/user_flow/currency_conversion_model/currency_conversion_model.json').readAsStringSync();
String fixtureModelForCurrencyConversionModelDto() =>
    File('test/fixtures/infrastructure/user_flow/currency_conversion_model/currency_conversion_model_dto.json').readAsStringSync();
String fixtureModelForCurrencyConversionModelDrift() =>
    File('test/fixtures/infrastructure/user_flow/currency_conversion_model/currency_conversion_model_drift.json').readAsStringSync();
