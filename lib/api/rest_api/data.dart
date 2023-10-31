import 'package:dio/dio.dart';
import '../../config/list_string_config.dart';
import '../../utils/session_storage_helper.dart';
import 'api.dart';

mixin DataApi on BaseApi {
  Future listJob(Map mapJob) async {
    const url = '/Config/listNhapJob';
    try {
      Response response = await dio.get(url,
          options: Options(
              //     headers: {'token': userResponse.token},
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        // SessionStorageHelper.setValue('job', json.first ?? '');

        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        mapJob = data;
        // ListStringConfig.setListString('jobs', data);
        // SessionStorageHelper.setValue('jobs', data);
      }
      return mapJob;
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listProduct(Map mapProduct) async {
    const url = '/Config/listProduct';
    try {
      Response response = await dio.get(url,
          options: Options(
              //     headers: {'token': userResponse.token},
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        // SessionStorageHelper.setValue('products', json.first ?? '');

        for (var element in json) {
          data[element['code']] = element['name'];
        }
        // SessionStorageHelper.setValue('product',  json.first ?? '');
        mapProduct = data;

        // SessionStorageHelper.setValue('products', data);
      }
      return mapProduct;
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listType(Map mapType) async {
    const url = '/Config/listType';
    try {
      Response response = await dio.get(url,
          options: Options(
              //     headers: {'token': userResponse.token},
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        // SessionStorageHelper.setValue('types', json.first ?? '');

        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        mapType = data;

        // SessionStorageHelper.setValue('type', json.first ?? '');
        // SessionStorageHelper.setValue('types', data);
      }
      return mapType;

    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listPacket(Map mapPacket) async {
    const url = '/Config/getListPacket';
    try {
      Response response = await dio.get(url,
          options: Options(
              //     headers: {'token': userResponse.token},
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        Map data = {};
        // SessionStorageHelper.setValue('packets', json.first ?? '');

        for (var element in json) {
          data[element['code']] = element['name'];
        }
        mapPacket = data;

        // SessionStorageHelper.setValue('packet',  json.first ?? '');
        // SessionStorageHelper.setValue('packets', data);
      }
      return mapPacket
          ;
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }

  Future listLine(Map mapLine) async {
    const url = '/Config/listLine';
    try {
      Response response = await dio.get(url,
          options: Options(
              //     headers: {'token': userResponse.token},
              ));
      if (response.statusCode == 200) {
        List json = response.data;
        // SessionStorageHelper.setValue('lines', json.first ?? '');

        Map data = {};
        for (var element in json) {
          data[element['code']] = element['name'];
        }
        mapLine = data;

        // ListStringConfig.setListString('lines', data);
        // SessionStorageHelper.setValue('line',  json.first ?? '');
        // SessionStorageHelper.setValue('lines', data);
      }
      return mapLine;
    } catch (e) {
      saveLog(e);
      rethrow;
    }
  }
}
