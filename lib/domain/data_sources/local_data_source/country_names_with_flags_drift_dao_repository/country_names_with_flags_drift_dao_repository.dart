import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:drift/drift.dart';

/// Data Access Object for the country names with flags table.
/// Contains the necessary queries for the table.
abstract class CountryNamesWithFlagsDriftDaoRepository {
  /// Watches all the countries with flags.
  /// Returns a stream of [CountryNamesWithFlagsModelDrift].
  /// The stream will be stopped when error occurs.
  Stream<List<CountryNamesWithFlagsModelDrift>> watchAllCountriesWithFlags();

  /// Gets all the countries with flags.
  /// Returns a list of [CountryNamesWithFlagsModelDrift].
  /// The stream will be stopped when error occurs.
  Future<List<CountryNamesWithFlagsModelDrift>> getAllCountriesWithFlags();

  /// Inserts a country with flags.
  Future insertCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag);

  /// Updates a country with flags.
  Future updateCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag);

  /// Deletes a country with flags.
  Future deleteCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag);
}
