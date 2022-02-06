import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lixi/features/error/error_page.dart';
import 'package:lixi/features/home/home_page.dart';
import 'package:lixi/features/splash/splash_page.dart';

/// tên màn hình cách nhau bởi dấu '-'
class AppRouteName {
  static const root = '/';
  static const errorPage = '/error-page';
  static const home = '/home';
}

/// điều hướng đến các màn hình thông qua tên
class AppRouter {
  static Route<dynamic> handleRouterNavigate(RouteSettings routeSetting) {
    switch (routeSetting.name) {
      case AppRouteName.root:
        return MaterialPageRoute(builder: (_) => SplashPage());
    /// Màn hình chính
      case AppRouteName.home:
        return MaterialPageRoute(builder: (_) => HomePage());
    }
    /// show thông báo lỗi
    return MaterialPageRoute(builder: (_) => ErrorPage());
  }
}
