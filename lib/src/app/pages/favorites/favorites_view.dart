import 'package:acceso_movilidad/src/app/pages/favorites/favorites_controller.dart';
import 'package:acceso_movilidad/src/app/widgets/amCard/AMCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../utils/constants.dart';

class FavoritesPage extends View {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  FavoritesPageState createState() =>
      // inject dependencies inwards
      FavoritesPageState();
}

class FavoritesPageState extends ViewState<FavoritesPage, FavoritesController> {
  FavoritesPageState() : super(FavoritesController());

  @override
  // TODO: implement view
  Widget get view {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cocktails Fav'),
        ),
        drawer: Drawer(
          child: AMConstants.drawer,
        ),
        body: ControlledWidgetBuilder<FavoritesController>(
          builder: (context, controller) => SingleChildScrollView(
            child: Column(
              children: [
                for (final cocktail in controller.favorites) ...[
                  LayoutHelper.dividerH,
                  AMCard(
                    cocktail: cocktail,
                    controller: controller,
                  ),
                  LayoutHelper.dividerH
                ],
              ],
            ),
          ),
        ));
  }
}
