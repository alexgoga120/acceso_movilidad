import 'package:acceso_movilidad/src/app/pages/details/details_presenter.dart';
import 'package:acceso_movilidad/src/app/utils/constants.dart';
import 'package:acceso_movilidad/src/app/widgets/amCustomImg/amCustomImg.dart';
import 'package:acceso_movilidad/src/domain/entities/details_cocktail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../../domain/entities/cocktail_ingredient.dart';
import '../../utils/local_storage.dart';

class DetailsController extends Controller {
  final DetailsPresenter _detailsPresenter;
  final String _name;

  List<CocktailIngredient> _details = [];
  DetailsCocktail? _cocktail;

  bool isLoadingDetails = true;
  bool _isFavCocktail = false;

  String get name => _name;

  List<CocktailIngredient> get details => _details;

  DetailsCocktail? get cocktail => _cocktail;

  DetailsController(detailsRepository, this._name)
      : _detailsPresenter = DetailsPresenter(detailsRepository) {
    _details = <CocktailIngredient>[];
    initListeners();
  }

  @override
  void initListeners() {
    _detailsPresenter.getDetailsOnNext = (List<CocktailIngredient> details) {
      _details = details;
      isLoadingDetails = false;
      refreshUI(); // Refreshes the UI manually
    };

    _detailsPresenter.getDetailsOnError = (e) {
      print('Could not retrieve user.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _details = [];
      refreshUI(); // Refreshes the UI manually
    };

    _detailsPresenter.getDetailsOnComplete = () {};

    _detailsPresenter.getCocktailOnNext = (DetailsCocktail cocktail) {
      _cocktail = cocktail;
      isLoadingDetails = false;
      refreshUI(); // Refreshes the UI manually
      showCocktailDetails(cocktail);
    };

    _detailsPresenter.getCocktailOnError = (e) {
      print('Could not retrieve cocktail.');
      ScaffoldMessenger.of(getContext())
          .showSnackBar(SnackBar(content: Text(e.message)));
      _cocktail = null;
      refreshUI(); // Refreshes the UI manually
    };

    _detailsPresenter.getCocktailOnComplete = () {};

    retrieveData(_name);
  }

  void retrieveData(String name) => _detailsPresenter.getDetails(name);

  void navigateBack(context) => Navigator.of(context).pop();

  void cocktailInfo(num id) {
    isLoadingDetails = true;
    refreshUI();
    _detailsPresenter.getCocktail(id);
  }

  void saveFavCocktail(String id) {
    final favCocktail = _details.where((element) => element.id == id).first;
    _details[_details.indexOf(favCocktail)].isFav =
        !_details[_details.indexOf(favCocktail)].isFav;
    refreshUI();
  }

  void showCocktailDetails(DetailsCocktail cocktail) {
    _isFavCocktail = isFav(cocktail.id);
    refreshUI();
    showModalBottomSheet(
        context: getContext(),
        builder: (BuildContext context) => StatefulBuilder(
              builder: (context, _setState) => SingleChildScrollView(
                child: SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ElevatedButton.icon(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close),
                              label: const Text("Cerrar"),
                            ),
                            ElevatedButton.icon(
                              onPressed: () {
                                modifyFavLocal(cocktail);
                                saveFavCocktail(cocktail.id);
                                _setState(() {
                                  _isFavCocktail = !_isFavCocktail;
                                });
                              },
                              icon: Icon(_isFavCocktail
                                  ? Icons.star
                                  : Icons.star_border),
                              label: const Text("Favorito"),
                            ),
                          ],
                        ),
                        Text(
                          cocktail.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
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
                        ...TextList.textList(cocktail.ingredients),
                        LayoutHelper.dividerH,
                        Text(cocktail.instructions),
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }
}
