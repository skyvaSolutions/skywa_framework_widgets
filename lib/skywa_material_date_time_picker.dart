import 'package:flutter/material.dart';

class SkywaMaterialDateTimePicker {
  static DateTime now = DateTime.now();
  static TimeOfDay nowTime = TimeOfDay.now();

  static Future<DateTime?> showSkywaDatePicker({
    required BuildContext context,
    DateTime? initialDateTime,
    DateTime? minimumDate,
    DateTime? maximumDate,
  }) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            onSurface: Theme.of(context).primaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: child!,
      ),
      initialDate: initialDateTime ?? now,
      firstDate: minimumDate ?? now.subtract(const Duration(minutes: 1)),
      lastDate: maximumDate ?? DateTime(now.year + 1, now.month, now.day),
    );
    return pickedDate;
  }

  static Future<TimeOfDay?> showSkywaTimePicker({
    required BuildContext context,
    TimeOfDay? initialDateTime,
  }) async {
    TimeOfDay? pickedDate = await showTimePicker(
      context: context,
      builder: (context, child) => Theme(
        data: Theme.of(context).copyWith(
          colorScheme: ColorScheme.light(
            primary: Theme.of(context).primaryColor,
            onPrimary: Colors.white,
            onSurface: Theme.of(context).primaryColor,
          ),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
          ),
        ),
        child: child!,
      ),
      initialTime: initialDateTime ?? nowTime,
    );
    return pickedDate;
  }
}
