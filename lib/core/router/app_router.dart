import '../exports/exports.dart';
import 'app_routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.stories:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(), settings: settings);

      default:
        return null;
    }
  }

  List<Route<dynamic>> generateInitialRoute(String route) {
    return [MaterialPageRoute(builder: (_) => HomeScreen())];
  }
}
