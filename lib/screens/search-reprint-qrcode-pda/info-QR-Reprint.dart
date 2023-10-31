import 'package:app_print_qrcode_lda/model/qrcode.dart';
import 'package:app_print_qrcode_lda/screens/search-reprint-qrcode-pda/reprint-screen.dart';
import 'package:app_print_qrcode_lda/screens/search-reprint-qrcode-window/widget/info-qr-code.dart';
import 'package:app_print_qrcode_lda/utils/utils.dart';
import 'package:app_print_qrcode_lda/widget/label_value.dart';
import 'package:app_print_qrcode_lda/widget/my_search_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';

import '../../api/rest_api/api.dart';
import '../../controller/app_controller.dart';
import '../../widget/common_scaffold.dart';
import '../../widget/my_dropdown2.dart';


class InfoQRReprint extends StatefulWidget {
  List<String> listQRCode = [];

  InfoQRReprint({required this.listQRCode});

  _InfoQRReprintState createState() => _InfoQRReprintState();
}

class _InfoQRReprintState extends State<InfoQRReprint> {
  RxString? valueQRCode = ''.obs;
  String index = '';
  RxBool isSelected = false.obs;
  RxString line =''.obs;
  RxInt typePrint = 0.obs;


  Future<QRCode> getinfoQRCode() async {
    return await api.infoQRCode({'qrcode': valueQRCode});
  }

  Future reprintQRCode() async {
    String qrcode = valueQRCode!.value;
    String line1 = line.value;
    dynamic param = {'qrcode': qrcode, 'line': line1, 'page': typePrint.value};
    print(param.toString());
    print("$qrcode $line1 ${typePrint.value}");
    await api.reprintQRode(param).then((value) {
      if (value.result!.isNotEmpty) {
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

  @override
  Widget build(BuildContext context) {

    Widget infoQRCode(QRCode model) {
      if (model.qrCode!.isNotEmpty) {
        index = model.qrCode!.split('-')[1];
      } else {
        index = '';
      }
      return Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
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
      );
    }

    // TODO: implement build
    return CommonScaffold(
      title: 'Tìm kiếm & in lại QR Code',
      allowBack: true,
      bottom:    Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            line.value =appController.mapLine.keys.first;

            Get.dialog(
                AlertDialog(
                  title: const Text(
                    'Xác nhận in',
                    style: TextStyle(color: Colors.indigo),
                  ),
                  content: SizedBox(
                    height: Get.height*0.25,
                    width: Get.width*0.8,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Obx(() => TextField(
                          textAlign: TextAlign.start,
                          minLines: 1,
                          enabled: false,
                          style: const TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                            hintText: valueQRCode!.value,
                            border: const OutlineInputBorder(),
                            prefixIcon: const Icon(
                              Icons.qr_code,
                              size: 32,
                            ),
                          ),
                        )),
                        Obx(() => MyDropdown2Ez(
                            items: appController.mapLine,
                            widthText: getSize(100),
                            title: 'Line in',
                            hint: 'Chọn line in',
                            onChanged: (v) {
                              line.value = v;
                            },
                            value:  line.value)),
                        Obx(() =>  MyDropdown2Ez(
                            items: const {0:'In tem dọc',1:'In tem ngang'},
                            title: 'Kiểu in',
                            widthText: getSize(100),

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
                          reprintQRCode()
                              .then((value) => Get.back());
                        },
                        child: const Text('Xác nhận'))
                  ],
                )
            );

          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            backgroundColor: MaterialStateProperty.all(const Color(0xFF3459E6)),
          ),
          child: const Text('In tem',
              style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
      child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: SingleChildScrollView(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Center(
                      child: MySearchDropdown(
                          items:  {for (var state in widget.listQRCode) state: state},
                          onChanged: (item) {
                            valueQRCode!.value = item.toString();
                            isSelected.value = true;
                            print('$item');
                          },
                          )
                      // child: GFSearchBar(
                      //   searchBoxInputDecoration: InputDecoration(),
                      //   searchList: widget.listQRCode,
                      //   searchQueryBuilder: (query, list) {
                      //     return widget.listQRCode
                      //         .where((item) => item
                      //             .toLowerCase()
                      //             .contains(query.toLowerCase()))
                      //         .toList();
                      //   },
                      //   overlaySearchListItemBuilder: (String? item) {
                      //     return Container(
                      //       padding: const EdgeInsets.all(8),
                      //       child: Text(
                      //         item!,
                      //         style: const TextStyle(fontSize: 18),
                      //       ),
                      //     );
                      //   },
                      //
                      //   onItemSelected: (item) {
                      //       valueQRCode!.value = item.toString();
                      //       isSelected.value = true;
                      //       print('$item');
                      //   },
                      //
                      // ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 16),
                      child: const Text('Thông tin QR Code', style: TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),)),
                 Obx(() => isSelected.value
                     ? FutureBuilder(
                     future: getinfoQRCode(),
                     builder: (BuildContext context,
                         AsyncSnapshot<QRCode> snapshot) {
                       if (snapshot.hasData) {
                         return Padding(
                           padding: const EdgeInsets.all(16.0),
                           child: infoQRCode(snapshot.data!),
                         );
                       } else {
                         return const Center(
                             child: SpinKitDualRing(
                               size: 100,
                               color: Colors.lightBlue,
                             ));
                       }
                     })
                     : Container()),
                ],
              ),
            ),
          )),
    );
  }
}
