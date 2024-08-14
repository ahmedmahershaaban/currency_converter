// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:currency_converter/application/shared/internet_connection/internet_connection_bloc.dart'
    as _i736;
import 'package:currency_converter/application/shared/theme/theme_bloc.dart'
    as _i391;
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart'
    as _i59;
import 'package:currency_converter/domain/data_sources/local_data_source/country_names_with_flags_drift_dao_repository/country_names_with_flags_drift_dao_repository.dart'
    as _i59;
import 'package:currency_converter/domain/data_sources/remote_data_source/currency_converter_repositroy/currency_converter_repository.dart'
    as _i1062;
import 'package:currency_converter/domain/data_sources/remote_data_source/flag_cdn_repository/flag_cdn_repository.dart'
    as _i279;
import 'package:currency_converter/domain/shared/connectivity_repository.dart'
    as _i1000;
import 'package:currency_converter/domain/shared/internet_connection_repository.dart'
    as _i674;
import 'package:currency_converter/domain/shared/shared_preferences_repository.dart'
    as _i127;
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart'
    as _i772;
import 'package:currency_converter/domain/user_flow/usecases/get_all_countries_names_and_flags.dart'
    as _i482;
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_history.dart'
    as _i500;
import 'package:currency_converter/domain/user_flow/usecases/get_currency_conversion_now.dart'
    as _i387;
import 'package:currency_converter/infrastructure/core/built_module.dart'
    as _i493;
import 'package:currency_converter/infrastructure/core/third_party_libraries_module.dart'
    as _i533;
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_drift_dao_repository_impl.dart'
    as _i233;
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart'
    as _i316;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_repository_impl.dart'
    as _i302;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart'
    as _i295;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_repository_impl.dart'
    as _i212;
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart'
    as _i117;
import 'package:currency_converter/infrastructure/shared/connectivity_repository_impl.dart'
    as _i139;
import 'package:currency_converter/infrastructure/shared/internet_connection_repository_impl.dart'
    as _i646;
import 'package:currency_converter/infrastructure/shared/shared_preferences_repository_impl.dart'
    as _i533;
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
    final registerModule = _$RegisterModule(this);
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => thirdPartyLibrariesModule.sharedPreference,
      preResolve: true,
    );
    gh.factory<_i316.AppDatabase>(() => _i316.AppDatabase());
    gh.lazySingleton<_i895.Connectivity>(
        () => thirdPartyLibrariesModule.connectivity);
    gh.lazySingleton<_i161.InternetConnection>(
        () => thirdPartyLibrariesModule.internetConnection);
    gh.lazySingleton<_i674.InternetConnectionRepository>(() =>
        _i646.InternetConnectionRepositoryImpl(gh<_i161.InternetConnection>()));
    gh.lazySingleton<_i1000.ConnectivityRepository>(
        () => _i139.ConnectivityRepositoryImpl(gh<_i895.Connectivity>()));
    gh.factory<_i316.CountryNamesWithFlagsModelDriftDao>(
        () => registerModule.countryNamesWithFlagsModelDriftDao);
    gh.lazySingleton<_i127.SharedPreferencesRepository>(() =>
        _i533.SharedPreferencesRepositoryImpl(gh<_i460.SharedPreferences>()));
    gh.factory<_i295.CurrencyConverterService>(
        () => _i295.CurrencyConverterService.create(
              baseUrl: gh<String>(),
              apiKey: gh<String>(),
            ));
    gh.factory<_i117.FlagCdnService>(
        () => _i117.FlagCdnService.create(baseUrl: gh<String>()));
    gh.lazySingleton<_i59.CountryNamesWithFlagsDriftDaoRepository>(() =>
        _i233.CountryNamesWithFlagsDriftDaoRepositoryImpl(
            countryNamesWithFlagsModelDriftDao:
                gh<_i316.CountryNamesWithFlagsModelDriftDao>()));
    gh.singleton<_i736.InternetConnectionBloc>(
        () => _i736.InternetConnectionBloc(
              gh<_i1000.ConnectivityRepository>(),
              gh<_i674.InternetConnectionRepository>(),
            ));
    gh.lazySingleton<_i1062.CurrencyConverterRepository>(() =>
        _i302.CurrencyConverterRepositoryImpl(
            currencyConverterService: gh<_i295.CurrencyConverterService>()));
    gh.lazySingleton<_i279.FlagCdnRepository>(() => _i212.FlagCdnRepositoryImpl(
        flagCdnService: gh<_i117.FlagCdnService>()));
    gh.lazySingleton<_i391.ThemeBloc>(
        () => _i391.ThemeBloc(gh<_i127.SharedPreferencesRepository>()));
    gh.lazySingleton<_i772.IUserFlowFacade>(() => _i716.UserFlowFacade(
          gh<_i279.FlagCdnRepository>(),
          gh<_i1062.CurrencyConverterRepository>(),
          gh<_i59.CountryNamesWithFlagsDriftDaoRepository>(),
          gh<_i674.InternetConnectionRepository>(),
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

class _$RegisterModule extends _i493.RegisterModule {
  _$RegisterModule(this._getIt);

  final _i174.GetIt _getIt;

  @override
  _i316.CountryNamesWithFlagsModelDriftDao
      get countryNamesWithFlagsModelDriftDao =>
          _i316.CountryNamesWithFlagsModelDriftDao(_getIt<_i316.AppDatabase>());
}
