import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets_example/all_widgets_screen.dart';
import 'package:get_it/get_it.dart';

void main() {
  final GetIt sl = GetIt.instance;
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  /*String _platformVersion = 'Unknown';
  final _skywaFrameworkWidgetsPlugin = SkywaFrameworkWidgets();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion =
          await _skywaFrameworkWidgetsPlugin.getPlatformVersion() ?? 'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n'),
        ),
      ),
    );
  }*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Skywa Framework Widgets',
      debugShowCheckedModeBanner: false,
      /*theme: ThemeData.light().copyWith(
        primaryColor: const Color(0xFF54BAB9),
        splashColor: const Color(0xFF54BAB9).withOpacity(0.4),
        errorColor: Color(0xFFEB1D36),
      ),*/
      home: const AllWidgetsScreen(),
    );
  }
}
