import 'package:acceso_movilidad/src/domain/usecases/get_ingredients_usecase.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class IngredientsPresenter extends Presenter {
  Function getIngredientsOnNext = () {};
  Function getIngredientsOnComplete = () {};
  Function getIngredientsOnError = () {};

  final GetIngredientsUseCase getIngredientsUseCase;

  IngredientsPresenter(repo)
      : getIngredientsUseCase = GetIngredientsUseCase(repo);

  void getIngredients() {
    getIngredientsUseCase.execute(
        _GetIngredientsUseCaseObserver(this), GetIngredientsUseCaseParams());
  }

  @override
  void dispose() {
    getIngredientsUseCase.dispose();
  }
}

class _GetIngredientsUseCaseObserver
    implements Observer<GetIngredientsUseCaseResponse> {
  final IngredientsPresenter presenter;

  _GetIngredientsUseCaseObserver(this.presenter);

  @override
  void onComplete() {
    assert(presenter.getIngredientsOnComplete != null);
    presenter.getIngredientsOnComplete();
  }

  @override
  void onError(e) {
    assert(presenter.getIngredientsOnError != null);
    presenter.getIngredientsOnError(e);
  }

  @override
  void onNext(GetIngredientsUseCaseResponse? response) {
    assert(presenter.getIngredientsOnNext != null);
    presenter.getIngredientsOnNext(response?.ingredients);
  }
}
