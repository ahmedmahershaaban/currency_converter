import 'package:chopper/chopper.dart';

class SvgToStringConverter implements Converter {
  @override
  Request convertRequest(Request request) {
    // For the request conversion, you can handle it as needed.
    // In this case, we're not modifying the request body.
    return request;
  }

  @override
  Response<BodyType> convertResponse<BodyType, InnerType>(Response response) {
    if (response.headers['Content-Type']?.contains('image/svg+xml') ?? false) {
      // Convert response body to String if the content type is SVG
      final body = response.body;
      if (body is String) {
        return response.copyWith<BodyType>(body: body as BodyType);
      } else {
        // Handle unexpected response body type
        return response.copyWith<BodyType>(body: body.toString() as BodyType);
      }
    }
    // If the content type is not SVG, return the response as is
    return response.copyWith<BodyType>(body: response.body as BodyType);
  }
}
