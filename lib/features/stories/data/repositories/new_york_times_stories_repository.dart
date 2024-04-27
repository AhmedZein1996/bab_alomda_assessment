import 'dart:developer';

import 'package:bab_alomda_assessment/core/network/response_model.dart';
import 'package:bab_alomda_assessment/features/stories/data/datasources/new_york_times_stories_datasource.dart';
import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/error_handler.dart';
import '../../../../core/network/failure.dart';

class NewYorkTimesStoriesRepository {
  final NewYorkTimesStoriesDatasource _storiesDS;
  const NewYorkTimesStoriesRepository(this._storiesDS);

  Future<Either<Failure, List<StoryModel>>> getTopStories() async {
    try {
      final ResponseModel response = await _storiesDS.getTopStories();
      final storyJsonList = List.from(response.results);
      log('storyJsonList $storyJsonList');
      final stories = storyJsonList
          .map((storyJson) =>
              StoryModel.fromJson(Map<String, dynamic>.from(storyJson)))
          .toList();

      return Right(stories);
    } catch (e) {
      log("$e");
      return Left(ErrorHandler(e).failure);
    }
  }

  Future<Either<Failure, List<StoryModel>>> getFilterStories(
      String sections) async {
    try {
      final response = await _storiesDS.getFilterStories(sections);
      final storyJsonList = List.from(response.results);

      final stories = storyJsonList
          .map((storyJson) =>
              StoryModel.fromJson(Map<String, dynamic>.from(storyJson)))
          .toList();

      return Right(stories);
    } catch (e) {
      return Left(ErrorHandler(e).failure);
    }
  }

  // Future<Either<Failure, List<AthleteModel>>> searchAthletes(
  //     String searchText) async {
  //   try {
  //     final response = await _storiesDS.searchAthletes(searchText);
  //     final athleteJsonList =
  //         List.from(Map<String, dynamic>.from(response.data)["avatars"]);
  //
  //     final athletes = athleteJsonList
  //         .map((athleteJson) =>
  //             AthleteModel.fromJson(Map<String, dynamic>.from(athleteJson)))
  //         .toList();
  //
  //     return Right(athletes);
  //   } catch (e) {
  //     debugPrint(e.toString());
  //     if (e is DioException) {
  //       debugPrint(e.response?.statusMessage);
  //     }
  //     return Left(ErrorHandler(e).failure);
  //   }
  // }
}
