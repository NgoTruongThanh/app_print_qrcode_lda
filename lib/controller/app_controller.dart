import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/rest_api/api.dart';
import '../config/list_string_config.dart';
import '../utils/session_storage_helper.dart';
import 'login_controller.dart';

typedef void MenuCallback(ObjectKey);

class AppController extends GetxController {
  RxInt index = 0.obs;
  RxBool isLoading = false.obs;
  String errorLog = '';
  String success = '';
  String token = '';
  String group = '';
  String role = '';
  String user = '';
  String groupName = '';
  Map mapJob = {};
  Map mapType = {};
  Map mapLine = {};
  Map mapProduct = {};
  Map mapPacket = {};
  final LoginController loginController = Get.put(LoginController());

  void toastError(String title) {
    Get.snackbar(title, errorLog, backgroundColor: Colors.red);
  }

  void toastSucces(String title) {
    Get.snackbar(title, success, backgroundColor: Colors.green);
  }

  Future getLoginData() async {
    await initData();
    await getStorage();
  }

  Future initData() async {
    Future.wait(
      [
        // api.listJob(),
        // api.listLine(),
        // api.listProduct(),
        // api.listPacket(),
        // api.listType(),
      ],
    );
  }

  Future setLoginData(data) async {
    if (GetPlatform.isWeb) {
      SessionStorageHelper.setValue('token', data['token'] ?? '');
      SessionStorageHelper.setValue('user', data['user'] ?? '');
      SessionStorageHelper.setValue('role', data['role']);
      await getLoginData();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', data['token']);
      prefs.setString('user', data['user']);
      prefs.setString('role', data['role']);
      await getLoginData();
    }
  }

  getStorage() async {
    if (GetPlatform.isWeb) {
      token = SessionStorageHelper.getValue('token');
      user = SessionStorageHelper.getValue('user');
      role = SessionStorageHelper.getValue('role');
      // mapJob = ListStringConfig.getListString('jobs');
      // mapType = ListStringConfig.getListString('types');
      // mapLine = ListStringConfig.getListString('lines');
      // mapProduct = ListStringConfig.getListString('products');
      // mapPacket = ListStringConfig.getListString('packets');
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      token = prefs.getString('token') ?? '';
      user = prefs.getString('user') ?? '';
      role = prefs.getString('role') ?? '';
      mapJob = ListStringConfig.getListString('jobs');
      mapType = ListStringConfig.getListString('types');
      mapLine = ListStringConfig.getListString('lines');
      mapProduct = ListStringConfig.getListString('products');
      mapPacket = ListStringConfig.getListString('packets');
    }
  }

  Future resetLoginData() async {
    if (GetPlatform.isWeb) {
      SessionStorageHelper.removeValue('token');
      SessionStorageHelper.removeValue('user');
      SessionStorageHelper.removeValue('role');

      await getLoginData();
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.remove('token');
      prefs.remove('user');
      prefs.remove('role');
      await getLoginData();
    }
  }

  bool checkLogin() {
    return token.isNotEmpty;
  }

  logout() async {
    await appController.resetLoginData();
    Get.offAllNamed('/login');
  }
}

AppController appController = Get.put(AppController());
