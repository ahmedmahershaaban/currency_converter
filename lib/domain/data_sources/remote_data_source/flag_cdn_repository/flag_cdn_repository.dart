/// FlagCdnRepository is an abstract class that is used to define the methods that will be used
/// to get the country flag from the CDN.
abstract class FlagCdnRepository {
  /// This method will get the country flag from the CDN for the given country code.
  /// It will return the country flag in the form of a [String] or null in case of failure.
  Future<String?> getCountryFlag({required String countryCode});
}
