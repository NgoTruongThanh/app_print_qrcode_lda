import 'dart:js_interop';

import 'package:app_print_qrcode_lda/config/list_string_config.dart';
import 'package:app_print_qrcode_lda/controller/app_controller.dart';
import 'package:app_print_qrcode_lda/utils/session_storage_helper.dart';
import 'package:app_print_qrcode_lda/widget/common_scaffold.dart';
import 'package:app_print_qrcode_lda/widget/my_dropdown2.dart';
import 'package:app_print_qrcode_lda/widget/my_input.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../api/rest_api/api.dart';
import '../../model/PrintModel.dart';
import '../../model/qrcode.dart';
import '../../utils/utils.dart';
import '../../widget/label_value.dart';
import '../search-reprint-qrcode-pda/reprint-screen.dart';

class PrintQRCodeScreen extends StatefulWidget {
  const PrintQRCodeScreen({super.key});

  @override
  State<PrintQRCodeScreen> createState() => _PrintQRCodeScreenState();
}

class _PrintQRCodeScreenState extends State<PrintQRCodeScreen> {
  QRCode qr = QRCode();
  RxString job = ''.obs;
  RxString type = ''.obs;
  RxString line = ''.obs;
  RxString product = ''.obs;
  RxString packet = ''.obs;
  RxInt typePrint = 0.obs;
  int? lot;
  int? numberPrint;
  String? index;
  RxBool isEmpty = false.obs;

  Map mapJob = {};
  Map mapType = {};
  Map mapLine = {};
  Map mapProduct = {};
  Map mapPacket = {};

  getData() async {
    await appController.initData();
    await appController.getStorage();
    mapProduct = await api.listProduct(mapProduct);
    mapJob = await api.listJob(mapJob);
    mapPacket = await api.listPacket(mapPacket);
    mapType = await api.listType(mapType);
    mapLine = await api.listLine(mapLine);

    print(mapJob);
    job.value = mapJob.keys.first;
    type.value = mapType.keys.first;
    line.value = mapLine.keys.first;
    product.value = mapProduct.keys.first;
    packet.value = mapPacket.keys.first;

  }

  @override
  void initState() {
    getData();

    // job.value =appController.mapJob.keys.first;
    // type.value =appController.mapType.keys.first;
    // line.value =appController.mapLine.keys.first;
    // product.value =appController.mapProduct.keys.first;
    // packet.value =appController.mapPacket.keys.first;
    super.initState();
  }

  getCode(String item) {
    switch (item) {
      case 'In tem dọc':
        return 0;
      case 'In tem ngang':
        return 1;
      case 'In Tem 50kg':
        return 3;
    }
  }

