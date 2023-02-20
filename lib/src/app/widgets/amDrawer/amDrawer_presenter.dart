import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
class AMDrawerPresenter extends Presenter {
  @override
  void dispose() {
  }

}

/// The [Observer] used to observe the `Observable` of the [LogoutUseCase]
class _LogoutUserCaseObserver implements Observer<void> {
  AMDrawerPresenter _drawerPresenter;
  _LogoutUserCaseObserver(this._drawerPresenter);

  void onNext(_){}
  void onComplete()  {
    _drawerPresenter.dispose();
  }
  void onError(_) {}
}

/// Observer that listens to [_getUserUseCase]
class _GetUserUseCaseObserver implements Observer {

  void onNext(user) {
  }

  void onComplete() {}

  void onError(e) {

  }
}
