import 'dart:developer';
import 'package:flutter/material.dart';
import 'date_time_formator.dart';

Future<DateTime> showDateOnlyPicker(
  BuildContext context,
) async {
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2030),
  );
  return selectedDate ?? DateTime.now();
}

Future<TimeOfDay> showTimeOnlyPicker(
  BuildContext context,
) async {
  TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  return selectedTime ?? TimeOfDay.now();
}

Future<String> showDateTimePicker(
  BuildContext context,
) async {
  TimeOfDay? selectedTime;
  DateTime? selectedDate;
  selectedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2000),
    lastDate: DateTime(2030),
  );

  if (selectedDate != null) {
    selectedTime =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
  } else {
    selectedTime = TimeOfDay.now();
  }

  String formatedDate =
      DateTimeFormatter.showDateOnly.format(selectedDate ?? DateTime.now());
  var formatedTime = selectedTime?.format(context);

  log("Here is the date : $formatedDate");
  log("Here is the time : $formatedTime");
  String? formatedDateTime = "${formatedDate} ${formatedTime.toString()}";
  log("Here is the date & time : $formatedDateTime");

  return formatedDateTime;
}
