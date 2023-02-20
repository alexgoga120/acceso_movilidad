import 'package:acceso_movilidad/src/app/widgets/amCustomImg/amCustomImg.dart';
import 'package:acceso_movilidad/src/domain/entities/details_cocktail.dart';
import 'package:flutter/material.dart';

import '../../pages/favorites/favorites_controller.dart';
import '../../utils/constants.dart';

class AMCard extends StatelessWidget {
  final DetailsCocktail cocktail;
  final FavoritesController controller;

  const AMCard({
    Key? key,
    required this.cocktail,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // use a common controller assuming HomePageButton is always a child of Home
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 40),
      shadowColor: AppTheme.primary.withOpacity(0.5),
      elevation: 20,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {
                        controller.modifyFav(cocktail);
                      },
                      icon: const Icon(Icons.star),
                      label: const Text("Favorito"),
                    ),
                  ],
                ),
              ),
              Text(
                cocktail.name,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              LayoutHelper.dividerH,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AMCustomImg(
                  image: cocktail.img,
                  width: 200,
                  height: 200,
                ),
              ),
              LayoutHelper.dividerH,
              ...TextList.textList(cocktail.ingredients, padding: 40.0),
              LayoutHelper.dividerH,
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 30),
                child: Text(cocktail.instructions),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
