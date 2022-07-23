import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets_example/sample_rich_texts_screen.dart';

import 'sample_alert_dialog_screen.dart';
import 'sample_choice_chip_screen.dart';
import 'sample_dropdown_screen.dart';
import 'sample_elevated_button_screen.dart';
import 'sample_floating_action_button_screen.dart';
import 'sample_glassmorphic_loader_screen.dart';
import 'sample_loader_screen.dart';
import 'sample_outlined_button_screen.dart';
import 'sample_radio_button_screen.dart';
import 'sample_snackbar_screen.dart';
import 'sample_switch_screen.dart';
import 'sample_textbutton_screen.dart';
import 'sample_texts_screen.dart';
import 'package:skywa_framework_widgets/skywa_bottom_sheet.dart';

class AllWidgetsScreen extends StatefulWidget {
  const AllWidgetsScreen({Key? key}) : super(key: key);

  @override
  _AllWidgetsScreenState createState() => _AllWidgetsScreenState();
}

class _AllWidgetsScreenState extends State<AllWidgetsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Skywa Framework Widgets'),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        children: [
          /// sample snackbars
          SkywaElevatedButton.save(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SampleSnackBarScreen();
                }),
              );
            },
            text: 'Sample SnackBars',
          ),
          const SizedBox(height: 20.0),

          /// sample alert dialogs
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Alert Dialogs',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return SampleAlertDialogScreen();
                }),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample loader
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Loader',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleLoaderScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample glassmorphic loader
          SkywaElevatedButton.save(
            context: context,
            text: 'TODO: Sample Glassmorphic Loader',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleGlassmorphicLoaderScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          SizedBox(height: 20.0),

          /// Scaffold's Children
          SkywaText(
            text: 'Scaffold\'s Children',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          SizedBox(height: 20.0),

          /// sample floating action buttons
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Floating Action Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return SampleFloatingActionButtonScreen();
                }),
              );
            },
            // fontSize: Device.screenHeight * 0.025,
          ),
          SizedBox(height: 20.0),

          /// sample bottom sheets
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Bottom Sheets',
            onTap: () {
              SkywaBottomSheet(
                context: context,
                isDismissible: false,
                content: ListView(
                  shrinkWrap: true,
                  children: [
                    Center(
                      child: SkywaText(
                        text: 'Sample Bottom Sheet',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 10.0),
                    SkywaElevatedButton.delete(
                        context: context,
                        text: 'Dismiss',
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    SizedBox(height: 10.0),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 20.0),
          Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          SizedBox(height: 20.0),

          /// input Fields & texts
          SkywaText(
            text: 'Input Fields & Texts',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          SizedBox(height: 20.0),

          /// sample textformfields

          /// sample texts
          SkywaElevatedButton.delete(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleTextsScreen();
                }),
              );
            },
            text: 'Sample Texts',
          ),
          const SizedBox(height: 20.0),

          /// sample rich texts
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Rich Texts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SampleRichTextsScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          SizedBox(height: 20.0),
          Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          SizedBox(height: 20.0),

          /// sample buttons
          SkywaText(
            text: 'Buttons',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample elevated buttons
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Elevated Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return SampleElevatedButtonScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample text buttons
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Text Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleTextButtonScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample outlined buttons
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Outlined Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleOutlinedButtonScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          SizedBox(height: 20.0),

          /// single & multiple selections
          SkywaText(
            text: 'Single & Multiple Selections',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          SizedBox(height: 20.0),

          /// sample radio buttons
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Radio Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return SampleRadioButtonScreen();
                }),
              );
            },
            // fontSize: Device.screenHeight * 0.025,
          ),
          SizedBox(height: 20.0),

          /// sample choice chips
          SkywaElevatedButton.info(
            context: context,
            text: 'TODO: Sample Choice Chips',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleChoiceChipScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample dropdowns
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Dropdowns',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return SampleDropdownScreen();
                  },
                ),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample checkboxes

          /// sample switches
          SkywaElevatedButton.delete(
            context: context,
            text: 'Sample Switches',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return SampleSwitchScreen();
                }),
              );
            },
          ),
          SizedBox(height: 20.0),

          /// sample sliders

          /// images & image pickers

          /// sample image pickers

          /// sample cached network images

          /// pickers

          /// sample pickers

          /// listwheelscrollviews
        ],
      ),
    );
  }
}
