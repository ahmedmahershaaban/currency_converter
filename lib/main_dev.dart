import 'package:currency_converter/main_common.dart';
import 'package:currency_converter/presentation/core/app_config.dart';
import 'package:currency_converter/presentation/core/app_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

Future<void> main() async {
  // Main init of the app and needed packages! for all the environment [Common Init]
  await mainCommon(Environment.dev);

  // Continue Init the needed packages and loading of files

  final configureApp = AppConfig(
    appTitle: '[DEV] Currency Converter',
    buildFlavor: Environment.dev,
    iconAssets: 'assets/launcher_icon/currency_converter_dev.png',
    child: AppWidget(),
  );

  runApp(configureApp);
}
