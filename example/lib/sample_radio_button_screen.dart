import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_radio_group.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleRadioButtonScreen extends StatefulWidget {
  const SampleRadioButtonScreen({Key? key}) : super(key: key);

  @override
  State<SampleRadioButtonScreen> createState() =>
      _SampleRadioButtonScreenState();
}

class _SampleRadioButtonScreenState extends State<SampleRadioButtonScreen> {
  String selectedGender = 'Nothing';
  String selectedEyeColor = 'Nothing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Radio Buttons'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.0),
            SkywaRadioGroup(
              texts: ['Male', 'Female', 'Others'],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: SkywaText(
                text: selectedGender,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
            SkywaRadioGroup(
              texts: ['Black', 'Brown', 'Hazel', 'Blue'],
              onChanged: (value) {
                setState(() {
                  selectedEyeColor = value;
                });
              },
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              child: SkywaText(
                text: selectedEyeColor,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
