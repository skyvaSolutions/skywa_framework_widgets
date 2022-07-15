import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_switch.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleSwitchScreen extends StatefulWidget {
  const SampleSwitchScreen({Key? key}) : super(key: key);

  @override
  _SampleSwitchScreenState createState() => _SampleSwitchScreenState();
}

class _SampleSwitchScreenState extends State<SampleSwitchScreen> {
  bool switch1Value = false;
  bool switch2Value = false;

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
          children: [
            SizedBox(height: 20.0),
            SkywaSwitch(
              value: switch1Value,
              onChanged: (value) {
                setState(() {
                  switch1Value = value;
                });
              },
              title: 'Sample Switch 1',
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SkywaText(text: switch1Value.toString()),
            ),
            SizedBox(height: 30.0),
            SkywaSwitch(
              value: switch2Value,
              onChanged: (value) {
                setState(() {
                  switch2Value = value;
                });
              },
              title: 'Sample Switch 2',
            ),
            SizedBox(height: 10.0),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: SkywaText(text: switch2Value.toString()),
            ),
          ],
        ),
      ),
    );
  }
}
