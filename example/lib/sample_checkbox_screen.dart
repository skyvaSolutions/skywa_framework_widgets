import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/models/skywa_checkbox_model.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_checkbox_list_tile.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleCheckBoxScreen extends StatefulWidget {
  const SampleCheckBoxScreen({Key? key}) : super(key: key);

  @override
  _SampleCheckBoxScreenState createState() => _SampleCheckBoxScreenState();
}

class _SampleCheckBoxScreenState extends State<SampleCheckBoxScreen> {
  List<SkywaCheckBoxModel>? checkboxes;
  List<Map<String, bool>> days = [
    {'Sun': false},
    {'Mon': false},
    {'Tue': false},
    {'Wed': false},
    {'Thu': false},
    {'Fri': false},
    {'Sat': false},
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkboxes = [
      SkywaCheckBoxModel(
        title: 'Flutter',
        subtitle: 'Android & iOS App Development',
        isSelected: true,
      ),
      SkywaCheckBoxModel(
        title: 'React Native',
        subtitle: '',
        isSelected: false,
      ),
      SkywaCheckBoxModel(
        title: 'MERN',
        subtitle: '',
        isSelected: false,
      ),
      SkywaCheckBoxModel(
        title: 'Angular JS',
        subtitle: '',
        isSelected: true,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    print(checkboxes);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample CheckBoxes'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(20.0),
          children: [
            const SkywaText(
              text: 'Select your favourite frameworks',
              textAlign: TextAlign.center,
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
            ),
            for (int i = 0; i < checkboxes!.length; i++)
              SkywaCheckboxListTile(
                title: checkboxes![i].title,
                subTitle: checkboxes![i].subtitle,
                isSelected: checkboxes![i].isSelected,
                onChanged: (bool? _selected) {
                  setState(() {
                    checkboxes![i].isSelected = _selected!;
                  });
                  print(_selected);
                },
              ),

            const SizedBox(height: 20.0),

            /// select working days
            const SkywaText(
                text: 'Select Working Days', textAlign: TextAlign.center),
            const SizedBox(height: 10.0),
            Container(
              width: Device.screenWidth,
              height: 100.0,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade600, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: Device.screenWidth / 6,
                    child: SkywaCheckboxListTile(
                      direction: Axis.vertical,
                      title: days[index].keys.elementAt(0),
                      isSelected: days[index].values.elementAt(0),
                      onChanged: (bool? _selected) {
                        setState(() {
                          days[index].update(
                            days[index].keys.elementAt(0),
                            (value) => _selected!,
                          );
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
