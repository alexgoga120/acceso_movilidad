import 'package:acceso_movilidad/src/app/pages/details/details_controller.dart';
import 'package:acceso_movilidad/src/app/utils/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import '../../../data/repositories/data_details_repository.dart';

class DetailsPage extends View {
  const DetailsPage(routeObserver, {Key? key, required this.name})
      : super(routeObserver: routeObserver, key: key);

  final String name;

  @override
  State<StatefulWidget> createState() => DetailsPageState(name);
}

class DetailsPageState extends ViewState<DetailsPage, DetailsController> {
  DetailsPageState(name)
      : super(DetailsController(DataDetailsRepository(), name));

  @override
  Widget get view => Scaffold(
        key: globalKey,
        appBar: AppBar(
          title: const Text('Cocktails by ingredient'),
          leading: ControlledWidgetBuilder<DetailsController>(
            builder: (context, controller) => TextButton(
                onPressed: () => controller.navigateBack(context),
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        body: ControlledWidgetBuilder<DetailsController>(
          builder: (context, controller) => ModalProgressHUD(
            inAsyncCall: controller.isLoadingDetails,
            child: ListView.separated(
                itemBuilder: (context, index) => ListTile(
                    title: Text(controller.details[index].drink),
                    trailing: Icon(Icons.preview,
                        color: controller.details[index].isFav
                            ? Colors.deepOrange
                            : Colors.white),
                    leading: Image(
                      image: NetworkImage(controller.details[index].drinkThumb),
                    ),
                    onTap: () => {
                          controller.cocktailInfo(
                              int.parse(controller.details[index].id))
                        }),
                separatorBuilder: (_, __) => const Divider(),
                itemCount: controller.details.length),
          ),
        ),
      );
}
