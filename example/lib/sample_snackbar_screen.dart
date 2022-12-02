import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_auto_size_text.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';

class SampleSnackBarScreen extends StatelessWidget {
  const SampleSnackBarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(
          appbarText: 'Sample SnackBars',
          actions: [
            IconButton(
              padding: const EdgeInsets.only(right: 5.0),
              icon: const SkywaAutoSizeText(
                text: 'Save',
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          const SizedBox(height: 20.0),

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
          const SizedBox(height: 20.0),

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
          const SizedBox(height: 20.0),

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
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
