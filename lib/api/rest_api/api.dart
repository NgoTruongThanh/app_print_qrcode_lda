import 'dart:io';

import 'package:app_print_qrcode_lda/api/rest_api/data.dart';
import 'package:dio/dio.dart';
import '../../config/app_config.dart';
import '../../controller/app_controller.dart';

import '../../main.dart';
import 'auth.dart';
import 'job.dart';


class BaseApi {
  Dio dio = Dio(BaseOptions(
    baseUrl: base_url,
    headers: {"Access-Control-Allow-Origin": "*"}
  ));

  void saveLog(e) async {
    if (e.response != null) {
      if (e.response.statusCode == 500 || e.response.statusCode == 502 || e.response.statusCode == 404) {
        appController.errorLog = 'Lỗi hệ thống vui lòng thử lại sau!';
      } else if (e.response.statusCode == 401 || e.response.statusCode == 403 || e.response.statusCode == 404) {
        appController.errorLog = 'Bạn không có quyền thực hiện thao tác!';
      } else if (e.response.statusCode == 400) {
        appController.errorLog = 'Vui lòng kiểm tra lại thông tin đăng nhập';
      }
    } else {
      appController.errorLog = 'Lỗi';
    }
  }
}

class Api extends BaseApi with AuthApi,DataApi,JobApi{}

final Api api = Api();
