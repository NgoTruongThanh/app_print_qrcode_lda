import 'package:app_print_qrcode_lda/utils/navigation_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:url_strategy/url_strategy.dart';

import 'config/app_config.dart';
import 'config/root_binding.dart';
import 'config/route_config.dart';
import 'config/theme_config.dart';
import 'controller/app_controller.dart';


Future<String> _fetchData() async {
  // Dio _dio = Dio();
  // try {
  //   // Response response = await _dio.get('http://node2.stvg.vn:65005/Link/lda');
  //   return response.data.toString();
  // } catch (error) {
    return 'https://erp.lda.vn:50000';
  // }
}
String base_url = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb) {
    setPathUrlStrategy();
  }
  base_url = await _fetchData();
  await appController.getLoginData();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String initRoute = '/login';
  String currentRoute = '/';

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorKey: NavigationService.navigatorKey,
      transitionDuration: const Duration(seconds: 0),
      color: ThemeConfig.backgroundColor,
      debugShowCheckedModeBanner: false,
      initialBinding: InitialScreenBindings(),
      title: AppConfig.APP_NAME,
      initialRoute: initRoute,
      getPages: RouteConfig().getRoute,
    );
  }
}
