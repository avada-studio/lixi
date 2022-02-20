import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_resources/app_colors.dart';

class ThemeManager {
  //Private constructor without body
  ThemeManager._internal();

  static final ThemeManager shared = ThemeManager._internal();

  TextTheme _textTheme(TextTheme base, Color color) {
    return GoogleFonts.nunitoTextTheme(base).copyWith(
      headline1: GoogleFonts.nunito(textStyle: base.headline1).copyWith(color: color),
      headline2: GoogleFonts.nunito(textStyle: base.headline2).copyWith(color: color),
      headline3: GoogleFonts.nunito(textStyle: base.headline3).copyWith(color: color),
      headline4: GoogleFonts.nunito(textStyle: base.headline4).copyWith(color: color),
      headline5: GoogleFonts.nunito(textStyle: base.headline5).copyWith(color: color),
      headline6: GoogleFonts.nunito(textStyle: base.headline6).copyWith(color: color),
      subtitle1: GoogleFonts.nunito(textStyle: base.subtitle1).copyWith(color: color),
      subtitle2: GoogleFonts.nunito(textStyle: base.subtitle2).copyWith(color: color),
      bodyText1: GoogleFonts.nunito(textStyle: base.bodyText1).copyWith(color: color),
      bodyText2: GoogleFonts.nunito(textStyle: base.bodyText2).copyWith(color: color),
      overline: GoogleFonts.nunito(textStyle: base.overline).copyWith(color: color),
      button: GoogleFonts.nunito(textStyle: base.button).copyWith(color: color),
      caption: GoogleFonts.nunito(textStyle: base.caption).copyWith(color: color),
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
      backgroundColor: AppColors.backgroundColor,
      scaffoldBackgroundColor: AppColors.scaffoldBackgroundColor,
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
