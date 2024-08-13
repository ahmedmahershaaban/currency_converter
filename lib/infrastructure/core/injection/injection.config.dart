// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:currency_converter/application/core/internet_connection/internet_connection_bloc.dart'
    as _i486;
import 'package:currency_converter/application/core/theme/theme_bloc.dart'
    as _i627;
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart'
    as _i59;
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart'
    as _i772;
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart'
    as _i482;
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart'
    as _i500;
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart'
    as _i387;
import 'package:currency_converter/infrastructure/core/third_party_libraries_module.dart'
    as _i533;
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart'
    as _i316;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart'
    as _i295;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart'
    as _i117;
import 'package:currency_converter/infrastructure/user_flow/user_flow_facade.dart'
    as _i716;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart'
    as _i161;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final thirdPartyLibrariesModule = _$ThirdPartyLibrariesModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyLibrariesModule.sharedPreference,
      preResolve: true,
    );
    gh.lazySingleton<_i895.Connectivity>(
        () => thirdPartyLibrariesModule.connectivity);
    gh.lazySingleton<_i161.InternetConnection>(
        () => thirdPartyLibrariesModule.internetConnection);
    gh.lazySingleton<_i772.IUserFlowFacade>(() => _i716.UserFlowFacade(
          gh<_i117.FlagCdnService>(),
          gh<_i295.CurrencyConverterService>(),
          gh<_i316.CountryNamesWithFlagsModelDriftDao>(),
          gh<_i161.InternetConnection>(),
        ));
    gh.lazySingleton<_i627.ThemeBloc>(
        () => _i627.ThemeBloc(gh<_i460.SharedPreferences>()));
    gh.singleton<_i486.InternetConnectionBloc>(
        () => _i486.InternetConnectionBloc(
              gh<_i895.Connectivity>(),
              gh<_i161.InternetConnection>(),
            ));
    gh.lazySingleton<_i482.GetAllCountriesNamesAndFlags>(
        () => _i482.GetAllCountriesNamesAndFlags(gh<_i772.IUserFlowFacade>()));
    gh.lazySingleton<_i500.GetCurrencyConversionHistory>(
        () => _i500.GetCurrencyConversionHistory(gh<_i772.IUserFlowFacade>()));
    gh.lazySingleton<_i387.GetCurrencyConversionNow>(
        () => _i387.GetCurrencyConversionNow(gh<_i772.IUserFlowFacade>()));
    gh.lazySingleton<_i59.UserFlowBloc>(() => _i59.UserFlowBloc(
          gh<_i482.GetAllCountriesNamesAndFlags>(),
          gh<_i500.GetCurrencyConversionHistory>(),
          gh<_i387.GetCurrencyConversionNow>(),
        ));
    return this;
  }
}

class _$ThirdPartyLibrariesModule extends _i533.ThirdPartyLibrariesModule {}
