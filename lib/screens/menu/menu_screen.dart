
import 'package:app_print_qrcode_lda/widget/common_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

import 'package:get/get.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({super.key});

  @override
  Widget build(BuildContext context) {

    Widget buildButtonMenu({required String title, required String route}){
      return Container(
        width: MediaQuery.of(context).size.width > 390
            ? 500
            : MediaQuery.of(context).size.width,
        height: 80,
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ), backgroundColor: const Color(0xFFEAEAEA),
              alignment: Alignment.center),
          onPressed: () {
            Get.toNamed(route);
          },
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
      );
    }

    return CommonScaffold(
      title: 'Menu',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              buildButtonMenu(title: 'IN QR CODE', route: '/print-qrcode'),
              kIsWeb ? buildButtonMenu(title: 'TÌM KIẾM VÀ IN LẠI QRCODE', route: '/search-qrcode')
                  :buildButtonMenu(title: 'TÌM KIẾM VÀ IN LẠI QRCODE', route:'/search-qrcode-pda')
            ],
          ),
        ),
      ),
    );
  }
}
