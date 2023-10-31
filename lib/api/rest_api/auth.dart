import 'dart:convert';

import 'package:dio/dio.dart';

import '../../controller/app_controller.dart';
import 'api.dart';


mixin AuthApi on BaseApi {
  Future<bool> login(param) async {
    String url = '/User/login';
    try {
      Response response = await dio.post(url,
          options: Options(
            headers: {'Content-Type': 'application/json', 'accept': '*/*'},
          ),
          data: param);
      if (response.statusCode == 200) {
        await appController.setLoginData((response.data));
        return appController.checkLogin();
      } else {
        appController.errorLog = response.data['mess'];
        return false;
      }
    } catch (e) {
      saveLog(e);
      return false;
    }
  }
}
