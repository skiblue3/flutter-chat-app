// ignore_for_file: deprecated_member_use, camel_case_types

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class userImagePicker extends StatefulWidget {
  const userImagePicker({Key key, this.imagePickFn}) : super(key: key);
  final void Function(File pickedImage) imagePickFn;

  @override
  State<userImagePicker> createState() => _userImagePickerState();
}

class _userImagePickerState extends State<userImagePicker> {
  File pickedImageFile;

  void pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 70,
      maxWidth: 150,
    );
    setState(() {
      pickedImageFile = pickedImage != null ? File(pickedImage.path) : null;
    });

    widget.imagePickFn(pickedImageFile);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 50,
          backgroundImage:
              pickedImageFile != null ? FileImage(pickedImageFile) : null,
        ),
        ElevatedButton.icon(
          onPressed: pickImage,
          icon: const Icon(Icons.image),
          label: const Text('Add Image'),
          // textColor: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
}
