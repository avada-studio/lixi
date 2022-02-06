import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_resources/app_colors.dart';

class ThemeManager {
  //Private constructor without body
  ThemeManager._internal();

  static final ThemeManager shared = ThemeManager._internal();

  TextTheme _textTheme(TextTheme base, Color color) {
    return GoogleFonts.robotoTextTheme(base).copyWith(
      headline1:
          base.headline1?.copyWith(color: color, fontWeight: FontWeight.w500),
      headline2:
          base.headline2?.copyWith(color: color, fontWeight: FontWeight.w500),
      headline3:
          base.headline3?.copyWith(color: color, fontWeight: FontWeight.w500),
      headline4:
          base.headline4?.copyWith(color: color, fontWeight: FontWeight.w500),
      headline5:
          base.headline5?.copyWith(color: color, fontWeight: FontWeight.w500),
      headline6:
          base.headline6?.copyWith(color: color, fontWeight: FontWeight.w500),
      subtitle1:
          base.subtitle1?.copyWith(color: color, fontWeight: FontWeight.w500),
      subtitle2:
          base.subtitle2?.copyWith(color: color, fontWeight: FontWeight.w500),
      bodyText1: base.bodyText1?.copyWith(
        color: color,
      ),
      bodyText2: base.bodyText2?.copyWith(
        color: color,
      ),
      overline: base.overline?.copyWith(
        color: color,
      ),
      button: base.button?.copyWith(
        color: color,
      ),
      caption: base.caption?.copyWith(
        color: color,
      ),
    );
  }

  ThemeData getLightTheme() {
    final ColorScheme colorScheme = const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
    );
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      primaryColor: AppColors.primaryColor,
      buttonColor: AppColors.primaryColor,
      primaryColorDark: AppColors.primaryColor,
      indicatorColor: Colors.white,
      highlightColor: Colors.transparent,
      floatingActionButtonTheme: base.floatingActionButtonTheme.copyWith(
          foregroundColor: Colors.white,
          backgroundColor: AppColors.primaryColor
      ),
      splashFactory: InkRipple.splashFactory,
      accentColor: AppColors.secondaryColor,
      canvasColor: Colors.white,
      shadowColor: AppColors.shadowColor,
      backgroundColor: AppColors.lightGrey,
      scaffoldBackgroundColor: AppColors.white,
      errorColor: AppColors.errorColor,
      hintColor: AppColors.textHintColor,
      iconTheme: IconThemeData(color: AppColors.white),
      primaryIconTheme: IconThemeData(color: AppColors.white),
      buttonTheme: ButtonThemeData(
        colorScheme: colorScheme,
        textTheme: ButtonTextTheme.primary,
      ),
      appBarTheme: base.appBarTheme.copyWith(
        brightness: Brightness.dark,
        color: AppColors.primaryColor,
      ),
      textTheme: _textTheme(base.textTheme, AppColors.textColor),
      primaryTextTheme: _textTheme(base.primaryTextTheme, AppColors.white),
      accentTextTheme: _textTheme(base.accentTextTheme, AppColors.textColor),
    );
  }
}
