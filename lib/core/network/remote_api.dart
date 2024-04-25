import 'package:bab_alomda_assessment/core/network/response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../constants/app_api_constants.dart';

part 'remote_api.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class RemoteApi {
  factory RemoteApi(Dio dio, {String baseUrl}) = _RemoteApi;

  @GET(ApiConstants.sectionPath)
  @Extra({ApiConstants.requireApiKey: true})
  Future<ResponseModel> getStories(@Path('section') String section);
}
