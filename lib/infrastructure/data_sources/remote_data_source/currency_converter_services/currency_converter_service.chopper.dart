// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_converter_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
final class _$CurrencyConverterService extends CurrencyConverterService {
  _$CurrencyConverterService([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final Type definitionType = CurrencyConverterService;

  @override
  Future<Response<List<CountryNamesWithFlagsModelDto>>>
      getAllCountriesAndCurrencies() {
    final Uri $url = Uri.parse('/countries');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CountryNamesWithFlagsModelDto>,
        CountryNamesWithFlagsModelDto>(
      $request,
      requestConverter: countryConversionModelDtoConverterRequestFactory,
      responseConverter: countryConversionModelDtoConverterResponseFactory,
    );
  }

  @override
  Future<Response<CurrencyConversionModelDto>> getCurrencyConversionNow(
      {required String fromAndToMultipleCurrencies}) {
    final Uri $url = Uri.parse('/convert?compact=ultra');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': fromAndToMultipleCurrencies
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<CurrencyConversionModelDto, CurrencyConversionModelDto>(
      $request,
      requestConverter: currencyConversionModelDtoRequestFactory,
      responseConverter: currencyConversionModelDtoResponseFactory,
    );
  }

  @override
  Future<Response<ConversionHistoryModelDto>> getCurrencyConversionHistory({
    required String fromAndToMultipleCurrencies,
    required String startDate,
    required String endDate,
  }) {
    final Uri $url = Uri.parse('/convert?compact=ultra');
    final Map<String, dynamic> $params = <String, dynamic>{
      'q': fromAndToMultipleCurrencies,
      'date': startDate,
      'endDate': endDate,
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<ConversionHistoryModelDto, ConversionHistoryModelDto>(
      $request,
      requestConverter: conversionHistoryModelDtoRequestFactory,
      responseConverter: conversionHistoryModelDtoResponseFactory,
    );
  }
}
