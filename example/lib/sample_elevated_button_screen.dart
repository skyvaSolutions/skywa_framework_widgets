import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';

class SampleElevatedButtonScreen extends StatelessWidget {
  const SampleElevatedButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Elevated Buttons'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(height: 20.0),

            /// save
            SkywaElevatedButton.save(
              context: context,
              text: 'Save',
              onTap: () {
                /*SkywaSnackBar.success(
                  context: context,
                  snackbarText: 'Save Button Tapped',
                );*/
              },
              // fontSize: Device.screenHeight * 0.025,
            ),
            SizedBox(height: 20.0),

            /// info
            SkywaElevatedButton.info(
              context: context,
              text: 'View',
              onTap: () {
                /*SkywaSnackBar.info(
                  context: context,
                  snackbarText: 'View Button Tapped',
                );*/
              },
              // fontSize: Device.screenHeight * 0.025,
            ),
            SizedBox(height: 20.0),

            /// delete
            SkywaElevatedButton.delete(
              context: context,
              text: 'Delete/Cancel',
              onTap: () {
                /*SkywaSnackBar.error(
                  context: context,
                  snackbarText: 'Delete/Cancel Button Tapped',
                );*/
              },
              // fontSize: Device.screenHeight * 0.025,
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
