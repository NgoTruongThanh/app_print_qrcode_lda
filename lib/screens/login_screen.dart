import 'package:app_print_qrcode_lda/config/app_config.dart';
import 'package:app_print_qrcode_lda/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme_config.dart';
import '../controller/app_controller.dart';
import '../controller/login_controller.dart';

import '../widget/custom_text.dart';
import '../widget/loading_item.dart';
import '../widget/my_button.dart';
import '../widget/my_input_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  RxBool isLoading = false.obs;
  RxString item = ''.obs;
  Map mapBranch = {};

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double widthResponsive = (MediaQuery.of(context).size.width * 0.25 < 350)
        ? 400
        : ((MediaQuery.of(context).size.width * 0.25 > 400) ? 450 : (MediaQuery.of(context).size.width * 0.25));
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => !isLoading.value
                ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'IN QRCODE BAO',
                      style: ThemeConfig.headerStyle
                          .copyWith(fontSize: getSize(60), color: ThemeConfig.darkBluePrimary),
                    ),
                    Text(
                      'Đăng nhập',
                      style: ThemeConfig.headerStyle
                          .copyWith(fontSize: 22, color: ThemeConfig.darkBluePrimary),
                    ),
                    const SizedBox(height: 32),
                    Padding(
                      padding: const EdgeInsets.only(right: 28, left: 28,top: 5,bottom: 5),
                      child: MyInputField(
                        label: 'Tài khoản',
                        input: Get.find<LoginController>().username,
                        width: widthResponsive,
                        onSubmitted: (e) {
                          appController.loginController.login();
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 28, left: 28,top: 5,bottom: 5),
                      child: MyInputField(
                        label: 'Mật khẩu',
                        isPassword: true,
                        onSubmitted: (e) {
                          appController.loginController.login();
                        },
                        input: Get.find<LoginController>().password,
                        width: widthResponsive,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Obx(() => MyButton(
                      isCompleted: appController.loginController.isComplete.value,
                      isLoading: appController.loginController.isLoading.value,
                      validate: true,
                      width: widthResponsive,
                      color: ThemeConfig.darkBluePrimary,
                      margin: const EdgeInsets.only(right: 28, left: 28, top: 10, bottom: 10),
                      borderRadius: 5,
                      height: 55,
                      callback: appController.loginController.login,
                      childWidget: MyCustomText(
                        text: 'Đăng nhập',
                        style: ThemeConfig.defaultStyle,
                        color: ThemeConfig.whiteColor,
                      ),
                    )),
                  ],
                )
                : const LoadingItem(size: 200), // list Branch empty
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 30,
        padding: const EdgeInsets.only(bottom: 10),
        alignment: Alignment.bottomCenter,
        child:
        Text(AppConfig.version, style: ThemeConfig.smallStyle,),
      ),
    );
  }
}
