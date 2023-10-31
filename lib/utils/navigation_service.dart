import 'package:flutter/cupertino.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
  GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> shellNavigatorKey =
  GlobalKey<NavigatorState>(debugLabel: 'shell');
}
