import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// This Module is responsible to register all [ThirdPartyLibrariesModule] modules using [GetIt].
@module
abstract class ThirdPartyLibrariesModule {
  @lazySingleton
  Connectivity get connectivity => Connectivity();

  @lazySingleton
  InternetConnection get internetConnection => InternetConnection();

  @preResolve
  Future<SharedPreferences> get sharedPreference => SharedPreferences.getInstance();
}
