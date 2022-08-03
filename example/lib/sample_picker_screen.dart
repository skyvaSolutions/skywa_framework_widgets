import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_date_time_picker.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';

class SamplePickerScreen extends StatefulWidget {
  const SamplePickerScreen({Key? key}) : super(key: key);

  @override
  State<SamplePickerScreen> createState() => _SamplePickerScreenState();
}

class _SamplePickerScreenState extends State<SamplePickerScreen> {
  DateTime? dateTime;
  DateTime? date;
  DateTime? time12Hr;
  DateTime? time24Hr;
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Pickers'),
      ),
      body: Container(
        height: Device.screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.0),

            /// datetime picker
            SkywaElevatedButton.save(
              context: context,
              text: 'Show DateTime Picker',
              onTap: () {
                SkywaDateTimePicker.dateAndTime(
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
              margin: EdgeInsets.all(10.0),
              child: Text(
                dateTime.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// date picker
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Date Picker',
              onTap: () {
                SkywaDateTimePicker.date(
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
              margin: EdgeInsets.all(10.0),
              child: Text(
                date.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// time picker 12 hr
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Time Picker 12 hr',
              onTap: () {
                SkywaDateTimePicker.time(
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
              margin: EdgeInsets.all(10.0),
              child: Text(
                time12Hr.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),

            /// time picker 24 hr
            SkywaElevatedButton.save(
              context: context,
              text: 'Show Time Picker 24 hr',
              onTap: () {
                SkywaDateTimePicker.time(
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
              margin: EdgeInsets.all(10.0),
              child: Text(
                time24Hr.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
