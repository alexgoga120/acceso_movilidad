import 'package:acceso_movilidad/src/app/pages/ingredients/ingredients_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/list_ingredients.dart';
import '../pages.dart';

class IngredientsController extends Controller {
  List<Ingredients> _ingredients = [];

  List<Ingredients> get ingredients => _ingredients;

  final IngredientsPresenter ingredientsPresenter;

  IngredientsController(repo)
      : ingredientsPresenter = IngredientsPresenter(repo),
        super();

  @override
  void initListeners() {
    ingredientsPresenter.getIngredientsOnNext =
        (List<Ingredients> ingredients) {
      _ingredients = ingredients;
      refreshUI(); // Refreshes the UI manually
    };
    ingredientsPresenter.getIngredientsOnComplete = () {
      print('User retrieved');
    };

    // On error, show a snackbar, remove the user, and refresh the UI
    ingredientsPresenter.getIngredientsOnError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _ingredients = [];
      refreshUI(); // Refreshes the UI manually
    };
    getIngredients();
  }

  void getIngredients() => ingredientsPresenter.getIngredients();

  void navigateWithArgs(context, args) =>
      Navigator.of(context).pushNamed(Pages.details, arguments: args);

  @override
  void onResumed() => print('On resumed');

  @override
  void onReassembled() => print('View is about to be reassembled');

  @override
  void onDeactivated() => print('View is about to be deactivated');

  @override
  void onDisposed() {
    ingredientsPresenter.dispose(); // don't forget to dispose of the presenter
    super.onDisposed();
  }
}
