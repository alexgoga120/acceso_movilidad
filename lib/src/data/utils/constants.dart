import 'package:dio/dio.dart';

class Constants {
  // APIs
  static const String baseUrl = 'http://$baseUrlNoPrefix';

  // APIs no prefix
  static const String baseUrlNoPrefix = 'www.thecocktaildb.com/api/json/v1/1';
  static const String listIngredientsRoute = '/list.php';
  static const String listCocktailsByIngredientsRoute = '/filter.php';
  static const String cocktailDetailsRoute = '/lookup.php';

  //Max ingredient in request
static const num maxIngredinent = 15;

  // DIO instance
  static final Dio dio = Dio(BaseOptions(
    baseUrl: baseUrl,
    headers: {'custom-header': 'custom DIO header'},
  ));
}
