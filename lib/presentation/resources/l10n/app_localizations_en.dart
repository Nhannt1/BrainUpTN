// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'English Word';

  @override
  String get next => 'Next';

  @override
  String get flashcards => '';

  @override
  String get youHaveNotVerifiedYourMail => 'You have not verified your email';

  @override
  String get averificationemail => 'A verification email has been sent to your address. Please check and click on the verification link.';
}
