import 'package:bab_alomda_assessment/features/stories/data/datasources/new_york_times_stories_datasource.dart';
import 'package:bab_alomda_assessment/features/stories/data/repositories/new_york_times_stories_repository.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:get_it/get_it.dart';

import '../../network/dio_factory.dart';
import '../../network/remote_api.dart';

final getIt = GetIt.instance;

Future initializeDependencies() async {
  // EXTERNAL
  getIt.registerLazySingleton(() => RemoteApi(DioFactory.get()));

  // DATASOURCE
  getIt.registerLazySingleton(() => NewYorkTimesStoriesDatasource(getIt()));

  // REPOSITORY
  getIt.registerLazySingleton(() => NewYorkTimesStoriesRepository(getIt()));

  // CUBITS
  getIt.registerFactory(() => StoryCubit(getIt()));
}
