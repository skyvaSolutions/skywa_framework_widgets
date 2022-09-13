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

  SkywaCupertinoDateTimePicker.dateAndTime({
    required this.context,
    required this.onDateTimeChanged,
    this.use24hFormat = false,
    this.initialDateTime,
    this.minimumDate,
    this.minimumYear,
    this.maximumDate,
    this.maximumYear,
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
  }) {
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
            initialDateTime: initialDateTime ?? now,
            use24hFormat: use24hFormat,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
            minimumDate: minimumDate ?? now.subtract(Duration(seconds: 59)),
            minimumYear: minimumYear ?? now.year,
            maximumDate:
                maximumDate ?? DateTime(now.year, now.month, now.day + 30),
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
                maximumDate ?? DateTime(now.year, now.month, now.day + 30),
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
            onDateTimeChanged: onDateTimeChanged,
            initialDateTime: DateTime.now(),
            use24hFormat: use24hFormat,
            backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
          ),
        );
      },
    );
  }
}
