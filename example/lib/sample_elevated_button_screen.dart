import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';

class SampleElevatedButtonScreen extends StatelessWidget {
  const SampleElevatedButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Elevated Buttons'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(
          shrinkWrap: true,
          children: [
            const SizedBox(height: 20.0),

            SkywaElevatedButton(
              context: context,
              text: 'Custom Elevated Button',
              onTap: () {
                SkywaSnackBar.success(
                  context: context,
                  snackBarText: 'Custom Elevated Button tapped',
                );
              },
              buttonColor: Colors.grey.withOpacity(0.2),
            ),
            const SizedBox(height: 20.0),

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
              // fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
            const SizedBox(height: 20.0),

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
              // fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
            const SizedBox(height: 20.0),

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
              // fontSize: MediaQuery.of(context).size.height * 0.025,
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
