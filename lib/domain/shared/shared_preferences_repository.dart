/// Interface for the shared preferences repository.
abstract class SharedPreferencesRepository {
  /// Sets a string value in the shared preferences.
  Future<bool> setString(String key, String value);

  /// Gets a string value from the shared preferences.
  String? getString(String key);
}
