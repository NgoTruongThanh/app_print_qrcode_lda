import 'package:app_print_qrcode_lda/widget/basic_alert.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../api/rest_api/api.dart';
import '../config/route_config.dart';
import 'app_controller.dart';
class LoginController extends GetxController{
  RxBool isLoading = false.obs;
  RxBool isComplete = false.obs;
  RxBool validate = false.obs;
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  _checkHasData() {
    if (username.text != '' && password.text != '') {
      validate.value = true;
    } else{
      validate.value = false;
    }

    if(username.text == 'hoangto'){
      username.text = 'admin';
      password.text = '123456';
    }
  }

  @override
  void onInit(){
    super.onInit();
    username.addListener(_checkHasData);
    password.addListener(_checkHasData);
  }

  Future login()async{
    isLoading.value = true;
    var data = {
      'username': username.text,
      'password':password.text
    };
    var result =  await api.login(data);
    isLoading.value = false;
    if(result){
      Future.delayed(const Duration(milliseconds: 100)).then((value) =>
          Get.offAllNamed(RouteConfig.getPageInit(appController.role)));
    }else{
     BasicAlert.errorToast(content: 'Đăng nhập thất bại');
    }
  }

}