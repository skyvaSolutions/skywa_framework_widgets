import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_rich_text.dart';
import 'package:url_launcher/url_launcher.dart';

class SampleRichTextsScreen extends StatefulWidget {
  const SampleRichTextsScreen({Key? key}) : super(key: key);

  @override
  _SampleRichTextsScreenState createState() => _SampleRichTextsScreenState();
}

class _SampleRichTextsScreenState extends State<SampleRichTextsScreen> {
  Future<void> _launchURL({required String url}) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Rich Texts'),
      ),
      body: Container(
        height: Device.screenHeight,
        width: Device.screenWidth,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(8.0),
          children: [
            SizedBox(height: 20.0),
            SkywaRichText(
              texts: [
                'Tap on the link  ',
                'Google\n',
                'Instagram\n',
                'LinkedIn',
                ' *',
              ],
              textStyles: [
                TextStyle(color: Colors.redAccent, fontSize: 18.0),
                TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
                TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 19.0,
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
                TextStyle(
                  color: Colors.teal,
                  fontSize: 22.0,
                  letterSpacing: 1.1,
                  fontWeight: FontWeight.w500,
                  decoration: TextDecoration.underline,
                ),
                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ],
              onTaps: [
                () {
                  _launchURL(url: 'https://www.google.com/');
                },
                () {
                  _launchURL(url: 'https://www.instagram.com/');
                },
                () {
                  _launchURL(url: 'https://www.linkedin.com/feed/');
                },
                () {},
              ],
            ),
          ],
        ),
      ),
    );
  }
}
