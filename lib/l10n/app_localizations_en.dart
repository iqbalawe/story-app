// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get loginTagline => 'Log in to share your moment';

  @override
  String get registerTitle => 'Create Account';

  @override
  String get registerTagline => 'Sign up to share stories with your friends';

  @override
  String get registerName => 'Name';

  @override
  String get email => 'Email Address';

  @override
  String get password => 'Password';

  @override
  String get authRegisterText => 'Don\'t have an account yet?';

  @override
  String get authLoginText => 'Already have an account?';

  @override
  String get titleLoginButton => 'Login';

  @override
  String get titleRegisterButton => 'Register';

  @override
  String get storyDescription => 'Description';

  @override
  String get addStory => 'Create Story';

  @override
  String get uploadStory => 'Upload Story';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get postDetailTitle => 'Post Detail';

  @override
  String get createdAt => 'Created at';

  @override
  String get addStoryTitle => 'Create Story';

  @override
  String get addStoryDescription => 'Share your story...';

  @override
  String get errorNoInternet =>
      'No internet connection. Please check your network.';

  @override
  String get errorTimeout =>
      'Connection timeout. Server is taking too long to respond.';

  @override
  String get errorServerError =>
      'Server encountered a problem. Please try again later.';

  @override
  String get errorUnknown => 'An unexpected error occurred.';

  @override
  String get refreshButtonText => 'Try Again';

  @override
  String get logoutDialogText =>
      'Are you sure you want to exit the application?';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get likedButtonText => 'You liked this post!';

  @override
  String get selectLocation => 'Select Location';

  @override
  String get changeLocation => 'Change Location';

  @override
  String get lockedFeatureInfo =>
      'The location feature is only available for the paid version.';

  @override
  String get selectImageValidation => 'Please select an image first';

  @override
  String get writeDescriptionValidation => 'Please fill in the description';

  @override
  String get address => 'Select a location by pressing the map';

  @override
  String get failedAddress => 'Failed to load map';

  @override
  String get selectedLocation => 'Selected Location';

  @override
  String get selectedLocationButtonText => 'Select This Location';
}
