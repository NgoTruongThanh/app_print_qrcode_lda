import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

import '../config/app_config.dart';
DateTime getDateTimeFromString(String datetime, String format) {
  try {
    return DateFormat(format).parse(datetime);
  } catch (e) {
    return DateTime.now();
  }
}

DateTime? getDateTimeFromStringDashboard(String datetime, String format) {
  try {
    return DateFormat(format).parse(datetime);
  } catch (e) {
    //  print(e);
    return null;
  }
}

String getStringFromDateTime(DateTime datetime, String format) {
  try {
    return DateFormat(format).format(datetime);
  } catch (e) {
    return '';
  }
}

String getMoneyFormat(dynamic money, {int precision = 0}) {
  int decimals = 0;
  if (money.toString().split('.').length > 2) {
    decimals = money.toString().split('.')[1].length;
  }
  decimals = decimals > 3 ? 3 : 3;
  if (money == null) return '';

  var controller = MoneyMaskedTextController(

      decimalSeparator: (decimals == 0) ? '' : '.', thousandSeparator: ',', precision: decimals);

  controller.updateValue(money * 1.0);

  return controller.text;
}

double convertToDouble(value) {
  try {
    if (value is int) {
      return value.toDouble() * 1.0;
    }
    return value;
  } catch (e) {
    return 0;
  }
}

double getSize(double size) {
  var shortestSide = Get.width > AppConfig.LARGE_SIZE ? AppConfig.LARGE_SIZE : Get.width;
  if (shortestSide > 600) {
    return size;
  } else {
    return size * (shortestSide / 600);
  }
}

DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(value: item, child: Text(item));


