import 'package:flutter/material.dart';

void myShowSnackbar({
  required BuildContext context,
  required String text,
  Color? backgroundColor,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(
          color: Theme.of(context).colorScheme.onError,
        ),
      ),
      backgroundColor: backgroundColor ?? Theme.of(context).colorScheme.error,
    ),
  );
}
