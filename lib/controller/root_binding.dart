import 'package:get/get.dart';

import 'login_controller.dart';

class InitialScreenBindings implements Bindings {
  InitialScreenBindings();

  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
