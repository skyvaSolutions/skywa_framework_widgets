import 'package:skywa_framework_widgets/skywa_outlined_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';

class SampleOutlinedButtonScreen extends StatefulWidget {
  const SampleOutlinedButtonScreen({Key? key}) : super(key: key);

  @override
  _SampleOutlinedButtonScreenState createState() =>
      _SampleOutlinedButtonScreenState();
}

class _SampleOutlinedButtonScreenState
    extends State<SampleOutlinedButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Outlined Buttons'),
      ),
      body: Container(
        height: Device.screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.0),
            SkywaOutlinedButton(
              text: 'Save',
              onTap: () {
                print('Save');
              },
            ),
          ],
        ),
      ),
    );
  }
}
