import 'package:flutter/material.dart';
import 'package:story_app/l10n/app_localizations.dart';

class ErrorMapper {
  static String getErrorMessage(String error, BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    String lowerError = error.toLowerCase();

    lowerError = lowerError.replaceAll('exception:', '');
    lowerError = lowerError.replaceAll('error:', '');
    lowerError = lowerError.replaceAll('dioexception:', '');
    lowerError = lowerError.trim();

    if (lowerError.contains('socketexception') ||
        lowerError.contains('failed host lookup') ||
        lowerError.contains('network is unreachable') ||
        lowerError.contains('connection refused') ||
        lowerError.contains('connection error')) {
      return loc.errorNoInternet;
    }

    if (lowerError.contains('timeout') ||
        lowerError.contains('deadline exceeded') ||
        lowerError.contains('connection took longer')) {
      return loc.errorTimeout;
    }

    if (lowerError.contains('500') ||
        lowerError.contains('internal server error')) {
      return loc.errorServerError;
    }

    return error.replaceAll('Exception: ', '').replaceAll('Error: ', '');
  }
}
