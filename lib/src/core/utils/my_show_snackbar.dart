import 'package:flutter/material.dart';

void myShowSnackbar({
  required BuildContext context,
  required String text,
  Color? backgroundColor,
}) {
  final theme = Theme.of(context);

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        text,
        style: theme.textTheme.labelLarge?.copyWith(
          color: theme.colorScheme.onError,
        ),
      ),
      backgroundColor: backgroundColor ?? theme.colorScheme.error,
    ),
  );
}
