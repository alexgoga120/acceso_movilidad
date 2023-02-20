import '../entities/list_ingredients.dart';

abstract class IngredientsRepository {
  Future<List<Ingredients>> getListIngredients();
}
