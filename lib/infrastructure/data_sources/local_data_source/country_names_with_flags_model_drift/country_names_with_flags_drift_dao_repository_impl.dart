import 'package:currency_converter/domain/data_sources/local_data_source/country_names_with_flags_drift_dao_repository/country_names_with_flags_drift_dao_repository.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CountryNamesWithFlagsDriftDaoRepository)
class CountryNamesWithFlagsDriftDaoRepositoryImpl extends CountryNamesWithFlagsDriftDaoRepository {
  final CountryNamesWithFlagsModelDriftDao countryNamesWithFlagsModelDriftDao;

  CountryNamesWithFlagsDriftDaoRepositoryImpl({required this.countryNamesWithFlagsModelDriftDao});

  @override
  Future<int> deleteCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) {
    return countryNamesWithFlagsModelDriftDao.deleteCountryWithFlags(countryWithFlag);
  }

  @override
  Future<List<CountryNamesWithFlagsModelDrift>> getAllCountriesWithFlags() {
    return countryNamesWithFlagsModelDriftDao.getAllCountriesWithFlags();
  }

  @override
  Future<int> insertCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) {
    return countryNamesWithFlagsModelDriftDao.insertCountryWithFlags(countryWithFlag);
  }

  @override
  Future<bool> updateCountryWithFlags(Insertable<CountryNamesWithFlagsModelDrift> countryWithFlag) {
    return countryNamesWithFlagsModelDriftDao.updateCountryWithFlags(countryWithFlag);
  }

  @override
  Stream<List<CountryNamesWithFlagsModelDrift>> watchAllCountriesWithFlags() {
    return countryNamesWithFlagsModelDriftDao.watchAllCountriesWithFlags();
  }
}
