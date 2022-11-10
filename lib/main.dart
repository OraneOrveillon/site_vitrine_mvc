import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:site_vitrine_mvc/viewmodel/theme.dart';

import 'view/layouts/main_layout.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ThemeModel themeModel = ThemeModel();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: themeModel,
      child: Consumer<ThemeModel>(
        builder: (context, themeModel, child) => MaterialApp(
          title: 'Site vitrine',
          debugShowCheckedModeBanner: false,
          theme: FlexThemeData.light(scheme: FlexScheme.aquaBlue),
          darkTheme: FlexThemeData.dark(scheme: FlexScheme.aquaBlue),
          themeMode: themeModel.currentTheme(),
          home: const MainLayout(),
        ),
      ),
    );
  }
}
