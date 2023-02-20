import 'package:acceso_movilidad/src/app/pages/pages.dart';
import 'package:acceso_movilidad/src/app/utils/constants.dart';
import 'package:acceso_movilidad/src/app/utils/router.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  // await Firebase.initializeApp(
  //   options: DefaultFirebaseOptions.currentPlatform,
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final AMRouter _router;

  MyApp() : _router = AMRouter() {}

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      onGenerateRoute: _router.getRoute,
      navigatorObservers: [_router.routeObserver],
      theme: AppTheme.darkTheme,
    );
  }
}
