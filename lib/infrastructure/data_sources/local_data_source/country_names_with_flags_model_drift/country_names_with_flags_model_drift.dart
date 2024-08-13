import 'dart:async';

import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'country_names_with_flags_model_drift.g.dart';

@DataClassName('CountryNamesWithFlagsModelDrift')
class CountryNamesWithFlags extends Table {
  TextColumn get countryFullName => text().withLength(min: 1, max: 50)();
  TextColumn get countryShortName => text().withLength(min: 1, max: 7)();
  TextColumn get currencyFlagSvg => text()();
  TextColumn get countryAlpha3 => text().withLength(min: 1, max: 7)();
  TextColumn get currencyFullName => text().withLength(min: 1, max: 50)();
  TextColumn get currencyId => text().withLength(min: 1, max: 7)();
  TextColumn get currencySymbol => text().withLength(min: 1, max: 30)();
}

@DriftDatabase(tables: [CountryNamesWithFlags], daos: [CountryNamesWithFlagsModelDriftDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(driftDatabase(name: 'my_database'));

  @override
  int get schemaVersion => 1;
}

@DriftAccessor(tables: [CountryNamesWithFlags])
class CountryNamesWithFlagsModelDriftDao extends DatabaseAccessor<AppDatabase> with _$CountryNamesWithFlagsModelDriftDaoMixin {
  final AppDatabase db;
  CountryNamesWithFlagsModelDriftDao(this.db) : super(db);

  Stream<List<CountryNamesWithFlagsModelDrift>> watchAllCountriesWithFlags() => select(countryNamesWithFlags).watch();
  Future<List<CountryNamesWithFlagsModelDrift>> getAllCountriesWithFlags() => select(countryNamesWithFlags).get();
  Future insertCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) => into(countryNamesWithFlags).insert(countryWithFlag);
  Future updateCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) =>
      update(countryNamesWithFlags).replace(countryWithFlag);
  Future deleteCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) => delete(countryNamesWithFlags).delete(countryWithFlag);
}
