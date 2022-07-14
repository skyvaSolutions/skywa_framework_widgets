import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';

import 'sample_elevated_button_screen.dart';
import 'sample_snackbar_screen.dart';
import 'sample_texts_screen.dart';
import 'skywa_appt_list_screen.dart';

class AllWidgetsScreen extends StatefulWidget {
  const AllWidgetsScreen({Key? key}) : super(key: key);

  @override
  _AllWidgetsScreenState createState() => _AllWidgetsScreenState();
}

class _AllWidgetsScreenState extends State<AllWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Skywa Framework Widgets'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          // const SizedBox(height: 20.0),

          /// sample snackbars
          SkywaElevatedButton.save(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SampleSnackBarScreen();
                }),
              );
            },
            text: 'Sample SnackBars',
          ),
          const SizedBox(height: 20.0),

          /// sample alert dialogs

          /// sample loader

          /// sample glassmorphic loader

          /// Scaffold's Children

          ///sample floating action buttons

          /// sample bottom sheets

          /// input Fields & texts

          /// sample textformfields

          /// sample texts
          SkywaElevatedButton.delete(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleTextsScreen();
                }),
              );
            },
            text: 'Sample Texts',
          ),
          const SizedBox(height: 20.0),

          /// sample rich texts

          /// sample buttons
          SkywaText(
            text: 'Buttons',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample elevated buttons
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Elevated Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SampleElevatedButtonScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample text buttons

          /// sample outlined buttons

          /// single & multiple selections

          /// sample radio buttons

          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Appointment List',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SampleAppointmentListScreen();
                }),
              );
            },
          ),
        ],
      ),
    );
  }
}
