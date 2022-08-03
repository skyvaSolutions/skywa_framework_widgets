import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_slider.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleSliderScreen extends StatefulWidget {
  const SampleSliderScreen({Key? key}) : super(key: key);

  @override
  State<SampleSliderScreen> createState() => _SampleSliderScreenState();
}

class _SampleSliderScreenState extends State<SampleSliderScreen> {
  double slider1Value = 3.0;
  double slider2Value = 3.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Sliders'),
      ),
      body: Container(
        height: Device.screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20.0),
            SkywaSlider(
              value: slider1Value,
              onChanged: (value) {
                setState(() {
                  slider1Value = double.parse(value.toStringAsFixed(2));
                });
              },
              minValue: 1.0,
              maxValue: 5.0,
              allowDivisions: true,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SkywaText(text: slider1Value.toString()),
            ),
            const SizedBox(height: 20.0),
            SkywaSlider(
              value: slider2Value,
              onChanged: (value) {
                setState(() {
                  slider2Value = double.parse(value.toStringAsFixed(2));
                });
              },
              minValue: 1.0,
              maxValue: 10.0,
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SkywaText(text: slider2Value.toString()),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
