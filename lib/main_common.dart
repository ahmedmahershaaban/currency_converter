import 'package:currency_converter/domain/data_sources/local_data_source/country_names_with_flags_drift_dao_repository/country_names_with_flags_drift_dao_repository.dart';
import 'package:currency_converter/domain/data_sources/remote_data_source/currency_converter_repositroy/currency_converter_repository.dart';
import 'package:currency_converter/domain/data_sources/remote_data_source/flag_cdn_repository/flag_cdn_repository.dart';
import 'package:currency_converter/infrastructure/core/config_reader.dart';
import 'package:currency_converter/infrastructure/core/injection/injection.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_drift_dao_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_repository_impl.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON config into memory
  await ConfigReader.initialize(env);

  // Init the environment specific
  await configureInjection(env);

  getIt.registerLazySingleton<FlagCdnRepository>(() => FlagCdnRepositoryImpl(
          flagCdnService: FlagCdnService.create(
        baseUrl: ConfigReader.countriesFlagBaseAPI,
      )));

  getIt.registerLazySingleton<CurrencyConverterRepository>(() => CurrencyConverterRepositoryImpl(
          currencyConverterService: CurrencyConverterService.create(
        baseUrl: ConfigReader.currencyConverterBaseAPI(),
        apiKey: ConfigReader.currencyConverterAPIKey(),
      )));

  final db = AppDatabase();
  getIt.registerLazySingleton<CountryNamesWithFlagsDriftDaoRepository>(
    () => CountryNamesWithFlagsDriftDaoRepositoryImpl(
      countryNamesWithFlagsModelDriftDao: db.countryNamesWithFlagsModelDriftDao,
    ),
  );
}
