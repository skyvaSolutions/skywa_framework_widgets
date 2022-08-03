import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_cached_network_image.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_list_wheel_scrollview.dart';

class SampleListWheelScrollViewScreen extends StatefulWidget {
  const SampleListWheelScrollViewScreen({Key? key}) : super(key: key);

  @override
  _SampleListWheelScrollViewScreenState createState() =>
      _SampleListWheelScrollViewScreenState();
}

class _SampleListWheelScrollViewScreenState extends State<SampleListWheelScrollViewScreen> {
  List<SkywaText> genders = [
    const SkywaText(text: 'Male', fontSize: 30.0),
    const SkywaText(text: 'Female', fontSize: 30.0),
    const SkywaText(text: 'Others', fontSize: 30.0),
  ];
  String selectedGender = '';

  List<SkywaText> timeUnits = [
    const SkywaText(text: 'hr', fontSize: 30.0),
    const SkywaText(text: 'min', fontSize: 30.0),
  ];
  String selectedTimeUnit = '';

  List<Row> nationalities = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkywaCachedNetworkImage.clipRRect(
              imageUrl:
                  'https://image.similarpng.com/very-thumbnail/2021/01/India-flag-in-heart-shape-on-transparent-background-PNG.png',
              width: 50.0,
              height: 50.0,
              padding: const EdgeInsets.all(0.0),
            ),
          ],
        ),
        SizedBox(width: 10.0),
        SkywaText(text: 'Indian', fontSize: 35.0),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkywaCachedNetworkImage.clipRRect(
              imageUrl:
                  'https://www.dlf.pt/dfpng/middlepng/14-142589_american-flag-clip-art-transparent-background-hd-png.png',
              width: 50.0,
              height: 50.0,
              padding: const EdgeInsets.all(0.0),
            ),
          ],
        ),
        const SizedBox(width: 10.0),
        const SkywaText(text: 'American', fontSize: 35.0),
      ],
    ),
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkywaCachedNetworkImage.clipRRect(
              imageUrl:
                  'https://pixlok.com/wp-content/uploads/2021/06/Japan-Flag-PNG-1.jpg',
              width: 50.0,
              height: 50.0,
              padding: const EdgeInsets.all(0.0),
            ),
          ],
        ),
        const SizedBox(width: 10.0),
        const SkywaText(text: 'Japanese', fontSize: 35.0),
      ],
    ),
  ];
  Row selectedNationality = Row();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample ListWheelScrollViews'),
      ),
      body: SingleChildScrollView(
        child: Container(
          // height: Device.screenHeight,
          width: Device.screenWidth,
          child: Column(
            children: [
              /// gender
              Column(
                children: [
                  Container(
                    height: Device.screenHeight * 0.45,
                    color: Colors.amber.shade200,
                    child: SkywaListWheelScrollView(
                      bodies: genders,
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.all(0.0),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedGender = genders[index].text;
                        });
                        print(genders[index].text);
                      },
                    ),
                  ),
                  SkywaText(text: selectedGender),
                ],
              ),
              SizedBox(height: 20.0),

              /// time unit
              Column(
                children: [
                  Container(
                    height: Device.screenHeight * 0.30,
                    color: Colors.purple.shade200,
                    child: SkywaListWheelScrollView(
                      bodies: timeUnits,
                      diameterRatio: 0.2,
                      squeeze: 0.5,
                      // perspective: 0.01,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedTimeUnit = timeUnits[index].text;
                        });
                        print(timeUnits[index].text);
                      },
                    ),
                  ),
                  SkywaText(text: selectedTimeUnit),
                ],
              ),
              SizedBox(height: 20.0),

              /// nationality
              Column(
                children: [
                  Container(
                    height: Device.screenHeight * 0.30,
                    color: Colors.teal.shade200,
                    child: SkywaListWheelScrollView(
                      itemExtent: 200.0,
                      width: 250.0,
                      bodies: nationalities,
                      diameterRatio: 0.1,
                      squeeze: 0.5,
                      decoration: BoxDecoration(
                        color: Colors.redAccent.shade200,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          selectedNationality = Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: nationalities[index].children,
                          );
                        });
                        print(nationalities[index].children);
                      },
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: selectedNationality.children,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
