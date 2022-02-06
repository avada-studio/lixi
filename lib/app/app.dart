import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_controller/app_theme.dart';
import 'app_router.dart';

class MyApp extends StatelessWidget {
  final String page;

  const MyApp({Key? key,required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lì xì',
      onGenerateRoute: AppRouter.handleRouterNavigate,
      initialRoute: page,
      theme: ThemeManager.shared.getLightTheme(),
      themeMode: ThemeMode.light,
    );
  }
}