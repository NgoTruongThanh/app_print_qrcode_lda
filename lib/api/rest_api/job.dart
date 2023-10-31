import 'package:app_print_qrcode_lda/controller/app_controller.dart';
import 'package:app_print_qrcode_lda/model/qrcode.dart';
import 'package:dio/dio.dart';
import '../../model/ReprintResponse.dart';
import 'api.dart';
mixin JobApi on BaseApi {
  Future<QRCode> infoQRCode(param) async {
    const url = '/Job/InfoQRCode';
    try {
      Response response = await dio.get(url,
          options: Options(
            headers: {'token': appController.token},
          ),
          queryParameters: param);
      if (response.statusCode == 200) {
        return QRCode.fromJson(response.data);
      } else {
        return QRCode();
      }
    } catch (e) {
      print(e);
      return QRCode();
    }
  }

  Future<List<QRCode>> findQRCode(data) async {
    const url = '/Qrcode/findQRCode';
    try {
      Response response = await dio.post(url,
          options: Options(
            headers: {'token': appController.token},
          ),
          data: data);
      print(response.data);
      if (response.statusCode == 200) {
        return (response.data as List)
            .map((e) => QRCode.fromJson(e))
            .toList();
      } else {
        return [];
      }
    } catch (e) {
      print(e.toString());
      return [];
    }
  }

  Future<List> createQRode(data) async {
    const url = '/Job/createQRCode';
    try {
      Response response = await dio.post(url,
          options: Options(
            headers: {'token': appController.token},
          ),
          data: data);
      print(response.data);
      if (response.statusCode == 200) {
        return (response.data as List).toList();
      } else {
        return [];
      }
    } catch (e) {
      saveLog(e);
      print(e.toString());
      return [];
    }
  }

  Future<ReprintResponse> reprintQRode(param) async {
    const url = '/Job/printQRCode';
    try {
      Response response = await dio.put(url,
          options: Options(
            headers: {'token': appController.token},
          ),
          queryParameters: param);
      print(response.data);
      if (response.statusCode == 200) {
        return ReprintResponse.fromJson(response.data);
      } else {
        return ReprintResponse();
      }
    } catch (e) {
      print(e.toString());
      return ReprintResponse();
    }
  }
}
