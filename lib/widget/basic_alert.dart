import 'package:cherry_toast/cherry_toast.dart';
import 'package:cherry_toast/resources/arrays.dart';
import 'package:cherry_toast/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

import '../config/theme_config.dart';
import '../utils/navigation_service.dart';

class BasicAlert {
  static successToast({
    BuildContext? context,
    required String content,
  }) =>
      CustomToast.success(
        title: Text(
          'Thông báo',
          style: ThemeConfig.titleStyle,
        ),
        displayCloseButton: false,
        description: Text(content),

        animationType: AnimationType.fromTop,
        animationDuration: const Duration(milliseconds: 200),
        toastDuration: const Duration(seconds: 1, milliseconds: 500),
        toastPosition: Position.top,
      ).show(context ?? NavigationService.navigatorKey.currentContext!);

  static errorToast({
    BuildContext? context,
    required String content,
  }) =>
      CustomToast.error(
        title: Text(
          'Thông báo',
          style: ThemeConfig.titleStyle,
        ),
        description: Text(content),
        displayCloseButton: false,
        animationType: AnimationType.fromTop,
        animationDuration: const Duration(milliseconds: 200),
        toastDuration: const Duration(seconds: 1, milliseconds: 500),
        toastPosition: Position.top,
      ).show(context ?? NavigationService.navigatorKey.currentContext!);

  static successAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    Widget? widget,
    bool? showCancelBtn,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
          title: title,
          width: width ?? 500,
          confirmBtnText: confirmBtnText ?? 'Xác nhận',
          widget: widget,
          onConfirmBtnTap: onConfirmBtnTap,
          onCancelBtnTap: onCancelBtnTap,
          context: context,
          showCancelBtn: showCancelBtn ?? false,
          type: QuickAlertType.success,
          customAsset: 'assets/gif/success.gif',
          cancelBtnText: "Hủy");

  static warningAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    bool? showCancelBtn,
    Widget? widget,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
          title: title,
          showCancelBtn: showCancelBtn ?? false,
          width: width ?? 500,
          confirmBtnText: confirmBtnText ?? 'Xác nhận',
          widget: widget,
          context: context,
          onConfirmBtnTap: onConfirmBtnTap,
          onCancelBtnTap: onCancelBtnTap,
          type: QuickAlertType.warning,
          customAsset: 'assets/gif/warning.gif',
          cancelBtnText: "Hủy");

  static errorAlert(
    BuildContext context, {
    required String title,
    String? confirmBtnText,
    double? width,
    Widget? widget,
    bool? showCancelBtn,
    void Function()? onConfirmBtnTap,
    void Function()? onCancelBtnTap,
  }) =>
      QuickAlert.show(
        width: width ?? 500,
        title: title,
        confirmBtnText: confirmBtnText ?? 'Xác nhận',
        onConfirmBtnTap: onConfirmBtnTap,
        onCancelBtnTap: onCancelBtnTap,
        widget: widget,
        showCancelBtn: showCancelBtn ?? false,
        context: context,
        type: QuickAlertType.error,
        customAsset: 'assets/gif/error.gif',
      );
}
// ignore: must_be_immutable
class CustomToast extends CherryToast {
  CustomToast({
    super.key,
    required super.title,
    required super.icon,
    required super.themeColor,
    super.iconColor = Colors.black,
    super.action,
    super.backgroundColor = defaultBackgroundColor,
    super.shadowColor = defaultShadowColor,
    super.actionHandler,
    super.description,
    super.iconWidget,
    super.displayTitle = true,
    super.toastPosition = Position.top,
    super.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    super.animationCurve = Curves.ease,
    super.animationType = AnimationType.fromLeft,
    super.autoDismiss = true,
    super.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    super.layout = ToastLayout.ltr,
    super.displayCloseButton = true,
    super.borderRadius = 20,
    super.displayIcon = true,
    super.enableIconAnimation = true,
    super.iconSize = 20,
  });



   CustomToast.success({
     Key? key,
    required super.title,
    super.action,
    super.actionHandler,
    super.description,
    super.backgroundColor = defaultBackgroundColor,
    super.shadowColor = defaultShadowColor,
    super.displayTitle = true,
    super.toastPosition = Position.top,
    super.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    super.animationCurve = Curves.ease,
    super.animationType = AnimationType.fromLeft,
    super.autoDismiss = true,
    super.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    super.layout = ToastLayout.ltr,
    super.displayCloseButton = true,
    super.borderRadius = 20,
    super.iconWidget,
    super.displayIcon = true,
    super.enableIconAnimation = true,
  }) : super.success(key: key)  {
    icon = Icons.check_circle;
    _initializeAttributes(successColor);
  }


  CustomToast.error({
    Key? key,
    required super.title,
    super.action,
    super.actionHandler,
    super.backgroundColor = defaultBackgroundColor,
    super.shadowColor = defaultShadowColor,
    super.description,
    super.displayTitle = true,
    super.toastPosition = Position.top,
    super.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    super.animationCurve = Curves.ease,
    super.animationType = AnimationType.fromLeft,
    super.autoDismiss = true,
    super.iconWidget,
    super.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    super.layout = ToastLayout.ltr,
    super.displayCloseButton = true,
    super.borderRadius = 20,
    super.displayIcon = true,
    super.enableIconAnimation = true,
  }) : super.error(key: key) {
    icon = Icons.error_rounded;
    _initializeAttributes(errorColor);
  }


  CustomToast.warning({
    Key? key,
    required super.title,
    super.action,
    super.actionHandler,
    super.description,
    super.displayTitle = true,
    super.backgroundColor = defaultBackgroundColor,
    super.shadowColor = defaultShadowColor,
    super.toastPosition = Position.top,
    super.animationDuration = const Duration(
      milliseconds: 1500,
    ),
    super.animationCurve = Curves.ease,
    super.animationType = AnimationType.fromLeft,
    super.autoDismiss = true,
    super.toastDuration = const Duration(
      milliseconds: 3000,
    ),
    super.layout = ToastLayout.ltr,
    super.displayCloseButton = true,
    super.borderRadius = 20,
    super.iconWidget,
    super.displayIcon = true,
    super.enableIconAnimation = true,
  }) : super.warning(key: key) {
    icon = Icons.warning_rounded;
    _initializeAttributes(warningColor);
  }

  void _initializeAttributes(Color color) {
    themeColor = color;
    iconColor = color;
    iconSize = 20;
  }

  @override
  void show(BuildContext context) {
    Navigator.of(context).push(
      PageRouteBuilder(
        fullscreenDialog: false,
        barrierColor: Colors.grey.withOpacity(0.1),
        opaque: false,
        barrierDismissible: false,
        pageBuilder: (_, __, ___) => GestureDetector(
          child: SafeArea(
            child: AlertDialog(
              backgroundColor: Colors.transparent,
              elevation: 0,
              content: Column(
                mainAxisAlignment: toastPosition == Position.bottom
                    ? MainAxisAlignment.end
                    : MainAxisAlignment.start,
                children: [
                  SizedBox(
                    child: this,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
