import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});

  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        isLoading = true;
        setState(() {});
        try {
          final ImagePicker picker = ImagePicker();
          final XFile? image = await picker.pickImage(
            source: ImageSource.gallery,
          );

          selectedImage = File(image!.path);
          widget.onFileChanged(selectedImage);
        } on Exception catch (e) {
          // TODO
        }
        isLoading = false;
        setState(() {});
      },
      child: Skeletonizer(
        enabled: isLoading,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey),
          ),
          child: selectedImage != null
              ? Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.file(selectedImage!, width: double.infinity),
              ),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {
                    selectedImage = null;
                    setState(() {
                      widget.onFileChanged(null);
                    });
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ),
            ],
          )
              : Icon(Icons.image_outlined, size: 120),
        ),
      ),
    );
  }
}