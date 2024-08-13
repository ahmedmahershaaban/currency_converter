import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';

// Converts the response to List<CountryNamesWithFlagsModelDto>
Response<BodyType> conversionHistoryModelDtoResponseFactory<BodyType, InnerType>(Response response) {
  final body = jsonDecode(response.body);

  if (body is Map<String, dynamic>) {
    final fromMap = body.values.elementAt(0) as Map<String, dynamic>;
    final toMap = body.values.elementAt(1) as Map<String, dynamic>;
    final Map<String, double> fromMapParsed = {};
    final Map<String, double> toMapParsed = {};
    fromMap.forEach((key, value) {
      fromMapParsed[key] = value.toDouble();
    });
    toMap.forEach((key, value) {
      toMapParsed[key] = value.toDouble();
    });

    final conversionHistoryModelDto = ConversionHistoryModelDto(
      fromToConversionHistory: fromMapParsed,
      toFromConversionHistory: toMapParsed,
    );
    return response.copyWith<BodyType>(body: conversionHistoryModelDto as BodyType);
  } else {
    // Handle case where 'results' is not a list or key doesn't exist
    return response.copyWith<BodyType>(body: body as BodyType);
  }
}

// Convert request if necessary
Request conversionHistoryModelDtoRequestFactory(Request request) {
  // If you need to modify the request body or headers, do it here
  return request.copyWith(body: request.body);
}
