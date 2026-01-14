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
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String get logout => 'Logout';
}
