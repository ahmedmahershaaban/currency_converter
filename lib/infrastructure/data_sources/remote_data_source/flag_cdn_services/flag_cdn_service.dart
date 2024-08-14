import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/converters/svg_to_string_converter.dart';
import 'package:injectable/injectable.dart';

part 'flag_cdn_service.chopper.dart';

@ChopperApi()
@injectable
abstract class FlagCdnService extends ChopperService {
  @Get(path: '/{countryCode}.svg')
  Future<Response<String?>> getCountryFlag({
    @Path('countryCode') required String countryCode,
  });

  @factoryMethod
  static FlagCdnService create({required String baseUrl}) {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [
        _$FlagCdnService(),
      ],
      converter: SvgToStringConverter(),
    );
    return _$FlagCdnService(client);
  }
}
