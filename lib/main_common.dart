import 'package:currency_converter/infrastructure/core/config_reader.dart';
import 'package:currency_converter/infrastructure/core/injection/injection.dart';
import 'package:flutter/material.dart';

Future<void> mainCommon(String env) async {
  // Always call this if the main method is asynchronous
  WidgetsFlutterBinding.ensureInitialized();

  // Load the JSON config into memory
  await ConfigReader.initialize(env);

  // Init the environment specific
  await configureInjection(env);

  // Register the base URLs and API keys
  getIt.registerSingleton<String>(ConfigReader.countriesFlagBaseAPI, instanceName: 'flagCdnBaseUrl');
  getIt.registerSingleton<String>(ConfigReader.currencyConverterBaseAPI, instanceName: 'currencyConverterBaseUrl');
  getIt.registerSingleton<String>(ConfigReader.currencyConverterAPIKey, instanceName: 'currencyConverterApiKey');
}
