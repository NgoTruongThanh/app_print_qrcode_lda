import 'package:app_print_qrcode_lda/model/qrcode.dart';
import 'package:app_print_qrcode_lda/screens/search-reprint-qrcode-window/widget/info-qr-code.dart';
import 'package:app_print_qrcode_lda/utils/utils.dart';
import 'package:app_print_qrcode_lda/widget/common_scaffold.dart';
import 'package:app_print_qrcode_lda/widget/my_dropdown2.dart';
import 'package:app_print_qrcode_lda/widget/my_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../../api/rest_api/api.dart';
import '../../controller/app_controller.dart';
import '../search-reprint-qrcode-pda/reprint-screen.dart';

class SearchQRCodeScreen extends StatefulWidget {
  const SearchQRCodeScreen({super.key});

  @override
  _SearchQRCodeScreenState createState() => _SearchQRCodeScreenState();
}

class _SearchQRCodeScreenState extends State<SearchQRCodeScreen> {
  TextEditingController lotController = TextEditingController();
  RxString product = ''.obs;
  RxString type = ''.obs;
  RxString packet = ''.obs;

  QRCode model = QRCode();
  int lot = 0;
  RxList<String> listQRCode = <String>[].obs;
  RxInt selectedIndex = (-1).obs;

  RxString qrcodeSelected = ''.obs;
  String index = '';

  TextEditingController searchController = TextEditingController();

  Widget listTileQRCode(List<String> list) {
    return Column(
      children: [
        ListTile(
          title: TextField(
            controller: searchController,
            onChanged: (value) {
              String filter = value.toUpperCase();
              _filterListQRCode(filter);
            },
          ),
          leading: const Icon(Icons.search),
        ),
        Flexible(
          child: ListView.separated(
              itemCount: list.length,
              separatorBuilder: (BuildContext context, int index) => Container(),
              itemBuilder: (BuildContext context, int index) => Card(
                    child: Obx(() => ListTile(
                          tileColor: selectedIndex.value == index ? Colors.blue : null,
                          leading: const Icon(Icons.qr_code),
                          title: Text(
                            list[index],
                          ),
                          onTap: () {
                            qrcodeSelected.value = list[index];
                            print(qrcodeSelected);
                            selectedIndex.value = index;
                          },
                        )),
                  )),
        ),
      ],
    );
  }

  Future<QRCode> getinfoQRCode() async {
    return await api.infoQRCode({'qrcode': qrcodeSelected.value});
  }

  Future searchQRCode() async {
    model.product = product.value;
    model.type = type.value;
    model.packet = packet.value;
    model.lot = lot.toString();
    listQRCode.clear();
    List<QRCode> listModels = await api.findQRCode(model.toJsonSearch());
    print(model.toJsonSearch().toString());
    if (listModels.isNotEmpty) {
      for (QRCode qr in listModels) {
        listQRCode.add(qr.qrCode!);
      }
    }
    listBackup.value = listQRCode;
  }

  RxList<String> listBackup = <String>[].obs;

  _filterListQRCode(String text) {
    List<String> temp = [];
    listQRCode.value = listBackup.where((element) => element.contains(text)).toList();
  }

  @override
  void initState() {
    product.value = appController.mapProduct.keys.first;
    type.value = appController.mapType.keys.first;
    packet.value = appController.mapPacket.keys.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CommonScaffold(
        allowBack: true,
        title: 'Tìm kiếm & in lại QRCode',
        child: ScrollConfiguration(
          behavior: NoGlowBehaviour(),
          child: ListView(
            children: [
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                      lg: 6,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: MyInput(
                            title: 'Số lô',
                            widthText: getSize(120),
                            isRequired: true,
                            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                            hintText: 'số lô',
                            controller: lotController,
                            onChanged: (v) {
                              lot = int.parse(v);
                            }),
                      )),
                  ResponsiveGridCol(
                    lg: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => MyDropdown2Ez(
                          items: appController.mapProduct,
                          title: 'Sản phẩm',
                          widthText: getSize(120),
                          hint: 'Chọn sản phẩm',
                          onChanged: (v) {
                            product.value = v;
                          },
                          value: product.value)),
                    ),
                  ),
                ],
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => MyDropdown2Ez(
                          items: appController.mapType,
                          widthText: getSize(120),
                          title: 'Loại sản phẩm',
                          hint: 'Chọn sản phẩm',
                          onChanged: (v) {
                            type.value = v;
                          },
                          value: type.value)),
                    ),
                  ),
                  ResponsiveGridCol(
                    lg: 6,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(() => MyDropdown2Ez(
                          items: appController.mapPacket,
                          title: 'Loại bao',
                          widthText: getSize(120),
                          hint: 'Chọn loại bao',
                          onChanged: (v) {
                            packet.value = v;
                          },
                          value: packet.value)),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  padding: const EdgeInsets.only(left: 12, right: 12),
                  margin: const EdgeInsets.only(bottom: 8, top: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  width: 280,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () {
                      // print(lot);
                      searchQRCode();
                      selectedIndex.value = -1;
                      qrcodeSelected.value = '';
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(const Color(0xFF3459E6)),
                    ),
                    child: const Text('LẤY DANH SÁCH QR CODE',
                        style: TextStyle(color: Colors.white, fontSize: 16.0)),
                  ),
                ),
              ),
              const Divider(
                height: 1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Danh sách QR Code',
                        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Thông tin QR Code',
                        style: TextStyle(color: Colors.blue, fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    lg: 6,
                    child: Column(
                      children: [
                        ListTile(
                          title: TextField(
                            controller: searchController,
                            onChanged: (value) {
                              String filter = value.toUpperCase();
                              _filterListQRCode(filter);
                            },
                          ),
                          leading: const Icon(Icons.search),
                        ),
                        Obx(() => ListView.separated(
                            shrinkWrap: true,
                            itemCount: listQRCode.length,
                            separatorBuilder: (BuildContext context, int index) => Container(),
                            itemBuilder: (BuildContext context, int index) => Card(
                                    child: Obx(
                                  () => ListTile(
                                    tileColor: selectedIndex.value == index ? Colors.blue : null,
                                    leading: const Icon(Icons.qr_code),
                                    title: Text(listQRCode[index]),
                                    onTap: () {
                                      qrcodeSelected.value = listQRCode[index];
                                      print(qrcodeSelected);
                                      selectedIndex.value = index;
                                    },
                                  ),
                                )))),
                      ],
                    ),
                  ),
                  ResponsiveGridCol(
                      lg: 6,
                      child: Obx(() => qrcodeSelected.isNotEmpty
                          ? FutureBuilder(
                              future: getinfoQRCode(),
                              builder: (BuildContext context, AsyncSnapshot<QRCode> snapshot) {
                                if (snapshot.hasData) {
                                  return Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: InfoQRCode(
                                      model: snapshot.data!,
                                    ),
                                  );
                                } else {
                                  return const Center(
                                      child: SpinKitDualRing(
                                    size: 100,
                                    color: Colors.lightBlue,
                                  ));
                                }
                              })
                          : Container())),
                ],
              ),
            ],
          ),
        ));
  }
}
