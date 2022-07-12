import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleTextsScreen extends StatelessWidget {
  const SampleTextsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        // child: SkywaAppBar(appbarText: 'Sample Texts'),
        child: SkywaAppBar(appbarText: 'Sample Texts'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: Device.screenWidth * 0.02),
          children: [
            const SizedBox(height: 20.0),

            /// color: redAccent
            const SkywaText(
              text: 'This is a sample text with color redAccent',
              color: Colors.redAccent,
            ),
            Divider(thickness: 2.0, height: 20.0),

            /// fontSize: 4% of height
            SkywaText(
              text: 'This is a sample text with fontSize 4% of screen height',
              fontSize: Device.screenHeight * 0.04,
              maxLines: 4,
            ),
            const Divider(thickness: 2.0, height: 20.0),

            /// fontWeight: w900
            const SkywaText(
              text: 'This is a sample text with fontWeight w900',
              fontWeight: FontWeight.w900,
            ),
            Divider(thickness: 2.0, height: 20.0),

            /// textAlign: end
            const SkywaText(
              text: 'This is a sample text with textAlign end',
              textAlign: TextAlign.end,
            ),
            const Divider(thickness: 2.0, height: 20.0),

            /// textOverflow: fade
            const SkywaText(
              text:
                  'This is a sample text with textOverflow fade, maximum no of lines is null by default',
              textOverflow: TextOverflow.fade,
            ),
            Divider(thickness: 2.0, height: 20.0),

            /// maxLines: 4
            const SkywaText(
              text:
                  'This is a sample text with maxLines 4, This is a sample text with maxLines 4, This is a sample text with maxLines 4, This is a sample text with maxLines 4, This is a sample text with maxLines 4, ',
              maxLines: 4,
            ),
            Divider(thickness: 2.0, height: 20.0),

            /// letterSpacing: 2.0
            const SkywaText(
              text: 'This is a sample text with letterSpacing 2.0',
              letterSpacing: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
