import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../utils/local_storage.dart';

class FavoritesController extends Controller {
  List favorites;

  FavoritesController()
      : favorites = getItems(),
        super();

  @override
  void initListeners() {}

  void modifyFav(cocktail) {
    modifyFavLocal(cocktail);
    favorites = getItems();
    refreshUI();
  }
}
