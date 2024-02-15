import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/constants/app_typography.dart';
import 'package:flutter_api/presentation/pages/bookmark_page.dart';
import 'package:flutter_api/presentation/pages/detail_page.dart';
import 'package:flutter_api/presentation/pages/home_page.dart';
import 'package:flutter_api/presentation/routes/screen_routes.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return _getPageRoute(
        routeName: settings.name,
        screen: const HomePage(),
      );
    case Routes.bookmark:
      return _getPageRoute(
        routeName: settings.name,
        screen: const BookmarkPage(),
      );
    case Routes.detail:
      final args = settings.arguments;
      if (args is String) {
        return _getPageRoute(
          routeName: settings.name,
          screen: DetailPage(
            imdbID: args,
          ),
        );
      } else {
        return _getPageRoute(
          routeName: settings.name,
          screen: const Scaffold(
            body: Center(
              child: Text(
                'Invalid arguments for DetailPage',
                style: AppTypography.homeMessage,
              ),
            ),
          ),
        );
      }
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text(
              'No Routes defined for ${settings.name}',
              style: const TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String? routeName, Widget? screen}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => screen!,
  );
}