import 'package:acceso_movilidad/src/app/widgets/amDrawer/amDrawer_view.dart';
import 'package:flutter/material.dart';

class CustomIcons {
  CustomIcons._();

  static const _kFontFam = 'MyFlutterApp';
  static const String? _kFontPkg = null;
  static const IconData github_square =
      IconData(0xf092, fontFamily: _kFontFam, fontPackage: _kFontPkg);
  static const IconData linkedin =
      IconData(0xf08c, fontFamily: _kFontFam, fontPackage: _kFontPkg);
}

class AMConstants {
  static AMDrawer drawer = const AMDrawer();
}

class UserCredentials {
  static const String name = "Alex Gomez Garcia";
  static const String email = "alexgoga120@gmail.com";
}

class AppTheme {
  static const Color primary = Colors.teal;
  static const Color secondary = Colors.white10;

  static final ThemeData darkTheme = ThemeData.dark().copyWith(
      primaryColor: primary,
      appBarTheme: const AppBarTheme(color: primary, elevation: 0),
      textButtonTheme:
          TextButtonThemeData(style: TextButton.styleFrom(primary: primary)),
      floatingActionButtonTheme:
          const FloatingActionButtonThemeData(backgroundColor: primary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              primary: secondary, shape: const StadiumBorder(), elevation: 0)),
      dialogTheme: DialogTheme(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))));
}

class LayoutHelper {
  static const Widget dividerH = SizedBox(
    height: 30,
  );
  static const Widget dividerW = SizedBox(
    width: 30,
  );
}

class TextList {
  static List<Widget> textList(List texts, {padding = 80.0}) {
    List<Widget> list = [];

    for (final text in texts) {
      final ingMeasure = text.split("--");
      final wRow = Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ingMeasure[0],
              textAlign: TextAlign.left,
            ),
            Text(
              ingMeasure[1],
              textAlign: TextAlign.left,
            ),
          ],
        ),
      );
      list.add(wRow);
    }
    return list;
  }
}
