import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> selectUserAvatarFromGallery() async {
  final xFile = await ImagePicker().pickImage(
    source: ImageSource.gallery,
    imageQuality: 50,
  );

  if (xFile != null) {
    return await _cropImage(File(xFile.path));
  }else {
    return null;
  }

}
Future<File?> selectUserAvatarFromCamera() async {
  final xFile = await ImagePicker().pickImage(
    source: ImageSource.camera,
    imageQuality: 50,
  );

  if (xFile != null) {
    return await _cropImage(File(xFile.path));
  }else {
    return null;
  }

}

Future<File?> _cropImage(File imageFile) async {
  final croppedFile = await ImageCropper().cropImage(
    aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
    sourcePath: imageFile.path,
    uiSettings: [
      AndroidUiSettings(
        cropStyle: CropStyle.rectangle,
        toolbarTitle: 'Avatar',
        toolbarColor: Colors.deepPurple,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
      ),
      IOSUiSettings(
        aspectRatioPickerButtonHidden: true,
        aspectRatioLockEnabled: true,
        aspectRatioPresets: [
          CropAspectRatioPreset.square
        ],
        title: 'Avatar',
      ),
    ]
  );
  if (croppedFile != null) {
    return File(croppedFile.path);
  }else {
    return null;
  }
}