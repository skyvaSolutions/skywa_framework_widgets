import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_floating_action_button.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';

class SampleFloatingActionButtonScreen extends StatelessWidget {
  const SampleFloatingActionButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Floating Action Buttons'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
      ),
      floatingActionButton: SkywaFloatingActionButton(
        onTap: () {
          SkywaSnackBar.info(context: context, snackBarText: 'FAB tapped');
        },
        iconData: Icons.add_rounded,
      ),
    );
  }
}
