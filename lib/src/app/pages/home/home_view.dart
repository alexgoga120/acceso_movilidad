import 'package:acceso_movilidad/src/app/utils/constants.dart';

import './home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';

class HomePage extends View {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() =>
      // inject dependencies inwards
      HomePageState();
}

class HomePageState extends ViewState<HomePage, HomeController> {
  HomePageState() : super(HomeController());

  @override
  Widget get view {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material App Bar'),
      ),
      drawer: Drawer(
        child: AMConstants.drawer,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          LayoutHelper.dividerH,
          const ClipOval(
            child: Image(
              image: AssetImage("assets/img/dev_icon.jpg"),
              width: 200,
              height: 200,
            ),
          ),
          LayoutHelper.dividerH,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'Developer Vue.js, laravel, flutter, spring, php, java, typescript, dart',
              textScaleFactor: 2,
              textAlign: TextAlign.center,
            ),
          ),
          LayoutHelper.dividerH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) => ElevatedButton.icon(
                  onPressed: controller.onClickGithub,
                  icon: const Icon(CustomIcons.github_square),
                  label: const Text("Github profile"),
                ),
              ),
              LayoutHelper.dividerW,
              ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) => ElevatedButton.icon(
                  onPressed: controller.onClickMail,
                  icon: const Icon(Icons.mail),
                  label: const Text("Send mail"),
                ),
              ),
            ],
          ),
          LayoutHelper.dividerH,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ControlledWidgetBuilder<HomeController>(
                builder: (context, controller) => ElevatedButton.icon(
                  onPressed: controller.onClickLinkedin,
                  icon: const Icon(CustomIcons.linkedin),
                  label: const Text("Profile"),
                ),
              ),
            ],
          ),
          LayoutHelper.dividerH,
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "here's the \"Accesso Movilidad\" test, use the navigation drawer to explore.",
              textScaleFactor: 1.5,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
