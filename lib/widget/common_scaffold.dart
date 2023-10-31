import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

import '../config/app_config.dart';
import '../config/theme_config.dart';
import '../controller/app_controller.dart';
import '../utils/utils.dart';

// ignore: must_be_immutable
class CommonScaffold extends StatefulWidget {
  Widget child;
  Widget? bottom;

  String? title;
  bool allowBack;
  CommonScaffold({super.key, required this.child, this.title, this.allowBack = false,this.bottom});
  @override
  State<CommonScaffold> createState() => _CommonScaffoldState();
}

class _CommonScaffoldState extends State<CommonScaffold> {
  _buildHeaderButton(){
    return PopupMenuButton(
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
         PopupMenuItem(
          height: (40),
          value: 1,
          padding: EdgeInsets.zero,
          onTap: () {
            appController.logout();
          },
          child: Row(
            children: [
              Expanded(child: Container(
                padding: EdgeInsets.symmetric(vertical: ThemeConfig.defaultPadding/4,horizontal: ThemeConfig.defaultPadding/2),
                child: Text('Đăng xuất',style: ThemeConfig.defaultStyle.copyWith(color: ThemeConfig.primaryColor),),
              ))
            ],
          ),
        ),
      ],
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: ThemeConfig.defaultPadding/2),
        decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(ThemeConfig.borderRadius/2)
        ),
        child: Row(
          children: [
            AutoSizeText(
              'Xin chào, ${appController.user}',
              style: TextStyle(
                  color: ThemeConfig.primaryColor,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w400),
            ),
            Icon(
              Icons.arrow_drop_down_outlined,
              size: (26),
              color: ThemeConfig.primaryColor,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(widget.title!,style: ThemeConfig.defaultStyle),
          actions: [
            _buildHeaderButton()
          ],
          leading: widget.allowBack? InkWell(
            onTap: (){
              Get.back();
            },
            child: const Icon(Icons.arrow_back_outlined,color: Colors.black,),
          ): const SizedBox(),
        ),
        body: widget.child,
        bottomNavigationBar: widget.bottom ??Container(
          height: 30,
          padding: const EdgeInsets.only(bottom: 10),
          alignment: Alignment.bottomCenter,
          child:
          Text(AppConfig.version, style: ThemeConfig.smallStyle,),
        ),
      ),
    );
  }
}
