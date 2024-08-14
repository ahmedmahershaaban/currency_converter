import 'package:currency_converter/domain/data_sources/remote_data_source/flag_cdn_repository/flag_cdn_repository.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: FlagCdnRepository)
class FlagCdnRepositoryImpl implements FlagCdnRepository {
  final FlagCdnService flagCdnService;

  FlagCdnRepositoryImpl({required this.flagCdnService});

  @override
  Future<String?> getCountryFlag({required String countryCode}) {
    return flagCdnService.getCountryFlag(countryCode: countryCode).then(
          (value) => value.body,
        );
  }
}
