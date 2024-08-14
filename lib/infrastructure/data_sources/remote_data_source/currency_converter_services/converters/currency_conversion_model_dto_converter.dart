import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/user_flow/currency_conversion_model_dto/currency_conversion_model_dto.dart';

// Converts the response to List<CountryNamesWithFlagsModelDto>
Response<BodyType> currencyConversionModelDtoResponseFactory<BodyType, InnerType>(Response response) {
  final body = jsonDecode(response.body);

  if (body is Map<String, dynamic>) {
    final mapValues = body.values.toList();
    final currencyConversionModelDto = CurrencyConversionModelDto(
      fromToConversion: mapValues[0],
      toFromConversion: mapValues[1],
    );
    return response.copyWith<BodyType>(body: currencyConversionModelDto as BodyType);
  } else {
    // Handle case where 'results' is not a list or key doesn't exist
    return response.copyWith<BodyType>(body: body as BodyType);
  }
}

// Convert request if necessary
Request currencyConversionModelDtoRequestFactory(Request request) {
  // If you need to modify the request body or headers, do it here
  return request.copyWith(body: request.body);
}
