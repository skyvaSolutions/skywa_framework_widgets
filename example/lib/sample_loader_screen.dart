import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_loader.dart';

class SampleLoaderScreen extends StatelessWidget {
  const SampleLoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Loader'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: SkywaLoader(),
      ),
    );
  }
}
