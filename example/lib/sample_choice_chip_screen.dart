import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_choice_chip_group.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleChoiceChipScreen extends StatefulWidget {
  const SampleChoiceChipScreen({Key? key}) : super(key: key);

  @override
  State<SampleChoiceChipScreen> createState() => _SampleChoiceChipScreenState();
}

class _SampleChoiceChipScreenState extends State<SampleChoiceChipScreen> {
  List<String> genderChips = ['Male', 'Female', 'Others'];
  List<String> nationalityChips = ['Indian', 'American'];
  String selectedGender = '';
  String selectedNationality = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Choice Chips'),
      ),
      body: Container(
        height: Device.screenHeight,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20.0),
            SkywaChoiceChipGroup(
              selectedValue: selectedGender,
              choiceChips: genderChips,
              onSelected: (value) {
                setState(() {
                  selectedGender = value.toString();
                });
                print('value: $value');
              },
              wrapAlignment: WrapAlignment.spaceAround,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SkywaText(text: selectedGender),
            ),
            const SizedBox(height: 20.0),
            SkywaChoiceChipGroup(
              selectedValue: selectedNationality,
              choiceChips: nationalityChips,
              onSelected: (value) {
                setState(() {
                  selectedNationality = value.toString();
                });
                print('value: $value');
              },
              wrapAlignment: WrapAlignment.spaceAround,
              padding: const EdgeInsets.all(0.0),
            ),
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: SkywaText(text: selectedNationality),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
