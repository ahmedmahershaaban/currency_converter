import 'package:currency_converter/infrastructure/core/config_reader.dart';
import 'package:currency_converter/infrastructure/core/injection/injection.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON config into memory
  await ConfigReader.initialize(env);

  // Init the environment specific
  await configureInjection(env);

  getIt.registerSingleton<FlagCdnService>(FlagCdnService.create(
    baseUrl: ConfigReader.countriesFlagBaseAPI,
  ));
  getIt.registerSingleton<CurrencyConverterService>(CurrencyConverterService.create(
    baseUrl: ConfigReader.currencyConverterBaseAPI(),
    apiKey: ConfigReader.currencyConverterAPIKey(),
  ));

  final localDB = AppDatabase();
  getIt.registerLazySingleton<CountryNamesWithFlagsModelDriftDao>(() => localDB.countryNamesWithFlagsModelDriftDao);
}
