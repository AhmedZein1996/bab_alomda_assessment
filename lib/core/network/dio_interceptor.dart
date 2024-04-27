import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_api_constants.dart';

class ApiInterceptor implements Interceptor {
  ApiInterceptor();

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.extra.containsKey(ApiConstants.requireApiKey)) {
      options.queryParameters[ApiConstants.apiKey] = dotenv.get("API_KEY");
    }
    return handler.next(options);
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    return handler.next(error);
  }
}
