import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_alert_dialog.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';

class SampleAlertDialogScreen extends StatelessWidget {
  const SampleAlertDialogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Alert Dialogs'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),

          /// success alert dialog
          SkywaElevatedButton.save(
            context: context,
            text: 'Save Alert Dialog',
            onTap: () {
              SkywaAlertDialog.success(
                context: context,
                titleText: 'Success Alert Success Alert Success Alert Success Alert',
                content: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: const SkywaText(
                    'This is a success alert dialog',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// info alert dialog
          SkywaElevatedButton.info(
            context: context,
            text: 'Info Alert Dialog',
            onTap: () {
              SkywaAlertDialog.info(
                context: context,
                titleText: 'Info Alert',
                content: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: const SkywaText(
                    'This is a info alert dialog',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// error alert dialog
          SkywaElevatedButton.delete(
            context: context,
            text: 'Error Alert Dialog',
            onTap: () {
              SkywaAlertDialog.error(
                context: context,
                titleText: 'Error Alert',
                content: Container(
                  padding:
                      EdgeInsets.all(MediaQuery.of(context).size.height * 0.02),
                  child: const SkywaText(
                    'This is a error alert dialog',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
