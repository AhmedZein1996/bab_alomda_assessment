import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../constants/app_api_constants.dart';
import '../helper/navigator/navigator.dart';
import '../router/app_routes.dart';
import 'error_handler.dart';
import 'network_info.dart';

class ApiInterceptor implements Interceptor {
  final Dio _dio;
  final NetworkInfo _networkInfo;
  ApiInterceptor(this._dio, this._networkInfo);

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final isConnected = await _networkInfo.isConnected;
    if (isConnected) {
      if (options.extra.containsKey(ApiConstants.requireApiKey)) {
        options.queryParameters[ApiConstants.apiKey] = dotenv.get("API_KEY");
      }
      return handler.next(options);
    } else {
      final error = DioException(
          requestOptions: RequestOptions(),
          response: Response(
              requestOptions: RequestOptions(),
              statusCode: ResponseCode.NO_INTERNET_CONNECTION),
          type: DioExceptionType.connectionError);
      AppNavigator.pushNamedAndClearStack(AppRoutes.noConnectionRoute);
      return handler.reject(error);
    }
  }

  @override
  void onError(DioException error, ErrorInterceptorHandler handler) async {
    if ((error.response?.statusCode == ResponseCode.FORBIDDEN ||
        error.response?.statusCode == ResponseCode.UNAUTHORISED)) {
      try {
        final requestOptions = error.requestOptions;
        requestOptions.queryParameters[ApiConstants.apiKey] =
            dotenv.get("API_KEY");
        return handler.resolve(await _dio.fetch(requestOptions));
      } catch (e) {
        AppNavigator.pushNamedAndClearStack(AppRoutes.stories);
        return handler.reject(error);
      }
    }

    return handler.next(error);
  }
}
