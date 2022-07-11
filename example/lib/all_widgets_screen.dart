import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';

import 'sample_texts_screen.dart';

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

          /// sample alert dialogs

          /// sample loader

          /// sample glassmorphic loader

          /// Scaffold's Children

          ///sample floating action buttons

          /// sample bottom sheets

          /// input Fields & texts

          /// sample textformfields

          /// sample texts
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleTextsScreen();
                }),
              );
            },
            child: const SkywaText(text: 'Sample Texts'),
          ),
          const SizedBox(height: 20.0),

          /// sample rich texts

          /// sample buttons

          /// sample elevated buttons

          /// sample text buttons

          /// sample outlined buttons

          /// single & multiple selections

          /// sample radio buttons
        ],
      ),
    );
  }
}
