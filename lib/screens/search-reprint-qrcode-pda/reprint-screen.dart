import 'package:app_print_qrcode_lda/controller/app_controller.dart';
import 'package:app_print_qrcode_lda/model/qrcode.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../../api/rest_api/api.dart';
import '../../utils/utils.dart';
import '../../widget/common_scaffold.dart';
import '../../widget/my_dropdown2.dart';
import '../../widget/my_input.dart';
import 'info-QR-Reprint.dart';

class ReprintScreenPDA extends StatefulWidget {
  _ReprintScreenState createState() => _ReprintScreenState();
}

class _ReprintScreenState extends State<ReprintScreenPDA> {
  TextEditingController lotController = TextEditingController();
  QRCode model = QRCode();
  List<String> listQRCode = [];
  RxString product = ''.obs;
  RxString type = ''.obs;
  RxString packet = ''.obs;
  int loT = 0;
  bool isHaveData = false;

  Map mapType = {};
  Map mapProduct = {};
  Map mapPacket = {};

  getData() async {
    await appController.initData();
    await appController.getStorage();
    mapProduct = await api.listProduct(mapProduct);
    mapPacket = await api.listPacket(mapPacket);
    mapType = await api.listType(mapType);

    type.value = mapType.keys.first;
    product.value = mapProduct.keys.first;
    packet.value = mapPacket.keys.first;
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
    product.value = appController.mapProduct.keys.first;
    type.value = appController.mapType.keys.first;
    packet.value = appController.mapPacket.keys.first;
  }

  Future searchQRCode() async {
    model.product = product.value;
    model.type = type.value;
    model.packet = packet.value;
    model.lot = loT.toString();

    listQRCode.clear();
    List<QRCode> listModels = await api.findQRCode(model.toJsonSearch());
    print(model.toJsonSearch().toString());
    if (listModels.isNotEmpty) {
      for (QRCode qr in listModels) {
        listQRCode.add(qr.qrCode!);
      }
      isHaveData = true;
    } else {
      isHaveData = false;
    }
    print(model.toJsonSearch().toString());
  }

  @override
  Widget build(BuildContext context) {
    final sp = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => MyDropdown2Ez(
          items: mapProduct,
          title: 'Sản phẩm',
          widthText: getSize(120),
          hint: 'Chọn sản phẩm',
          onChanged: (v) {
            product.value = v;
            searchQRCode();
          },
          value: product.value)),
    );
    final loaiSp = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => MyDropdown2Ez(
          items: mapType,
          widthText: getSize(120),
          title: 'Loại sản phẩm',
          hint: 'Chọn sản phẩm',
          onChanged: (v) {
            type.value = v;
            searchQRCode();
          },
          value: type.value)),
    );
    final loaiBao = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => MyDropdown2Ez(
          items: mapPacket,
          title: 'Loại bao',
          widthText: getSize(120),
          hint: 'Chọn loại bao',
          onChanged: (v) {
            packet.value = v;
            searchQRCode();
          },
          value: packet.value)),
    );

    final lot = Padding(
      padding: const EdgeInsets.all(8.0),
      child: MyInput(
          title: 'Số lô',
          widthText: getSize(120),
          isRequired: true,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          hintText: 'số lô',
          controller: lotController,
          onChanged: (v) {
            loT = int.parse(v);
            searchQRCode();
          }),
    );
    // TODO: implement build

    return CommonScaffold(
      allowBack: true,
      title: 'Tìm kiếm & in lại QRCode',
      bottom: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: ElevatedButton(
          onPressed: () {
            if (listQRCode.isNotEmpty) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => InfoQRReprint(listQRCode: listQRCode)),
              );
            }
          },
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.all(15.0)),
            backgroundColor: MaterialStateProperty.all(const Color(0xFF3459E6)),
          ),
          child: const Text('Tìm kiếm', style: TextStyle(color: Colors.white, fontSize: 16.0)),
        ),
      ),
      child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: Center(
            child: ListView(
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Column(
                      children: [
                        ResponsiveGridRow(
                          children: [
                            ResponsiveGridCol(lg: 6, child: lot),
                            ResponsiveGridCol(lg: 6, child: sp),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        ResponsiveGridRow(
                          children: [
                            ResponsiveGridCol(lg: 6, child: loaiSp),
                            ResponsiveGridCol(lg: 6, child: loaiBao),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
