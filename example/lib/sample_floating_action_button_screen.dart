import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_floating_action_button.dart';
import 'package:skywa_framework_widgets/skywa_snackbar.dart';

class SampleFloatingActionButtonScreen extends StatelessWidget {
  const SampleFloatingActionButtonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Floating Action Buttons'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
      ),
      floatingActionButton: SkywaFloatingActionButton(
        onTap: () => SkywaSnackBar.info(
          context: context,
          snackBarText: 'FAB tapped',
        ),
        iconData: Icons.add_rounded,
        text: 'Add Page',
      ),
    );
  }
}
