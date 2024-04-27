import 'dart:developer';

import 'package:bab_alomda_assessment/core/helper/enums/enums.dart';

import '../../../../core/network/remote_api.dart';
import '../../../../core/network/response_model.dart';

abstract class BaseNewYorkTimesStoriesDatasource {
  Future<ResponseModel> getTopStories();
  Future<ResponseModel> getFilterStories(String section);
//  Future<ResponseModel> searchAthletes(String searchText);
}

class NewYorkTimesStoriesDatasource
    implements BaseNewYorkTimesStoriesDatasource {
  final RemoteApi _remoteApi;
  const NewYorkTimesStoriesDatasource(this._remoteApi);

  @override
  Future<ResponseModel> getTopStories() async {
    final result = await _remoteApi.getStories(SectionFilter.home.value);
    log("result is ${result.results}");
    return result;
  }

  @override
  Future<ResponseModel> getFilterStories(String section) async {
    final result = await _remoteApi.getStories(section);
    return result;
  }

  // @override
  // Future<ResponseModel> searchAthletes(String searchText) async {
  //   final result = await _remoteApi.searchAthletes(0, 1000, searchText);
  //   return result;
  // }
}
