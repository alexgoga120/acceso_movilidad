import '../entities/cocktail_ingredient.dart';
import '../entities/details_cocktail.dart';

abstract class DetailsRepository {
  Future<List<CocktailIngredient>> cocktailByIngredient(String name);

  Future<DetailsCocktail> cocktailDetails(num id);
}
