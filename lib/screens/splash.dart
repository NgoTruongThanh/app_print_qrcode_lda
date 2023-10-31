import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/route_config.dart';
import '../controller/app_controller.dart';
import '../widget/loading_item.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  Future getData() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    if (appController.checkLogin()) {
      Get.offAllNamed(RouteConfig.getPageInit(appController.role));
    } else {
      Get.toNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          return const Center(
              child: LoadingItem(size: 200,));
        },
      ),
    );
  }
}
