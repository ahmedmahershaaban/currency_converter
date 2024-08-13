import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/converters/conversion_history_model_dto_converter.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/converters/country_conversion_model_dto_converter.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/converters/currency_conversion_model_dto_converter.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/interceptors/currency_converter_server_interceptors.dart';
import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/currency_conversion_model_dto/currency_conversion_model_dto.dart';

part 'currency_converter_service.chopper.dart';

@ChopperApi()
abstract class CurrencyConverterService extends ChopperService {
  @FactoryConverter(
    request: countryConversionModelDtoConverterRequestFactory,
    response: countryConversionModelDtoConverterResponseFactory,
  )
  @Get(path: '/countries')
  Future<Response<List<CountryNamesWithFlagsModelDto>>> getAllCountriesAndCurrencies();

  @FactoryConverter(
    request: currencyConversionModelDtoRequestFactory,
    response: currencyConversionModelDtoResponseFactory,
  )
  @Get(path: '/convert?compact=ultra')
  Future<Response<CurrencyConversionModelDto>> getCurrencyConversionNow({
    @Query('q') required String fromAndToMultipleCurrencies,
  });

  @FactoryConverter(
    request: conversionHistoryModelDtoRequestFactory,
    response: conversionHistoryModelDtoResponseFactory,
  )
  @Get(path: '/convert?compact=ultra')
  Future<Response<ConversionHistoryModelDto>> getCurrencyConversionHistory({
    @Query('q') required String fromAndToMultipleCurrencies,
    @Query('date') required String startDate,
    @Query('endDate') required String endDate,
  });

  static CurrencyConverterService create({required String baseUrl, required String apiKey}) {
    final client = ChopperClient(
      baseUrl: Uri.parse(baseUrl),
      services: [
        _$CurrencyConverterService(),
      ],
      interceptors: [
        CurrencyConverterServiceAddApiKeyInterceptor(apiKey),
      ],
    );
    return _$CurrencyConverterService(client);
  }
}
