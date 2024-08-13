import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';

// Converts the response to List<CountryNamesWithFlagsModelDto>
Response<BodyType> countryConversionModelDtoConverterResponseFactory<BodyType, InnerType>(Response response) {
  final body = jsonDecode(response.body);

  if (body is Map<String, dynamic>) {
    // Check if 'results' key exists and is of type Map
    if (body.containsKey('results') && body['results'] is Map<String, dynamic>) {
      final results = body['results'] as Map<String, dynamic>;
      final countryNamesWithFlagsModelDtoList = results.entries.map((entry) {
        final country = entry.value as Map<String, dynamic>;
        return CountryNamesWithFlagsModelDto(
          countryFullName: country['name'],
          countryShortName: country['id'],
          currencyFlagSvg: null, // Will add this field from another API end point call
          countryAlpha3: country['alpha3'],
          currencyFullName: country['currencyName'],
          currencyId: country['currencyId'],
          currencySymbol: country['currencySymbol'],
        );
      }).toList();
      return response.copyWith<BodyType>(body: countryNamesWithFlagsModelDtoList as BodyType);
    } else {
      // Handle case where 'results' is not a list or key doesn't exist
      return response.copyWith<BodyType>(body: body as BodyType);
    }
  }

  // If the body is not a Map, return it as-is
  return response.copyWith<BodyType>(body: body as BodyType);
}

// Convert request if necessary
Request countryConversionModelDtoConverterRequestFactory(Request request) {
  // If you need to modify the request body or headers, do it here
  return request.copyWith(body: request.body);
}
