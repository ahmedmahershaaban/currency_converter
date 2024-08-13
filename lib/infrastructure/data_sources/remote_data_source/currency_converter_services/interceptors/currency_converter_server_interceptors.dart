import 'dart:async';

import 'package:chopper/chopper.dart';

class CurrencyConverterServiceAddApiKeyInterceptor implements Interceptor {
  CurrencyConverterServiceAddApiKeyInterceptor(this.apiKey);

  final String apiKey;

  @override
  FutureOr<Response<BodyType>> intercept<BodyType>(Chain<BodyType> chain) {
    // Append the API key as a query parameter to the request URL
    final updatedUrl = chain.request.uri.replace(
      queryParameters: {
        ...chain.request.url.queryParameters,
        'apiKey': apiKey,
      },
    );
    // Return the updated request
    return chain.proceed(chain.request.copyWith(uri: updatedUrl));
  }
}
