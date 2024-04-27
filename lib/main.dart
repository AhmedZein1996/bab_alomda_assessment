import 'package:bab_alomda_assessment/core/network/internet_connectivity_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/constants/app_strings.dart';
import 'core/helper/init_app/init_app.dart';
import 'core/router/app_router.dart';
import 'core/styling/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize app
  await initializeApp();
  runApp(BabAlomdaAssessment(appRouter: AppRouter()));
  setupInternetConnectivityListener();
}

final navigatorKey = GlobalKey<NavigatorState>();

class BabAlomdaAssessment extends StatelessWidget {
  final AppRouter appRouter;
  const BabAlomdaAssessment({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 852),
      splitScreenMode: true,
      fontSizeResolver: FontSizeResolvers.height,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        onGenerateRoute: appRouter.generateRoute,
        title: AppStrings.appTitle,
        theme: AppThemes.defaultTheme,
      ),
    );
  }
}
