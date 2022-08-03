import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_device_type/flutter_device_type.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:skywa_framework_widgets/skywa_appbar.dart';
import 'package:skywa_framework_widgets/skywa_elevated_button.dart';
import 'package:skywa_framework_widgets/skywa_image_picker.dart';

class SampleImagePickerScreen extends StatefulWidget {
  const SampleImagePickerScreen({Key? key}) : super(key: key);

  @override
  _SampleImagePickerScreenState createState() =>
      _SampleImagePickerScreenState();
}

class _SampleImagePickerScreenState extends State<SampleImagePickerScreen> {
  List<File> imageFiles = [];
  File? pickedImage;

  @override
  Widget build(BuildContext context) {
    print(imageFiles);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Image Pickers'),
      ),
      body: Container(
        height: Device.screenHeight,
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            SkywaElevatedButton.info(
              context: context,
              text: 'Pick Gallery Image',
              onTap: () async {
                pickedImage = await SkywaImagePicker(
                  context: context,
                ).pickImageFromGallery(cropStyle: CropStyle.rectangle);
                print('pickedImage: $pickedImage');
                if (pickedImage != null) imageFiles.add(pickedImage!);
                setState(() {});
              },
            ),
            const SizedBox(height: 20.0),
            SkywaElevatedButton.delete(
              context: context,
              text: 'Pick Camera Image',
              onTap: () async {
                pickedImage = await SkywaImagePicker(
                  context: context,
                ).pickImageFromCamera(
                  cropStyle: CropStyle.rectangle,
                );
                if (pickedImage != null) imageFiles.add(pickedImage!);
                setState(() {});
              },
            ),
            const SizedBox(height: 20.0),
            SkywaElevatedButton.save(
              context: context,
              text: 'Pick Multiple Images',
              onTap: () async {
                List<File> pickedMultipleImages = [];
                pickedMultipleImages = await SkywaImagePicker(
                  context: context,
                ).pickMultipleImage();
                print('multiple image: $pickedMultipleImages');
                imageFiles.addAll(pickedMultipleImages);
                setState(() {});
              },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: imageFiles.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20.0),
                      if (imageFiles[index] != null)
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.file(
                              imageFiles[index],
                              fit: BoxFit.cover,
                              width: Device.screenWidth / 2,
                              height: Device.screenWidth / 2,
                            ),
                          ),
                        ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
