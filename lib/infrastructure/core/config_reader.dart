import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:injectable/injectable.dart';

/// Config Reader is responsible to get the secret keys for each environment variable
/// and provide them by initialize lazy singleton interface to get them throw the application.
abstract class ConfigReader {
  static Map<String, dynamic> _config = {};

  static Future<void> initialize(String env) async {
    String path = "config/app_config_prod.json";
    switch (env) {
      case Environment.prod:
        path = "config/app_config_prod.json";
      case Environment.dev:
        path = "config/app_config_dev.json";
      case Environment.test:
        path = "config/app_config_qa.json";
    }
    final configString = await rootBundle.loadString(path);
    _config = json.decode(configString) as Map<String, dynamic>;
  }

  static String get countriesFlagBaseAPI => _config['countriesFlagBaseAPI'] as String;

  static String get currencyConverterBaseAPI => _config['currencyConverterBaseAPI'] as String;

  static String get currencyConverterAPIKey => _config['currencyConverterAPIKey'] as String;

  static String get currencyFreaksBaseAPI => _config['currencyFreaksBaseAPI'] as String;

  static String get currencyFreaksAPIKey => _config['currencyFreaksAPIKey'] as String;
}
