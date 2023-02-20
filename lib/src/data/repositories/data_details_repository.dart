import 'package:acceso_movilidad/src/app/utils/local_storage.dart';
import 'package:acceso_movilidad/src/domain/entities/cocktail_ingredient.dart';
import 'package:acceso_movilidad/src/domain/entities/details_cocktail.dart';
import 'package:acceso_movilidad/src/domain/repositories/details_repository.dart';
import 'package:dio/dio.dart';

import '../utils/constants.dart';

class DataDetailsRepository extends DetailsRepository {
  static final DataDetailsRepository _instance =
      DataDetailsRepository._internal();

  DataDetailsRepository._internal();

  factory DataDetailsRepository() => _instance;

  @override
  Future<List<CocktailIngredient>> cocktailByIngredient(String name) async {
    final Response<Map> response = await Constants.dio.get(
        Constants.listCocktailsByIngredientsRoute,
        queryParameters: {'i': name});
    final List cocktailResponse = response.data?['drinks'];

    List<CocktailIngredient> cocktailPreview = [];

    for (final data in cocktailResponse) {
      cocktailPreview.add(CocktailIngredient(data['idDrink'],
          data['strDrinkThumb'], data['strDrink'], isFav(data['idDrink'])));
    }

    return cocktailPreview;
  }

  @override
  Future<DetailsCocktail> cocktailDetails(num id) async {
    final Response<Map> response = await Constants.dio
        .get(Constants.cocktailDetailsRoute, queryParameters: {'i': id});
    final Map cocktailResponse = response.data?['drinks'][0];

    DetailsCocktail cocktailPreview;
    List<String> ingredients = [];

    for (num i = 1; i < Constants.maxIngredinent; i++) {
      final String currentKey = 'strIngredient$i';
      if (cocktailResponse.containsKey(currentKey) &&
          cocktailResponse[currentKey] != null) {
        ingredients.add(
            '${cocktailResponse[currentKey]}--${cocktailResponse['strMeasure$i']}');
      } else {
        break;
      }
    }

    cocktailPreview = DetailsCocktail(
        cocktailResponse['idDrink'],
        cocktailResponse['strDrink'],
        cocktailResponse['strCategory'],
        cocktailResponse['strGlass'],
        cocktailResponse['strInstructions'],
        ingredients,
        cocktailResponse['strDrinkThumb']);
    return cocktailPreview;
  }
}
