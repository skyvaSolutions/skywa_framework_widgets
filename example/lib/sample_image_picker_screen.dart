import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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
  List<Uint8List> imageUint8s = [];
  File? pickedImage;
  Uint8List? pickedUint8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: SkywaAppBar(appbarText: 'Sample Image Pickers'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const SizedBox(height: 20.0),

            /// gallery
            SkywaElevatedButton.info(
              context: context,
              text: 'Pick Gallery Image',
              onTap: () async {
                if (kIsWeb) {
                  pickedUint8 = await SkywaImagePicker(
                    context: context,
                  ).pickImageFromGallery();
                  if (pickedUint8 != null) imageUint8s.add(pickedUint8!);
                  print(imageUint8s);
                } else {
                  pickedImage = await SkywaImagePicker(
                    context: context,
                  ).pickImageFromGallery(cropStyle: CropStyle.rectangle);
                  /*print('pickedImage: $pickedImage');*/
                  if (pickedImage != null) imageFiles.add(pickedImage!);
                }
                setState(() {});
              },
            ),
            const SizedBox(height: 20.0),

            /// camera
            if (!kIsWeb)
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
            if (!kIsWeb) const SizedBox(height: 20.0),
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
                itemCount: kIsWeb ? imageUint8s.length : imageFiles.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      const SizedBox(height: 20.0),
                      if (kIsWeb)
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(16.0),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16.0),
                            child: Image.memory(
                              imageUint8s[index],
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 2,
                            ),
                          ),
                        )
                      else if (imageFiles[index] != null)
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
                              width: MediaQuery.of(context).size.width / 2,
                              height: MediaQuery.of(context).size.width / 2,
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
