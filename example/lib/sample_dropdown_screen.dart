import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_dropdown_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleDropdownScreen extends StatefulWidget {
  const SampleDropdownScreen({Key? key}) : super(key: key);

  @override
  _SampleDropdownScreenState createState() => _SampleDropdownScreenState();
}

class _SampleDropdownScreenState extends State<SampleDropdownScreen> {
  String selectedGender = '';
  String selectedNationality = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Pickers'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          children: [
            SizedBox(height: 20.0),
            SkywaDropdownButton(
              items: ['Choose your gender...', 'Male', 'Female', 'Others'],
              onChanged: (value) {
                setState(() {
                  selectedGender = value;
                });
              },
              selectedValue: selectedGender,
            ),
            SizedBox(height: 10.0),
            SkywaText(selectedGender),
            SizedBox(height: 20.0),
            SkywaDropdownButton(
              items: ['Choose your nationality...', 'Indian', 'American'],
              onChanged: (value) {
                setState(() {
                  selectedNationality = value;
                });
              },
              selectedValue: selectedNationality,
            ),
            SizedBox(height: 10.0),
            SkywaText(selectedNationality),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
