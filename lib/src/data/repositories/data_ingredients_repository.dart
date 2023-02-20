import 'package:acceso_movilidad/src/data/utils/constants.dart';
import 'package:acceso_movilidad/src/domain/entities/list_ingredients.dart';
import 'package:acceso_movilidad/src/domain/repositories/ingredients_repository.dart';
import 'package:dio/dio.dart';

class DataIngredientsRepository extends IngredientsRepository {
  static final DataIngredientsRepository _instance =
      DataIngredientsRepository._internal();

  DataIngredientsRepository._internal();

  factory DataIngredientsRepository() => _instance;

  @override
  Future<List<Ingredients>> getListIngredients() async {
    final Response<Map> response = await Constants.dio
        .get(Constants.listIngredientsRoute, queryParameters: {'i': 'list'});
    final List ingredientsResponse = response.data?['drinks'];

    List<Ingredients> ingredients = [];

    for (final item in ingredientsResponse) {
      ingredients.add(Ingredients(item['strIngredient1']));
    }
    // print(ingredients[0].name);
    return ingredients;
  }
}
