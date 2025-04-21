import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<XFile?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _pickedImage;
  bool isLoading = false;

  Future<void> _pickImageFromGallery() async {
    try {
      final image = await _imagePicker.pickImage(source: ImageSource.gallery);
      setState(() {
        _pickedImage = image != null ? XFile(image.path) : null;
      });
      widget.onFileChanged(_pickedImage!);
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () {
          isLoading = true;
          setState(() {});
          _pickImageFromGallery();
          isLoading = false;
          setState(() {});
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey),
              ),
              child:
                  _pickedImage != null
                      ? SizedBox(
                        width: 200,
                        height: 200,
                        child: Image.file(File(_pickedImage!.path)),
                      )
                      : Icon(Icons.image_outlined, size: 180),
            ),
            _pickedImage != null
                ? Positioned(
                  top: 0,
                  right: 0,
                  child: IconButton(
                    onPressed: () {
                      _pickedImage = null;
                      setState(() {});
                      widget.onFileChanged(_pickedImage);
                    },
                    icon: Icon(Icons.clear),
                  ),
                )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
