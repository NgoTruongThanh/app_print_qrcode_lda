import 'package:app_print_qrcode_lda/utils/utils.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/theme_config.dart';

class MySearchDropdown extends StatelessWidget {
  const MySearchDropdown({
    Key? key,
    required this.items,
    this.height,
    required this.onChanged,
    this.value,  this.colorBorder ,
    this.firstValue = false,
    this.width
  }) : super(key: key);
  final Map<dynamic, dynamic> items;
  final Function(dynamic)? onChanged;
  final double? height;
  final double? width;
  final String? value;
  final Color? colorBorder ;
  final bool? firstValue;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width??Get.width *0.9,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        border: Border.all(width: 1, color: colorBorder?? Colors.grey),
        boxShadow: [
          BoxShadow(
            color: ThemeConfig.darkBluePrimary,
            offset: const Offset(-7, 5), // changes position of shadow
          ),
        ],
      ),
      child: DropdownSearch<String>(
        enabled: items.values.map((value) => value as String).toList().isNotEmpty?true:false,
        popupProps: PopupProps.menu(
          showSelectedItems: true,
          showSearchBox: true,
          fit: FlexFit.loose,
          isFilterOnline: true,
          searchDelay: const Duration(seconds: 0),
          disabledItemFn: (String s) => s.startsWith('A'),
        ),
        items: items.values.map((value) => value as String).toList(),
        onChanged: onChanged,
      ),
    );
  }
}
