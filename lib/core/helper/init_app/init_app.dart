import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../di/di.dart';

Future initializeApp() async {
  //Initializing getIt dependencies
  await initializeDependencies();

  //Loading .env file
  await dotenv.load(fileName: ".env");
}
