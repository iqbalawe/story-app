import 'dart:io';

import 'package:flutter/material.dart';
import 'package:story_app/src/features/story/presentation/widgets/image_picker_button.dart';

class ImageUploadContainer extends StatelessWidget {
  const ImageUploadContainer({
    required this.onTapCamera,
    required this.onTapGallery,
    this.imageFile,
    super.key,
  });

  final File? imageFile;
  final VoidCallback onTapCamera;
  final VoidCallback onTapGallery;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: BorderRadius.circular(16),
      ),
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(16),
        child: Stack(
          children: [
            Positioned.fill(
              child: imageFile != null
                  ? Image.file(imageFile!, fit: BoxFit.cover)
                  : Container(
                      color: Theme.of(
                        context,
                      ).colorScheme.surface.withValues(alpha: 0.5),
                    ),
            ),
            if (imageFile == null)
              Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      size: 40,
                      color: Theme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.5),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ImagePickerButton(
                          color: Colors.red,
                          icon: Icons.camera_alt_outlined,
                          onTap: onTapCamera,
                        ),
                        const SizedBox(width: 8),
                        ImagePickerButton(
                          color: Colors.amber,
                          icon: Icons.photo_library_outlined,
                          onTap: onTapGallery,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
