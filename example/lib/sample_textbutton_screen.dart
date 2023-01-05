import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_text_button.dart';

class SampleTextButtonScreen extends StatefulWidget {
  const SampleTextButtonScreen({Key? key}) : super(key: key);

  @override
  _SampleTextButtonScreenState createState() => _SampleTextButtonScreenState();
}

class _SampleTextButtonScreenState extends State<SampleTextButtonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Text Buttons'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20.0),
            SkywaTextButton(
              text: 'Change',
              onTap: () {
                print('pressed');
              },
              buttonColor: Colors.grey.shade100,
            ),
          ],
        ),
      ),
    );
  }
}
