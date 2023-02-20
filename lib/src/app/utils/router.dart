import 'package:acceso_movilidad/src/app/pages/pages.dart';
import 'package:flutter/material.dart';

class AMRouter {
  final RouteObserver<PageRoute> routeObserver;

  AMRouter() : routeObserver = RouteObserver<PageRoute>();

  Route<dynamic>? getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Pages.home:
        return _buildRoute(settings, const HomePage());
      case Pages.ingredients:
        return _buildRoute(settings, const IngredientsPage());
      case Pages.details:
        // Map args = settings.arguments as Map;
        return _buildRoute(settings,
            DetailsPage(routeObserver, name: settings.arguments.toString()));
      case Pages.favorites:
        return _buildRoute(settings, const FavoritesPage());
      default:
        return null;
    }
  }

  MaterialPageRoute _buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (ctx) => builder,
    );
  }
}
