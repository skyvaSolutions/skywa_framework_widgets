import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_cupertino_date_time_picker.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_material_date_time_picker.dart';

class SamplePickerScreen extends StatefulWidget {
  const SamplePickerScreen({Key? key}) : super(key: key);

  @override
  State<SamplePickerScreen> createState() => _SamplePickerScreenState();
}

class _SamplePickerScreenState extends State<SamplePickerScreen> {
  DateTime? dateTime;
  DateTime? date;
  TimeOfDay? time;
  DateTime? time12Hr;
  DateTime? time24Hr;
  DateTime? materialDate;
  TimeOfDay? materialTime24Hr;
  String? materialTime24HrString;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Pickers'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20.0),

            /// cupertino datetime picker
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Cupertino DateTime Picker',
              onTap: () {
                SkywaCupertinoDateTimePicker.dateAndTime(
                  context: context,
                  onDateTimeChanged: (DateTime _dateTime) {
                    setState(() {
                      dateTime = _dateTime;
                    });
                  },
                  initialDateTime: dateTime,
                  /*minimumYear: DateTime.now().year,
                  minimumDate: DateTime.now(),
                  maximumYear: DateTime.now().year + 1,
                  maximumDate: DateTime(now.year, now.month, now.day + 30),*/
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                dateTime.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// cupertino date picker
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Cupertino Date Picker',
              onTap: () {
                SkywaCupertinoDateTimePicker.date(
                  context: context,
                  onDateTimeChanged: (DateTime _date) {
                    setState(() {
                      date = _date;
                    });
                  },
                  initialDateTime: date,
                  minimumYear: DateTime.now().year,
                  minimumDate: DateTime.now(),
                  maximumYear: DateTime.now().year + 1,
                  maximumDate: DateTime(now.year, now.month, now.day + 30),
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                date.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// cupertino time picker 12 hr
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Cupertino Time Picker 12 hr',
              onTap: () {
                SkywaCupertinoDateTimePicker.time(
                  context: context,
                  onDateTimeChanged: (DateTime _time) {
                    setState(() {
                      time12Hr = _time;
                    });
                  },
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                time12Hr.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// cupertino time picker 24 hr
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Cupertino Time Picker 24 hr',
              onTap: () {
                SkywaCupertinoDateTimePicker.time(
                  context: context,
                  onDateTimeChanged: (DateTime _time) {
                    setState(() {
                      time24Hr = _time;
                    });
                  },
                  use24hFormat: true,
                );
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                time24Hr.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),

            /// material date picker
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Material Date Picker',
              onTap: () async {
                materialDate =
                    await SkywaMaterialDateTimePicker.showSkywaDatePicker(
                  context: context,
                  initialDateTime: date,
                  minimumDate: DateTime.now(),
                      // maximumDate: DateTime(now.year, now.month, now.day + 30),
                );
                setState(() {
                  dateTime;
                });
                print(dateTime);
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                materialDate.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// material time picker 12 hr
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Material Time Picker 12 hr',
              onTap: () async {
                materialTime24Hr =
                    await SkywaMaterialDateTimePicker.showSkywaTimePicker(
                  context: context,
                  initialDateTime: time,
                  // minimumDate: DateTime.now(),
                  // maximumDate: DateTime(now.year, now.month, now.day + 30),
                );
                setState(() {
                  materialTime24Hr;
                  materialTime24HrString = DateFormat.jm().format(
                    DateTime(
                      now.year,
                      now.month,
                      now.day,
                      materialTime24Hr!.hour,
                      materialTime24Hr!.minute,
                    ),
                  );
                });
                print(materialTime24HrString);
              },
            ),
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                materialTime24HrString.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
