import 'package:auto_size_text/auto_size_text.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../config/theme_config.dart';
import '../utils/utils.dart';

class MyDropdown2Ez extends StatelessWidget {
  const MyDropdown2Ez({
    Key? key,
    required this.items,
    this.height,
    this.title,
    required this.onChanged,
    required this.value,
    this.fontSize,
    this.hint,
    this.style,
    this.widthText
  }) : super(key: key);
  final Map items;
  final Function(dynamic)? onChanged;
  final double? height;
  final dynamic value;
  final hint;
  final TextStyle? style;
  final String? title;
  final double? fontSize;
  final widthText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: widthText??getSize(180),
            child: title != ''
                ? AutoSizeText('$title:',
                style: style ?? ThemeConfig.defaultStyle.copyWith(fontWeight: FontWeight.bold, height: 3))
                : const SizedBox(),
          ),
          Expanded(
            child: SizedBox(
              height: height ?? getSize(50),
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  isDense: true,
                  buttonStyleData: ButtonStyleData(
                    height: 40,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: ThemeConfig.greyColor)),
                  ),
                  hint: hint !=null ? Text(hint, style: TextStyle(fontSize: fontSize ?? ThemeConfig.defaultSize, color: ThemeConfig.greyColor),) : null,
                  isExpanded: true,
                  style: TextStyle(fontSize: fontSize ?? ThemeConfig.defaultSize, color: ThemeConfig.blackColor),
                  onChanged: onChanged,
                  value: value,
                  items: items.entries
                      .map<DropdownMenuItem>((entry) => DropdownMenuItem(
                          value: entry.key,
                          child: Text(
                            entry.value,
                            style: style,
                          )))
                      .toSet()
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
