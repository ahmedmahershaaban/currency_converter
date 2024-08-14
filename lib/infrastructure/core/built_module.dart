import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @Injectable()
  CountryNamesWithFlagsModelDriftDao get countryNamesWithFlagsModelDriftDao;

  // @Injectable()
  // CurrencyConverterService get currencyConverterService;
  //
  // @Injectable()
  // FlagCdnService get flagCdnService;
}
