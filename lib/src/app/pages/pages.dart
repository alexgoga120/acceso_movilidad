import 'package:acceso_movilidad/src/app/models/menu_options.dart';

import 'package:acceso_movilidad/src/app/pages/favorites/favorites_view.dart';
export 'package:acceso_movilidad/src/app/pages/favorites/favorites_view.dart';

import 'package:acceso_movilidad/src/app/pages/home/home_view.dart';
export 'package:acceso_movilidad/src/app/pages/home/home_view.dart';

import 'package:acceso_movilidad/src/app/pages/ingredients/ingredients_view.dart';
export 'package:acceso_movilidad/src/app/pages/ingredients/ingredients_view.dart';

export 'package:acceso_movilidad/src/app/pages/details/details_view.dart';

import 'package:flutter/material.dart';

import 'details/details_view.dart';

class Pages {
  static const initialRoute = home;
  static const String home = '/home';
  static const String ingredients = '/ingredients';
  static const String details = '/details';
  static const String favorites = '/favorites';

  static final menuOptions = <MenuOptions>[
    MenuOptions(
        name: 'Home',
        route: home,
        icon: Icons.home_filled,
        screen: const HomePage()),
    MenuOptions(
        name: 'ingredients',
        route: ingredients,
        icon: Icons.local_bar,
        screen: const IngredientsPage()),
    MenuOptions(
        name: 'favorites',
        route: favorites,
        icon: Icons.star,
        screen: const FavoritesPage())
  ];

  static Map<String, Widget Function(BuildContext)> routes() {
    Map<String, Widget Function(BuildContext)> appRoutes = {};

    for (final option in menuOptions) {
      appRoutes.addAll({option.route: (BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => const HomePage());
  }
}
