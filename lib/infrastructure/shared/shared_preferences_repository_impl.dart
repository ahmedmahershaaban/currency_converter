import 'package:currency_converter/domain/shared/shared_preferences_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@LazySingleton(as: SharedPreferencesRepository)
class SharedPreferencesRepositoryImpl implements SharedPreferencesRepository {
  final SharedPreferences sharedPreferences;

  SharedPreferencesRepositoryImpl(this.sharedPreferences);

  @override
  String? getString(String key) {
    return sharedPreferences.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }
}
