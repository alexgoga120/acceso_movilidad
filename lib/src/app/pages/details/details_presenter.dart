import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import '../../../domain/usecases/get_cocktail_usecase.dart';
import '../../../domain/usecases/get_details_usecase.dart';

class DetailsPresenter extends Presenter {
  Function getDetailsOnNext = () {};
  Function getDetailsOnComplete = () {};
  Function getDetailsOnError = () {};

  Function getCocktailOnNext = () {};
  Function getCocktailOnComplete = () {};
  Function getCocktailOnError = () {};

  final GetDetailsUseCase _getDetailsUseCase;
  final GetCocktailUseCase _getCocktailUseCase;

  DetailsPresenter(repo)
      : _getDetailsUseCase = GetDetailsUseCase(repo),
        _getCocktailUseCase = GetCocktailUseCase(repo);

  @override
  void dispose() {
    _getDetailsUseCase.dispose();
  }

  void getDetails(String name) {
    _getDetailsUseCase.execute(
        _GetDetailsObserver(this), GetDetailsUseCaseParams(name));
  }

  void getCocktail(num id) {
    _getCocktailUseCase.execute(
        _GetCocktailObserver(this), GetCocktailUseCaseParams(id));
  }
}

class _GetDetailsObserver implements Observer<GetDetailsUseCaseResponse> {
  final DetailsPresenter _detailsPresenter;

  _GetDetailsObserver(this._detailsPresenter);

  @override
  void onNext(GetDetailsUseCaseResponse? response) {
    assert(_detailsPresenter.getDetailsOnNext != null);
    _detailsPresenter.getDetailsOnNext(response?.details);
  }

  @override
  void onComplete() {
    assert(_detailsPresenter.getDetailsOnComplete != null);
    _detailsPresenter.getDetailsOnComplete();
  }

  @override
  void onError(e) {
    assert(_detailsPresenter.getDetailsOnError != null);
    _detailsPresenter.getDetailsOnError(e);
  }
}

class _GetCocktailObserver implements Observer<GetCocktailUseCaseResponse> {
  final DetailsPresenter _detailsPresenter;

  _GetCocktailObserver(this._detailsPresenter);

  @override
  void onNext(GetCocktailUseCaseResponse? response) {
    assert(_detailsPresenter.getCocktailOnNext != null);
    _detailsPresenter.getCocktailOnNext(response?.cocktail);
  }

  @override
  void onComplete() {
    assert(_detailsPresenter.getCocktailOnComplete != null);
    _detailsPresenter.getCocktailOnComplete();
  }

  @override
  void onError(e) {
    assert(_detailsPresenter.getCocktailOnError != null);
    _detailsPresenter.getCocktailOnError(e);
  }
}
