import 'package:acceso_movilidad/src/app/widgets/amDrawer/amDrawer_controller.dart';
import 'package:acceso_movilidad/src/app/pages/pages.dart';
import 'package:acceso_movilidad/src/app/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class AMDrawer extends View {
  const AMDrawer({Key? key}) : super(key: key);

  @override
  // Dependencies can be injected here
  State<StatefulWidget> createState() => _AMDrawerView();
}

class _AMDrawerView extends ViewState<AMDrawer, AMDrawerController> {
  _AMDrawerView() : super(AMDrawerController());

  @override
  Widget get view {
    return Stack(key: globalKey, children: [
      Column(
        children: <Widget>[
          header,
          ControlledWidgetBuilder<AMDrawerController>(
            builder: (context, controller) {
              return SizedBox(
                height: 300.0, // Change as you wish
                width: 300.0,
                child: createPageTile(context, controller),
              );
            },
          ),
        ],
      )
    ]);
  }

  Widget get header => UserAccountsDrawerHeader(
        accountName: const Text(
          UserCredentials.name,
          style: TextStyle(fontSize: 18.0),
        ),
        accountEmail: const Text(
          UserCredentials.email,
          style: TextStyle(fontSize: 12.0),
        ),
        currentAccountPicture: GestureDetector(
          onTap: () => print("This is the current user"),
          child: const CircleAvatar(
            backgroundImage: NetworkImage(
                'https://cdn-icons-png.flaticon.com/512/804/804645.png'),
          ),
        ),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/drawer_bg.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3),
              BlendMode.dstATop,
            ),
          ),
        ),
      );

  ListView createPageTile(BuildContext context, AMDrawerController controller) {
    final menuOptions = Pages.menuOptions;
    return ListView.separated(
        itemBuilder: (_, index) => ListTile(
              leading: Icon(
                menuOptions[index].icon,
              ),
              title: Text(menuOptions[index].name),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
              onTap: () =>
                  controller.navigate(menuOptions[index].route, context),
            ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length);

    // return ListTile(
    //   title: Text(
    //     name,
    //     style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w300),
    //   ),
    //   trailing: Icon(
    //     icon,
    //     size: 22.0,
    //   ),
    //   onTap: handler,
    // );
  }
}
