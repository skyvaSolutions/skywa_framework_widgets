import 'package:flutter/material.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_text.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets_example/sample_rich_texts_screen.dart';

import 'sample_alert_dialog_screen.dart';
import 'sample_cached_image_network_screen.dart';
import 'sample_checkbox_screen.dart';
import 'sample_choice_chip_screen.dart';
import 'sample_dropdown_screen.dart';
import 'sample_elevated_button_screen.dart';
import 'sample_filter_screen.dart';
import 'sample_floating_action_button_screen.dart';
import 'sample_glassmorphic_loader_screen.dart';
import 'sample_image_picker_screen.dart';
import 'sample_list_wheel_scrollview_screen.dart';
import 'sample_loader_screen.dart';
import 'sample_outlined_button_screen.dart';
import 'sample_picker_screen.dart';
import 'sample_radio_button_screen.dart';
import 'sample_slider_screen.dart';
import 'sample_snackbar_screen.dart';
import 'sample_switch_screen.dart';
import 'sample_textbutton_screen.dart';
import 'sample_textformfield_screen.dart';
import 'sample_texts_screen.dart';
import 'package:skywa_framework_widgets/skywa_bottom_sheet.dart';

import 'sample_dropdown_search_screen.dart';

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
                  return const SampleSnackBarScreen();
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
                  return const SampleAlertDialogScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample loader
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Loader',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleLoaderScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample glassmorphic loader
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Glassmorphic Loader',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleGlassmorphicLoaderScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample filter
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Filter',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleFilterScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// Scaffold's Children
          const SkywaText(
            text: 'Scaffold\'s Children',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample floating action buttons
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Floating Action Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return const SampleFloatingActionButtonScreen();
                }),
              );
            },
            // fontSize: Device.screenHeight * 0.025,
          ),
          const SizedBox(height: 20.0),

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
                    const Center(
                      child: SkywaText(
                        text: 'Sample Bottom Sheet',
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 10.0),
                    SkywaElevatedButton.delete(
                        context: context,
                        text: 'Dismiss',
                        onTap: () {
                          Navigator.pop(context);
                        }),
                    const SizedBox(height: 10.0),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// input Fields & texts
          const SkywaText(
            text: 'Input Fields & Texts',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample textformfields
          SkywaElevatedButton.delete(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleTextFormFieldScreen();
                }),
              );
            },
            text: 'Sample TextFormFields',
            // fontSize: Device.screenHeight * 0.025,
          ),
          const SizedBox(height: 20.0),

          /// sample dropdpwn search
          /*SkywaElevatedButton.delete(
            context: context,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleDropdownSearchScreen();
                }),
              );
            },
            text: 'Sample Dropdown Search',
          ),
          const SizedBox(height: 20.0),*/

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
          SkywaElevatedButton.delete(
            context: context,
            text: 'Sample Rich Texts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) {
                  return const SampleRichTextsScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// sample buttons
          const SkywaText(
            text: 'Buttons',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEA4335),
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
                  return const SampleElevatedButtonScreen();
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
                    return const SampleTextButtonScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample outlined buttons
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Outlined Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleOutlinedButtonScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// single & multiple selections
          const SkywaText(
            text: 'Single & Multiple Selections',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample radio buttons
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Radio Buttons',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (builder) {
                  return const SampleRadioButtonScreen();
                }),
              );
            },
            // fontSize: Device.screenHeight * 0.025,
          ),
          const SizedBox(height: 20.0),

          /// sample choice chips
          SkywaElevatedButton.info(
            context: context,
            text: 'TODO: Sample Choice Chips',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleChoiceChipScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample dropdowns
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Dropdowns',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleDropdownScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample checkboxes
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample CheckBoxes',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleCheckBoxScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// sample switches
          SkywaElevatedButton.delete(
            context: context,
            text: 'Sample Switches',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleSwitchScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample sliders
          SkywaElevatedButton.delete(
            context: context,
            text: 'Sample Sliders',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleSliderScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// images & image pickers
          const SkywaText(
            text: 'Images & Image Pickers',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample image pickers
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Image Pickers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleImagePickerScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// sample cached network images
          SkywaElevatedButton.save(
            context: context,
            text: 'Sample Cached Network Images',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const SampleCachedImageNetworkScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 20.0),
          const Divider(height: 10.0, color: Colors.black87, thickness: 1.0),
          const SizedBox(height: 20.0),

          /// pickers
          const SkywaText(
            text: 'Pickers',
            fontSize: 25.0,
            textAlign: TextAlign.center,
            fontWeight: FontWeight.bold,
            color: const Color(0xFFEA4335),
          ),
          const SizedBox(height: 20.0),

          /// sample pickers
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample Pickers',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SamplePickerScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),

          /// listwheelscrollviews
          SkywaElevatedButton.info(
            context: context,
            text: 'Sample ListWheelScrollViews',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return const SampleListWheelScrollViewScreen();
                }),
              );
            },
          ),
          const SizedBox(height: 20.0),
        ],
      ),
    );
  }
}
