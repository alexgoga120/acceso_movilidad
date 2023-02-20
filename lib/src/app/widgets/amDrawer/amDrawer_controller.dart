import 'package:acceso_movilidad/src/app/widgets/amDrawer/amDrawer_presenter.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AMDrawerController extends Controller {

  void initListeners() {
  }

  void retrieveData() async {

  }

  void navigate(String page, context) =>
      Navigator.of(context).pushReplacementNamed(page);

  void navigateWithArgs(String page, context, args) =>
      Navigator.of(context).pushReplacementNamed(page, arguments: args);

  void dispose() {
    super.dispose();
  }
}
