import 'dart:convert';

import 'package:localstorage/localstorage.dart';

import '../../domain/entities/details_cocktail.dart';

final LocalStorage storage = LocalStorage('AMLocalStorage');

void modifyFavLocal(DetailsCocktail cocktail) {
  List favs = jsonDecode(storage.getItem('favorites') ?? "[]");
  if (!isFav(cocktail.id)) {
    favs.add(cocktail);
  } else {
    final favCocktail =
        favs.where((element) => element['id'] == cocktail.id).first;
    favs.removeAt(favs.indexOf(favCocktail));
  }
  storage.setItem('favorites', jsonEncode(favs));
}

bool isFav(String id) {
  List favs = jsonDecode(storage.getItem('favorites') ?? "[]");
  return favs.where((element) => element['id'] == id).isNotEmpty;
}

List getItems() {
  String? rawJson = storage.getItem('favorites');
  if (rawJson != null) {
    List<DetailsCocktail> favs = [];
    List jsonMap = jsonDecode(rawJson);
    for (final item in jsonMap) {
      favs.add(DetailsCocktail.fromJson(item));
    }
    return favs;
  }

  return [];
}
