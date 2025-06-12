import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_vi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('vi')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'English Word'**
  String get appName;

  /// No description provided for @next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get next;

  /// No description provided for @flashcards.
  ///
  /// In en, this message translates to:
  /// **'Flashcards'**
  String get flashcards;

  /// No description provided for @enteryourname.
  ///
  /// In en, this message translates to:
  /// **'Enter your name'**
  String get enteryourname;

  /// No description provided for @pleaseenteryourname.
  ///
  /// In en, this message translates to:
  /// **'Please enter your name'**
  String get pleaseenteryourname;

  /// No description provided for @incorrectformat.
  ///
  /// In en, this message translates to:
  /// **'Incorrect format'**
  String get incorrectformat;

  /// No description provided for @pleaseenteremail.
  ///
  /// In en, this message translates to:
  /// **'Please enter email'**
  String get pleaseenteremail;

  /// No description provided for @enteryourphone.
  ///
  /// In en, this message translates to:
  /// **'Enter Your Phone'**
  String get enteryourphone;

  /// No description provided for @pleaseenteryourphonenumber.
  ///
  /// In en, this message translates to:
  /// **'Please enter your phone number'**
  String get pleaseenteryourphonenumber;

  /// No description provided for @createapassword.
  ///
  /// In en, this message translates to:
  /// **'Create a password'**
  String get createapassword;

  /// No description provided for @pleaseenterpassword.
  ///
  /// In en, this message translates to:
  /// **'Please enter password'**
  String get pleaseenterpassword;

  /// No description provided for @passwordmustbeatleast6characters.
  ///
  /// In en, this message translates to:
  /// **'Password must be at least 6 characters'**
  String get passwordmustbeatleast6characters;

  /// No description provided for @iagreetothe.
  ///
  /// In en, this message translates to:
  /// **'I agree to the '**
  String get iagreetothe;

  /// No description provided for @termsofservice.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service '**
  String get termsofservice;

  /// No description provided for @and.
  ///
  /// In en, this message translates to:
  /// **'and '**
  String get and;

  /// No description provided for @privacypolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacypolicy;

  /// No description provided for @register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get register;

  /// No description provided for @pleaseagreetotheterms.
  ///
  /// In en, this message translates to:
  /// **'Please agree to the terms'**
  String get pleaseagreetotheterms;

  /// No description provided for @registeredsuccessfully.
  ///
  /// In en, this message translates to:
  /// **'Registered successfully!'**
  String get registeredsuccessfully;

  /// No description provided for @emailalreadyinuse.
  ///
  /// In en, this message translates to:
  /// **'Email already in use'**
  String get emailalreadyinuse;

  /// No description provided for @forgotpassword.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get forgotpassword;

  /// No description provided for @loginsuccessful.
  ///
  /// In en, this message translates to:
  /// **'Login successful!'**
  String get loginsuccessful;

  /// No description provided for @loginwithotp.
  ///
  /// In en, this message translates to:
  /// **'Login with OTP'**
  String get loginwithotp;

  /// No description provided for @pleaseverifyyouremailbeforeloggingin.
  ///
  /// In en, this message translates to:
  /// **'Please verify your email before logging in'**
  String get pleaseverifyyouremailbeforeloggingin;

  /// No description provided for @incorrectemailorpassword.
  ///
  /// In en, this message translates to:
  /// **'Incorrect email or password'**
  String get incorrectemailorpassword;

  /// No description provided for @googleloginsuccessful.
  ///
  /// In en, this message translates to:
  /// **'Google login successful!'**
  String get googleloginsuccessful;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get login;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @passwordsdonotmatch.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get passwordsdonotmatch;

  /// No description provided for @youHaveNotVerifiedYourMail.
  ///
  /// In en, this message translates to:
  /// **'You have not verified your email'**
  String get youHaveNotVerifiedYourMail;

  /// No description provided for @averificationemail.
  ///
  /// In en, this message translates to:
  /// **'A verification email has been sent to your address. Please check and click on the verification link.'**
  String get averificationemail;

  /// No description provided for @yourgroups.
  ///
  /// In en, this message translates to:
  /// **'Your Groups'**
  String get yourgroups;

  /// No description provided for @viewall.
  ///
  /// In en, this message translates to:
  /// **'View All'**
  String get viewall;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @welcometobrAInUp.
  ///
  /// In en, this message translates to:
  /// **'Welcome to BrAInUp!'**
  String get welcometobrAInUp;

  /// No description provided for @personalizeyourlearning.
  ///
  /// In en, this message translates to:
  /// **'Personalize your learning journey with AI, quizzes, flashcards, and friends. Ready to level up?'**
  String get personalizeyourlearning;

  /// No description provided for @getstarted.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get getstarted;

  /// No description provided for @airecommends.
  ///
  /// In en, this message translates to:
  /// **'AI recommends'**
  String get airecommends;

  /// No description provided for @todayfocuson.
  ///
  /// In en, this message translates to:
  /// **'Today, focus on '**
  String get todayfocuson;

  /// No description provided for @biology.
  ///
  /// In en, this message translates to:
  /// **'Biology '**
  String get biology;

  /// No description provided for @flashcardsandtry.
  ///
  /// In en, this message translates to:
  /// **'flashcards and try the new \"Photosynthesis Quiz\".'**
  String get flashcardsandtry;

  /// No description provided for @seedetails.
  ///
  /// In en, this message translates to:
  /// **'See Details'**
  String get seedetails;

  /// No description provided for @aichat.
  ///
  /// In en, this message translates to:
  /// **'AI Chat'**
  String get aichat;

  /// No description provided for @quizroom.
  ///
  /// In en, this message translates to:
  /// **'Quiz Room'**
  String get quizroom;

  /// No description provided for @mathstudy.
  ///
  /// In en, this message translates to:
  /// **'Math Study'**
  String get mathstudy;

  /// No description provided for @literature.
  ///
  /// In en, this message translates to:
  /// **'Literature'**
  String get literature;

  /// No description provided for @daystreak.
  ///
  /// In en, this message translates to:
  /// **'7-Day Streak!'**
  String get daystreak;

  /// No description provided for @keepitupandearnbonusxp.
  ///
  /// In en, this message translates to:
  /// **'Keep it up and earn bonus XP'**
  String get keepitupandearnbonusxp;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'vi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'vi': return AppLocalizationsVi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
