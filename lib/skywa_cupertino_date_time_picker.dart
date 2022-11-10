import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SkywaCupertinoDateTimePicker {
  final BuildContext context;
  final bool use24hFormat;
  final ValueChanged<DateTime> onDateTimeChanged;
  final DateTime? initialDateTime;
  final DateTime? minimumDate;
  final DateTime? maximumDate;
  final int? minimumYear;
  final int? maximumYear;
  final int minuteInterval;

  SkywaCupertinoDateTimePicker.dateAndTime({
    required this.context,
    required this.onDateTimeChanged,
    this.use24hFormat = false,
    this.initialDateTime,
    this.minimumDate,
    this.minimumYear,
    this.maximumDate,
    this.maximumYear,
    this.minuteInterval = 1,
  }) {
    showSkywaDateTimePicker();
  }

  SkywaCupertinoDateTimePicker.date({
    required this.context,
    required this.onDateTimeChanged,
    this.use24hFormat = false,
    this.initialDateTime,
    this.minimumDate,
    this.minimumYear,
    this.maximumDate,
    this.maximumYear,
  }) : this.minuteInterval = 1 {
    showSkywaDatePicker();
  }

  SkywaCupertinoDateTimePicker.time({
    required this.context,
    required this.onDateTimeChanged,
    this.use24hFormat = false,
    this.initialDateTime,
    this.minimumDate,
    this.minimumYear,
    this.maximumDate,
    this.maximumYear,
    this.minuteInterval = 1,
  }) {
    showSkywaTimePicker();
  }

  DateTime now = DateTime.now();

  void showSkywaDateTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: onDateTimeChanged,
            minuteInterval: minuteInterval,
            initialDateTime: initialDateTime ?? now,
            use24hFormat: use24hFormat,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            minimumDate:
                minimumDate ?? now.subtract(const Duration(seconds: 59)),
            minimumYear: minimumYear ?? now.year,
            maximumDate:
                maximumDate ?? DateTime(now.year + 1, now.month, now.day),
            maximumYear: maximumYear ?? now.year + 1,
          ),
        );
      },
    );
  }

  void showSkywaDatePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: onDateTimeChanged,
            initialDateTime: initialDateTime ?? now,
            use24hFormat: use24hFormat,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            minimumDate:
                minimumDate ?? now.subtract(const Duration(minutes: 1)),
            minimumYear: minimumYear ?? now.year,
            maximumDate:
                maximumDate ?? DateTime(now.year + 1, now.month, now.day),
            maximumYear: maximumYear ?? now.year + 1,
          ),
        );
      },
    );
  }

  void showSkywaTimePicker() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 250.0,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.time,
            minuteInterval: minuteInterval,
            onDateTimeChanged: onDateTimeChanged,
            initialDateTime: initialDateTime ?? DateTime.now(),
            use24hFormat: use24hFormat,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        );
      },
    );
  }
}
