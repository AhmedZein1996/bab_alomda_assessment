import 'package:bab_alomda_assessment/core/helper/di/di.dart';
import 'package:bab_alomda_assessment/core/widgets/no_internet_screen.dart';
import 'package:bab_alomda_assessment/features/stories/data/model/story_model.dart';
import 'package:bab_alomda_assessment/features/stories/logic/story_cubit.dart';
import 'package:bab_alomda_assessment/features/stories/ui/pages/article_web_view.dart';
import 'package:bab_alomda_assessment/features/stories/ui/pages/detail_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/stories/ui/pages/home_view.dart';
import '../exports/exports.dart';
import 'app_routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.stories:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) =>
                    getIt<StoryCubit>()..getTopStories(),
                child: const HomeScreen()),
            settings: settings);
      case AppRoutes.storiesDetails:
        return MaterialPageRoute(
            builder: (_) =>
                DetailScreen(storyModel: settings.arguments as StoryModel),
            settings: settings);
      case AppRoutes.articleWebView:
        return MaterialPageRoute(
            builder: (_) => ArticleWebView(url: settings.arguments as String),
            settings: settings);
      case AppRoutes.noConnectionRoute:
        return MaterialPageRoute(
            builder: (_) => const NoInternetScreen(), settings: settings);

      default:
        return null;
    }
  }
}
