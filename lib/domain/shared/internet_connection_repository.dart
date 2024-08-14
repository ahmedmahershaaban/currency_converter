/// Interface for checking internet connection
abstract class InternetConnectionRepository {
  /// Returns true if there is internet connection, false otherwise
  Future<bool> get hasInternetAccess;
}
