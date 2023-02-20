import 'package:acceso_movilidad/src/data/repositories/data_ingredients_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

import '../../utils/constants.dart';
import 'ingredients_controller.dart';

class IngredientsPage extends View {
  const IngredientsPage({Key? key}) : super(key: key);

  @override
  IngredientsPageState createState() =>
      // inject dependencies inwards
      IngredientsPageState();
}

class IngredientsPageState
    extends ViewState<IngredientsPage, IngredientsController> {
  IngredientsPageState()
      : super(IngredientsController(DataIngredientsRepository()));

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Ingredients'),
        ),
        drawer: Drawer(
          child: AMConstants.drawer,
        ),
        body: ControlledWidgetBuilder<IngredientsController>(
          builder: (context, controller) => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text(controller.ingredients[index].name),
                    trailing: const Icon(Icons.arrow_forward_ios_outlined),
                    onTap: () => controller.navigateWithArgs(
                        context, controller.ingredients[index].name),
                  ),
              separatorBuilder: (_, __) => const Divider(),
              itemCount: controller.ingredients.length),
        ),
      );
}
