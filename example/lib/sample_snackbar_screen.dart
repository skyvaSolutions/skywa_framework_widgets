import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SampleSnackBarScreen extends StatelessWidget {
  const SampleSnackBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample SnackBars'),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          SizedBox(height: 20.0),

          /// success snackbar
          SkywaElevatedButton.save(
            context: context,
            onTap: () {
              SkywaSnackBar.success(
                  context: context,
                  snackBarText: 'This is a success snackbar',
                  actionText: 'Undo',
                  action: () {
                    Fluttertoast.showToast(msg: 'Undo Pressed');
                  });
            },
            text: 'Success SnackBar',
          ),
          SizedBox(height: 20.0),

          /// info snackbar
          SkywaElevatedButton.info(
            context: context,
            onTap: () {
              SkywaSnackBar.info(
                  context: context,
                  snackBarText: 'This is an info snackbar',
                  actionText: 'Undo',
                  action: () {
                    Fluttertoast.showToast(msg: 'Undo Pressed');
                  });
            },
            text: 'Info SnackBar',
          ),
          SizedBox(height: 20.0),

          /// error snackbar
          SkywaElevatedButton.delete(
            context: context,
            onTap: () {
              SkywaSnackBar.error(
                context: context,
                snackBarText: 'This is an error snackbar',
                durationInSeconds: 5,
              );
            },
            text: 'Error SnackBar',
          ),
          SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