  _print() {
    if (lot != null && numberPrint != null) {
      printModel.job = job.value;
      printModel.lot = lot.toString();
      printModel.product = product.value;
      printModel.type = type.value;
      printModel.packet = packet.value;
      printModel.line = line.value;
      printModel.number = numberPrint;
      printModel.page = typePrint.value;
      printModel.empty = printModel.product!.contains('50') ? isEmpty.value : false;
      printModel.index = index;
      print(printModel.toJson().toString());
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: const Text(
                  'Xác nhận in',
                  style: TextStyle(color: Colors.indigo),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    getLabelLandValue('Công việc:', appController.mapJob.entries.firstWhere((element) => element.key == job.value).value),
                    getLabelLandValue('Line in:', appController.mapLine.entries.firstWhere((element) => element.key == line.value).value),
                    getLabelLandValue('Sản phẩm:', appController.mapProduct.entries.firstWhere((element) => element.key == product.value).value),
                    getLabelLandValue('Loại sản phẩm:', appController.mapType.entries.firstWhere((element) => element.key == type.value).value),
                    getLabelLandValue('Loại bao:', appController.mapPacket.entries.firstWhere((element) => element.key == packet.value).value),
                    getLabelLandValue('Số lô:', lot.toString()),
                    getLabelLandValue('Số tem in:', numberPrint.toString()),
                    //     getLabelLandValue('Kiểu in:', typePrint.value == 0 ? "In tem dọc" :"In tem ngang"),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () async {
                        await api.createQRode(printModel).then((value) {
                          if (value.isNotEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.green,
                                duration: const Duration(seconds: 2),
                                content: const Text(
                                  'In thành công',
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                action: SnackBarAction(
                                  textColor: Colors.white,
                                  label: 'Đóng',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.red,
                                duration: const Duration(seconds: 2),
                                content: const Text(
                                  'In thất bại',
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                action: SnackBarAction(
                                  textColor: Colors.white,
                                  label: 'Đóng',
                                  onPressed: () {
                                    // Code to execute.
                                  },
                                ),
                              ),
                            );
                          }
                        });
                        Get.back();
                      },
                      child: const Text('Xác nhận'))
                ],
              ));
    }
  }

  @override
  Widget build(BuildContext context) {
    final double widthResponsive = (MediaQuery.of(context).size.width * 0.25 < 350)
        ? 400
        : ((MediaQuery.of(context).size.width * 0.25 > 400) ? 450 : (MediaQuery.of(context).size.width * 0.25));
    return CommonScaffold(
      title: 'IN QRCODE',
      allowBack: true,
      bottom: Container(
        padding: const EdgeInsets.only(left: 12, right: 12),
        margin: const EdgeInsets.only(bottom: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        width: widthResponsive,
        height: 48,
        child: ElevatedButton(
          onPressed: () {
            _print();
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(const Color(0xFF3459E6)),
          ),
          child: const Text('IN', style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
      child: Center(
        child: Container(
          width: widthResponsive,
          child: ScrollConfiguration(
            behavior: NoGlowBehaviour(),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Obx(() => MyDropdown2Ez(
                        items: mapJob,
                        title: 'Công việc',
                        hint: 'Chọn công việc',
                        onChanged: (v) {
                          job.value = v;
                        },
                        value: job.value)),
                    Obx(() => MyDropdown2Ez(
                        items: mapLine,
                        title: 'Line in',
                        hint: 'Chọn line in',
                        onChanged: (v) {
                          line.value = v;
                        },
                        value: line.value)),
                    Obx(() => MyDropdown2Ez(
                        items: mapProduct,
                        title: 'Sản phẩm',
                        hint: 'Chọn sản phẩm',
                        onChanged: (v) {
                          product.value = v;
                        },
                        value: product.value)),
                    Obx(() => MyDropdown2Ez(
                        items: mapType,
                        title: 'Loại sản phẩm',
                        hint: 'Chọn sản phẩm',
                        onChanged: (v) {
                          type.value = v;
                        },
                        value: type.value)),
                    Obx(() => MyDropdown2Ez(
                        items: mapPacket,
                        title: 'Loại bao',
                        hint: 'Chọn loại bao',
                        onChanged: (v) {
                          packet.value = v;
                        },
                        value: packet.value)),
                    MyInput(
                        title: 'Số lô',
                        isRequired: true,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        hintText: 'số lô',
                        onChanged: (v) {
                          lot = int.parse(v);
                        }),
                    MyInput(
                        title: 'Số tem',
                        isRequired: true,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        hintText: 'số tem',
                        onChanged: (v) {
                          numberPrint = int.parse(v);
                        }),
                    Obx(() => MyDropdown2Ez(
                        items: const {0: 'In tem dọc', 1: 'In tem ngang', 3: 'In tem 50KG'},
                        title: 'Kiểu in',
                        hint: 'Chọn kiểu in',
                        onChanged: (v) {
                          typePrint.value = v;
                        },
                        value: typePrint.value)),
                    Obx(() => product.value.contains('50')
                        ? Column(
                            children: [
                              customSwitch(),
                              !isEmpty.value
                                  ? MyInput(
                                      title: 'Stt bắt đầu',
                                      isRequired: true,
                                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                                      hintText: 'Nhập số thứ tự bắt đầu',
                                      onChanged: (v) {
                                        index = v;
                                      })
                                  : const SizedBox(),
                            ],
                          )
                        : const SizedBox.shrink()),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget customSwitch() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: getSize(180),
            child: const Text(
              "Số bao 50kg trong block",
              style: TextStyle(fontSize: 17),
            ),
          ),
          Expanded(
            child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 0.5), borderRadius: BorderRadius.circular(15)),
                //padding: const EdgeInsets.only(left: 10.0, right: 5.0),
                height: 42,
                child: InkWell(
                  onTap: () {
                    isEmpty.value = !isEmpty.value;
                  },
                  child: Obx(() => Row(
                        children: [
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: isEmpty.value ? Colors.blue : Colors.white, borderRadius: BorderRadius.circular(15)),
                              child: Text('Block trống', style: TextStyle(fontSize: 16, color: isEmpty.value ? Colors.white : Colors.black)),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(color: !isEmpty.value ? Colors.blue : Colors.white, borderRadius: BorderRadius.circular(15)),
                              child: Text('Block đủ',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: !isEmpty.value ? Colors.white : Colors.black,
                                  )),
                            ),
                          ),
                        ],
                      )),
                )),
          ),
        ],
      ),
    );
  }
}
