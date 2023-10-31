import 'package:app_print_qrcode_lda/model/qrcode.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/rest_api/api.dart';
import '../../../controller/app_controller.dart';
import '../../../widget/label_value.dart';
import '../../../widget/my_dropdown2.dart';


class InfoQRCode extends StatelessWidget {
  QRCode model;
  String index = '';
  RxString line =''.obs;
  RxInt typePrint = 0.obs;

  InfoQRCode({required this.model});


  @override
  Widget build(BuildContext context) {
    if (model.qrCode!.isNotEmpty) {
      index = model.qrCode!.split('-')[1];
    } else {
      index = '';
    }

    Future reprintQRCode() async {
      String qrcode = model.qrCode!;
      String line1 = line.value;
      dynamic param = {'qrcode': qrcode, 'line': line1, 'page': typePrint.value};
      print(param.toString());
      print("$qrcode $line1 ${typePrint.value}");
      await api.reprintQRode(param).then((value) {
        if (value.result!.isNotEmpty) {
          // MotionToast.success(
          //     title:  Text("Success Motion Toast"),
          //     description:  Text("Example of success motion toast"),
          //     height: 50,
          //     width:  300
          // ).show(context);
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
    }

    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                SelectableText(
                  model.qrCode!,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                getLabelLandValue('Sản phẩm: ', model.product!),
                getLabelLandValue('Loại sản phẩm: ', model.type!),
                getLabelLandValue('Loại bao: ', model.packet!),
                getLabelLandValue('Lô: ', model.lot!),
                getLabelLandValue('Series bao: ', index),
                getLabelLandValue('Số bao: ', model.unit.toString()),
                getLabelLandValue('Kho: ', model.warehouse!),
                getLabelLandValue('Trạng thái: ', getState(model.state!)),
              ],
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 12, right: 12),
          margin: const EdgeInsets.only(bottom: 8, top: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          width: MediaQuery.of(context).size.width,
          height: 48,
          child: ElevatedButton(
            onPressed: () {
              // print(lot);
              // searchQRCode();
              // print(model);
              line.value =appController.mapLine.keys.first;
              Get.dialog(
                  AlertDialog(
                    title: const Text(
                      'Xác nhận in',
                      style: TextStyle(color: Colors.indigo),
                    ),
                    content: SizedBox(
                      height: Get.height*0.25,
                      width: Get.width*0.5,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            textAlign: TextAlign.start,
                            minLines: 1,
                            enabled: false,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              hintText: model.product,
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.qr_code,
                                size: 32,
                              ),
                            ),
                          ),
                          Obx(() => MyDropdown2Ez(
                              items: appController.mapLine,
                              title: 'Line in',
                              hint: 'Chọn line in',
                              onChanged: (v) {
                                line.value = v;
                              },
                              value:  line.value)),
                          Obx(() =>  MyDropdown2Ez(
                              items: const {0:'In tem dọc',1:'In tem ngang', 3: 'In tem 50KG'},
                              title: 'Kiểu in',
                              hint: 'Chọn kiểu in',
                              onChanged: (v) {
                                typePrint.value = v;
                              },
                              value: typePrint.value)),
                        ],
                      ),
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            reprintQRCode().then(
                                    (value) => Get.back());
                          },
                          child: const Text('Xác nhận'))
                    ],
                  )
              );
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(const Color(0xFF3459E6)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.print),
                SizedBox(
                  width: 10,
                ),
                Text('IN LẠI QR CODE',
                    style: TextStyle(color: Colors.white, fontSize: 16.0))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
getState(int state) {
  switch (state) {
    case 0:
      return '';
    case 1:
      return 'Tồn kho';
    case 2:
      return 'Xuất bán';
    default:
      return 'error';
  }
}