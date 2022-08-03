import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class SkywaImagePicker {
  final BuildContext context;
  final CameraDevice preferredCameraDevice;

  SkywaImagePicker({
    required this.context,
    this.preferredCameraDevice = CameraDevice.rear,
  });

  Future<File>? pickImageFromCamera(
      {CropStyle cropStyle = CropStyle.circle}) async {
    File? imageFile;
    File? croppedImageFile;
    ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 99,
      preferredCameraDevice: preferredCameraDevice,
    );
    try {
      imageFile = File(pickedImage!.path);
      croppedImageFile =
          await cropImage(imageFile: imageFile, cropStyle: cropStyle);
    } catch (error) {
      print('error: $error');
      print('No image selected');
    }

    /// without cropping user can't add image
    return croppedImageFile!;
  }

  Future<File>? pickImageFromGallery(
      {CropStyle cropStyle = CropStyle.circle}) async {
    File? imageFile;
    File? croppedImageFile;
    ImagePicker imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 99,
      preferredCameraDevice: preferredCameraDevice,
    );
    try {
      imageFile = File(pickedImage!.path);
      croppedImageFile =
          await cropImage(imageFile: imageFile, cropStyle: cropStyle);
    } catch (error) {
      print('error: $error');
      print('No image selected');
    }

    /// without cropping user can't add image
    return croppedImageFile!;
  }

  Future<List<File>> pickMultipleImage(
      {CropStyle cropStyle = CropStyle.circle}) async {
    List<File> imageFiles = [];
    List<File> croppedImageFiles = [];
    ImagePicker imagePicker = ImagePicker();
    final List<XFile>? pickedImages = await imagePicker.pickMultiImage(
      imageQuality: 99,
    );
    try {
      for (var pickedImage in pickedImages!) {
        imageFiles.add(File(pickedImage.path));
        imageFiles = List.from(imageFiles.reversed);
      }
      for (File imageToBeCropped in imageFiles) {
        await cropImage(
          imageFile: File(imageToBeCropped.path),
          cropStyle: cropStyle,
        ).then((croppedImage) {
          print(croppedImage);
          croppedImageFiles.add(croppedImage);
          print('croppedImageFiles: $croppedImageFiles');
          print('croppedImageFiles.length: ${croppedImageFiles.length}');
        });
      }
    } catch (error) {
      print('error: $error');
      print('No image selected');
    }
    return croppedImageFiles;
  }

  Future<File> cropImage(
      {required File imageFile,
      CropStyle cropStyle = CropStyle.rectangle}) async {
    CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      cropStyle: cropStyle,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.original,
        // CropAspectRatioPreset.ratio3x2,
        // CropAspectRatioPreset.ratio4x3,
        // CropAspectRatioPreset.ratio5x3,
        // CropAspectRatioPreset.ratio5x4,
        // CropAspectRatioPreset.ratio7x5,
        // CropAspectRatioPreset.ratio16x9,
      ],
      uiSettings: [
        AndroidUiSettings(
          backgroundColor: Theme.of(context).primaryColor,
          cropFrameColor: Colors.white,
          cropGridColor: Colors.grey.shade300,
          showCropGrid: true,
          toolbarColor: Theme.of(context).primaryColor,
          toolbarTitle: 'Crop Image',
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          activeControlsWidgetColor: Theme.of(context).primaryColorDark,
          dimmedLayerColor: Colors.white,
          // lockAspectRatio: false,
        ),
        IOSUiSettings(
          title: 'Crop Image',
          cancelButtonTitle: 'Cancel',
          doneButtonTitle: 'Save',
          rotateButtonsHidden: false,
          resetAspectRatioEnabled: true,
          resetButtonHidden: false,
          showCancelConfirmationDialog: true,
        ),
      ],
    );
    return File(croppedFile!.path);
  }
}
