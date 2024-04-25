import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

import '../../network/dio_factory.dart';
import '../../network/network_info.dart';
import '../../network/remote_api.dart';

final getIt = GetIt.instance;

Future initializeDependencies() async {
  final NetworkInfo networkInfo = NetworkInfoImpl(InternetConnectionChecker());
  getIt.registerLazySingleton(() => networkInfo);
  getIt.registerLazySingleton(() => RemoteApi(DioFactory.get(getIt())));
}
