import 'package:flutter/material.dart';

class ImagePickerButton extends StatelessWidget {
  const ImagePickerButton({
    required this.icon,
    required this.onTap,
    required this.color,
    super.key,
  });

  final IconData icon;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.surface.withValues(alpha: 0.9),
      shape: const CircleBorder(),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Icon(icon, color: color, size: 24),
        ),
      ),
    );
  }
}
