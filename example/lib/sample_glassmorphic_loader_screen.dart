import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';

class SampleGlassmorphicLoaderScreen extends StatefulWidget {
  const SampleGlassmorphicLoaderScreen({Key? key}) : super(key: key);

  @override
  _SampleGlassmorphicLoaderScreenState createState() =>
      _SampleGlassmorphicLoaderScreenState();
}

class _SampleGlassmorphicLoaderScreenState
    extends State<SampleGlassmorphicLoaderScreen> {
  TextEditingController _nameController = TextEditingController();
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Glassmorphic Loader'),
      ),
      /*body: Stack(
        children: [
          Container(
            height: Device.screenHeight,
            width: Device.screenWidth,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(20.0),
              children: [
                SkywaTextFormField.name(
                  textEditingController: _nameController,
                  labelText: 'Name',
                  hintText: 'Enter your name...',
                ),
                SizedBox(height: 20.0),
                SkywaElevatedButton.delete(
                  context: context,
                  text: 'Delete',
                  onTap: () {
                    SkywaSnackBar.success(
                      context: context,
                      snackbarText: 'Deleted successfully',
                    );
                  },
                ),
                SizedBox(height: 20.0),
                SkywaDropdownButton(
                  items: ['Male', 'Female'],
                  onChanged: (value) {},
                  selectedValue: 'Male',
                ),
                SizedBox(height: 20.0),
                SkywaSwitch(
                  value: true,
                  onChanged: (value) {},
                  title: 'Light Theme',
                ),
                SizedBox(height: 20.0),
                SkywaRadioGroup(
                  texts: ['Male', 'Female'],
                  onChanged: (valuee) {},
                ),
                SizedBox(height: 20.0),
                SkywaSlider(value: 4, onChanged: (value) {}, maxValue: 5),
                SizedBox(height: 20.0),
                SkywaTextButton(
                  text: 'Exit',
                  textColor: Colors.redAccent,
                  fontWeight: FontWeight.w700,
                  onTap: () {},
                ),
                SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(color: Colors.black87),
                  ),
                  child: SkywaCachedNetworkImage.clipRRect(
                    imageUrl:
                        'https://media-exp1.licdn.com/dms/image/C4D0BAQHDkr8GwzpS3w/company-logo_200_200/0/1629893703278?e=2147483647&v=beta&t=fDwZ2ORC2rzqKCZu8HPD1TjRrMWmk40LGjGxh-Ptjrc',
                    width: 150.0,
                    height: 150.0,
                  ),
                ),
                SizedBox(height: 20.0),
              ],
            ),
          ),

          /// loader
          if (_isLoading)
            Positioned(
              top: 0.0,
              bottom: 0.0,
              left: 0.0,
              right: 0.0,
              child: SkywaGlassMorphicLoader(text: 'Loading...'),
            ),
        ],
      ),*/
    );
  }
}
