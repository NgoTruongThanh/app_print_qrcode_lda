import 'package:app_print_qrcode_lda/screens/menu/menu_screen.dart';
import 'package:app_print_qrcode_lda/screens/print_qrcode/print_qrcode_screen.dart';
import 'package:app_print_qrcode_lda/screens/search-reprint-qrcode-window/search-qrcode-screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../screens/login_screen.dart';
import '../screens/search-reprint-qrcode-pda/reprint-screen.dart';
import '../screens/splash.dart';


class RouteConfig {
  static String get initRoute => '/login';

  // static final _initPage = {
  //   'admin': '/transaction',
  //   'staff': '/transaction',
  //   'manager': '/transaction',
  // };

  static const _initPage = '/menu';

  static final List<RouteToPage> _routeToPage = [
    RouteToPage(name: '/', page: const SplashScreen(), roles: [], checkAuth: false),
    RouteToPage(name: '/login', page: const LoginScreen(), roles: [], checkAuth: false),
    RouteToPage(name: '/menu', page:  const MenuScreen(), roles: [], checkAuth: false),
    RouteToPage(name: '/print-qrcode', page:  const PrintQRCodeScreen(), roles: [], checkAuth: false),
    RouteToPage(name: '/search-qrcode', page:  SearchQRCodeScreen(), roles: [], checkAuth: false),
    RouteToPage(name: '/search-qrcode-pda', page:  ReprintScreenPDA(), roles: [], checkAuth: false),

  ];

  List<RouteToPage> get getRouteToPage => _routeToPage;

  final List<GetPage> _route = _routeToPage
      .map((route) => GetPage(
          name: route.name,
          page: () => route.page))
      .toList();

  List<GetPage> get getRoute => _route;

  // static String getPageInit(String role) {
  //   return _initPage[role] ?? '/login';
  // }

  static String getPageInit(String role) {

    return _initPage ;
  }
}

class RouteToPage {
  final String name;
  final Widget page;
  final List<String> roles;
  final bool checkAuth;

  RouteToPage({required this.name, required this.page, required this.roles, this.checkAuth = true});
}
