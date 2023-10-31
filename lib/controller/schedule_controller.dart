

import 'package:get/get.dart';

ScheduleController scheduleController = Get.put(ScheduleController());


class ScheduleController extends GetxController {
  var startDate = DateTime.now().obs;
  var endDate = DateTime.now().add(Duration(days: 1)).obs;
  var minDate = DateTime(2000,1,1).obs;
  var maxDate =  DateTime(2050,1,1).obs;

  void updateMinMaxDates(var start, var end) {
      minDate.value = start;
      maxDate.value = end;
  }
}