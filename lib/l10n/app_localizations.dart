import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'OBDvia AI - Smart Car Scanning'**
  String get appTitle;

  /// No description provided for @navHowItWorks.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get navHowItWorks;

  /// No description provided for @navFeatures.
  ///
  /// In en, this message translates to:
  /// **'Features'**
  String get navFeatures;

  /// No description provided for @navContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get navContacts;

  /// No description provided for @navDownload.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get navDownload;

  /// No description provided for @languageSwitcherLabel.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSwitcherLabel;

  /// No description provided for @heroHeadline.
  ///
  /// In en, this message translates to:
  /// **'Smart Vehicle Telematics in Your Pocket'**
  String get heroHeadline;

  /// No description provided for @heroBody.
  ///
  /// In en, this message translates to:
  /// **'Turn your smartphone into a professional diagnostic tool. OBDvia AI connects directly to your car, delivering real-time data, performance metrics, and comprehensive health reports in a clean, intuitive interface.'**
  String get heroBody;

  /// No description provided for @howItWorksTitle.
  ///
  /// In en, this message translates to:
  /// **'HOW IT WORKS'**
  String get howItWorksTitle;

  /// No description provided for @howItWorksStep1Title.
  ///
  /// In en, this message translates to:
  /// **'CONNECT TO CAR'**
  String get howItWorksStep1Title;

  /// No description provided for @howItWorksStep1Body.
  ///
  /// In en, this message translates to:
  /// **'Plug your ELM327 scanner directly into the vehicle\'s OBD2 port.'**
  String get howItWorksStep1Body;

  /// No description provided for @howItWorksStep2Title.
  ///
  /// In en, this message translates to:
  /// **'PAIR WITH PHONE'**
  String get howItWorksStep2Title;

  /// No description provided for @howItWorksStep2Body.
  ///
  /// In en, this message translates to:
  /// **'Connect via Wi-Fi or BT. Note: iOS does not support BT Classic.'**
  String get howItWorksStep2Body;

  /// No description provided for @howItWorksStep3Title.
  ///
  /// In en, this message translates to:
  /// **'SELECT YOUR VEHICLE'**
  String get howItWorksStep3Title;

  /// No description provided for @howItWorksStep3Body.
  ///
  /// In en, this message translates to:
  /// **'Specify your car model for accurate diagnostics interpretation.'**
  String get howItWorksStep3Body;

  /// No description provided for @howItWorksStep4Title.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE AI ASSISTANT'**
  String get howItWorksStep4Title;

  /// No description provided for @howItWorksStep4Body.
  ///
  /// In en, this message translates to:
  /// **'Built-in autonomous 2-5 GB AI model that works entirely without internet.'**
  String get howItWorksStep4Body;

  /// No description provided for @featuresTitle.
  ///
  /// In en, this message translates to:
  /// **'KEY FEATURES'**
  String get featuresTitle;

  /// No description provided for @featureClearErrorsTitle.
  ///
  /// In en, this message translates to:
  /// **'CLEAR ERRORS'**
  String get featureClearErrorsTitle;

  /// No description provided for @featureClearErrorsBody.
  ///
  /// In en, this message translates to:
  /// **'Instantly read, decode, and clear vehicle trouble codes without mechanic help.'**
  String get featureClearErrorsBody;

  /// No description provided for @featureExportReportsTitle.
  ///
  /// In en, this message translates to:
  /// **'EXPORT REPORTS'**
  String get featureExportReportsTitle;

  /// No description provided for @featureExportReportsBody.
  ///
  /// In en, this message translates to:
  /// **'Generate and share comprehensive PDF summaries of your car health.'**
  String get featureExportReportsBody;

  /// No description provided for @featureLiveMonitoringTitle.
  ///
  /// In en, this message translates to:
  /// **'LIVE MONITORING'**
  String get featureLiveMonitoringTitle;

  /// No description provided for @featureLiveMonitoringBody.
  ///
  /// In en, this message translates to:
  /// **'Track critical engine parameters and sensor graphics in real time.'**
  String get featureLiveMonitoringBody;

  /// No description provided for @featureOfflineAiTitle.
  ///
  /// In en, this message translates to:
  /// **'OFFLINE AI'**
  String get featureOfflineAiTitle;

  /// No description provided for @featureOfflineAiBody.
  ///
  /// In en, this message translates to:
  /// **'Get autonomous diagnostic assistance powered by a built-in AI assistant.'**
  String get featureOfflineAiBody;

  /// No description provided for @graphicsTitle.
  ///
  /// In en, this message translates to:
  /// **'Real-Time Automotive\nTelemetry & Data\nProcessing'**
  String get graphicsTitle;

  /// No description provided for @graphicsBody1.
  ///
  /// In en, this message translates to:
  /// **'Track sensors, valve, and fuel trim instantly. Our system processes live OBD-II streams with minimal lag, giving you crystal-clear insights into your engine\'s performance right as you drive.'**
  String get graphicsBody1;

  /// No description provided for @graphicsBody2.
  ///
  /// In en, this message translates to:
  /// **'From tracking Short Term Fuel Trims to monitoring engine load and coolant temperatures — capture critical anomalies before they turn into costly repairs.'**
  String get graphicsBody2;

  /// No description provided for @chartFuelTrimLabel.
  ///
  /// In en, this message translates to:
  /// **'Short Term Fuel Trim:'**
  String get chartFuelTrimLabel;

  /// No description provided for @chartValueLabel.
  ///
  /// In en, this message translates to:
  /// **'value: '**
  String get chartValueLabel;

  /// No description provided for @errorDirectoryTitle.
  ///
  /// In en, this message translates to:
  /// **'Built-In OBD II Fault Code Directory'**
  String get errorDirectoryTitle;

  /// No description provided for @errorDirectoryBody1.
  ///
  /// In en, this message translates to:
  /// **'Never guess what a Check Engine light means again. Our built-in database is fully compliant with universal OBD II standards, containing thousands of diagnostic trouble codes.'**
  String get errorDirectoryBody1;

  /// No description provided for @errorDirectoryBody2.
  ///
  /// In en, this message translates to:
  /// **'Instantly lookup powertrain (P), body (B), chassis (C), and network (U) codes directly on your device. Get clear, professional-grade descriptions and immediate mechanical insights.'**
  String get errorDirectoryBody2;

  /// No description provided for @errorCategoryBody.
  ///
  /// In en, this message translates to:
  /// **'Body'**
  String get errorCategoryBody;

  /// No description provided for @errorTitleClimate.
  ///
  /// In en, this message translates to:
  /// **'Climate Control Failure'**
  String get errorTitleClimate;

  /// No description provided for @errorCategoryChassis.
  ///
  /// In en, this message translates to:
  /// **'Chassis'**
  String get errorCategoryChassis;

  /// No description provided for @errorTitleAbs.
  ///
  /// In en, this message translates to:
  /// **'ABS Sensor Circuit Malfunction'**
  String get errorTitleAbs;

  /// No description provided for @errorCategoryNetwork.
  ///
  /// In en, this message translates to:
  /// **'Network & Wiring'**
  String get errorCategoryNetwork;

  /// No description provided for @errorTitleO2.
  ///
  /// In en, this message translates to:
  /// **'O2 Sensor Circuit Slow Response\n(Bank 1, Sensor 1)'**
  String get errorTitleO2;

  /// No description provided for @errorTitleCan.
  ///
  /// In en, this message translates to:
  /// **'CAN Communication Error'**
  String get errorTitleCan;

  /// No description provided for @errorSearch.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get errorSearch;

  /// No description provided for @errorAskAi.
  ///
  /// In en, this message translates to:
  /// **'Ask AI'**
  String get errorAskAi;

  /// No description provided for @footerContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get footerContacts;

  /// No description provided for @footerEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get footerEmail;

  /// No description provided for @footerPrivacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get footerPrivacyPolicy;

  /// No description provided for @footerTerms.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service / EULA'**
  String get footerTerms;

  /// No description provided for @footerEntrepreneur.
  ///
  /// In en, this message translates to:
  /// **'Individual Entrepreneur ANDREI OSIPAU'**
  String get footerEntrepreneur;

  /// No description provided for @footerBusinessId.
  ///
  /// In en, this message translates to:
  /// **'Business ID / Tax Number'**
  String get footerBusinessId;

  /// No description provided for @footerCountry.
  ///
  /// In en, this message translates to:
  /// **'Country of Registration'**
  String get footerCountry;

  /// No description provided for @footerCountryValue.
  ///
  /// In en, this message translates to:
  /// **'Georgia'**
  String get footerCountryValue;

  /// No description provided for @footerAddress.
  ///
  /// In en, this message translates to:
  /// **'Legal Registration Address'**
  String get footerAddress;

  /// No description provided for @footerAddressValue.
  ///
  /// In en, this message translates to:
  /// **'Georgia, Tbilisi city, Chugureti district, Tsotne Dadiani street N 7, commercial space Nb229, floor 2'**
  String get footerAddressValue;

  /// No description provided for @footerCopyright.
  ///
  /// In en, this message translates to:
  /// **'© 2026 ANDREI OSIPAU. All rights reserved.'**
  String get footerCopyright;

  /// No description provided for @legalLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'Last Updated: {date}'**
  String legalLastUpdated(String date);

  /// No description provided for @privacyTitle.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyTitle;

  /// No description provided for @privacyLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'July 16, 2026'**
  String get privacyLastUpdated;

  /// No description provided for @privacyS1Heading.
  ///
  /// In en, this message translates to:
  /// **'1. Information We Collect'**
  String get privacyS1Heading;

  /// No description provided for @privacyS1Intro.
  ///
  /// In en, this message translates to:
  /// **'We are highly committed to user privacy. The App collects only the minimum necessary data required to provide specific requested features:'**
  String get privacyS1Intro;

  /// No description provided for @privacyS1FeedbackLead.
  ///
  /// In en, this message translates to:
  /// **'Feedback Form Data:'**
  String get privacyS1FeedbackLead;

  /// No description provided for @privacyS1FeedbackRest.
  ///
  /// In en, this message translates to:
  /// **'If you choose to contact us, we collect your name, email address, and the description of your idea, bug report, or improvement suggestion.'**
  String get privacyS1FeedbackRest;

  /// No description provided for @privacyS1NetworkLead.
  ///
  /// In en, this message translates to:
  /// **'Technical Network Requests:'**
  String get privacyS1NetworkLead;

  /// No description provided for @privacyS1NetworkRest.
  ///
  /// In en, this message translates to:
  /// **' When downloading AI models, your device connects directly to Hugging Face infrastructure. Your IP address and standard network logs may be processed by Hugging Face in accordance with their '**
  String get privacyS1NetworkRest;

  /// No description provided for @privacyS1PrivacyPolicyLink.
  ///
  /// In en, this message translates to:
  /// **'privacy policy'**
  String get privacyS1PrivacyPolicyLink;

  /// No description provided for @privacyS2Heading.
  ///
  /// In en, this message translates to:
  /// **'2. Data We DO NOT Collect (Zero-Data Privacy)'**
  String get privacyS2Heading;

  /// No description provided for @privacyS2NoDiagLead.
  ///
  /// In en, this message translates to:
  /// **'No Diagnostic Data Logging:'**
  String get privacyS2NoDiagLead;

  /// No description provided for @privacyS2NoDiagRest.
  ///
  /// In en, this message translates to:
  /// **'All data read from your vehicle via the OBD II adapter is processed live and locally on your mobile device. We never transmit your vehicle diagnostics to external servers.'**
  String get privacyS2NoDiagRest;

  /// No description provided for @privacyS2NoAiLead.
  ///
  /// In en, this message translates to:
  /// **'No AI Query Logging:'**
  String get privacyS2NoAiLead;

  /// No description provided for @privacyS2NoAiRest.
  ///
  /// In en, this message translates to:
  /// **'The Gemma 2b/4b models run entirely offline. Your inputs, prompts, and diagnostic analysis outcomes never leave your device.'**
  String get privacyS2NoAiRest;

  /// No description provided for @privacyS2NoAnalyticsLead.
  ///
  /// In en, this message translates to:
  /// **'No Third-Party Analytics:'**
  String get privacyS2NoAnalyticsLead;

  /// No description provided for @privacyS2NoAnalyticsRest.
  ///
  /// In en, this message translates to:
  /// **'We do not use tracking software, advertising identifiers, or third-party analytics SDKs (such as Firebase Analytics or Crashlytics). Your usage remains completely anonymous.'**
  String get privacyS2NoAnalyticsRest;

  /// No description provided for @privacyS3Heading.
  ///
  /// In en, this message translates to:
  /// **'3. How We Use Your Information'**
  String get privacyS3Heading;

  /// No description provided for @privacyS3Intro.
  ///
  /// In en, this message translates to:
  /// **'Data submitted via the Feedback Form is used strictly to:\n'**
  String get privacyS3Intro;

  /// No description provided for @privacyS3Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Respond to your support inquiries.'**
  String get privacyS3Bullet1;

  /// No description provided for @privacyS3Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Troubleshoot reported bugs and app crashes.'**
  String get privacyS3Bullet2;

  /// No description provided for @privacyS3Bullet3.
  ///
  /// In en, this message translates to:
  /// **'Implement user-requested features and application updates.'**
  String get privacyS3Bullet3;

  /// No description provided for @privacyS4Heading.
  ///
  /// In en, this message translates to:
  /// **'4. Data Sharing and Third Parties'**
  String get privacyS4Heading;

  /// No description provided for @privacyS4NoSell.
  ///
  /// In en, this message translates to:
  /// **'We do not sell, trade, rent, or share your personal data with third parties.'**
  String get privacyS4NoSell;

  /// No description provided for @privacyS4HfLead.
  ///
  /// In en, this message translates to:
  /// **'Hugging Face:'**
  String get privacyS4HfLead;

  /// No description provided for @privacyS4HfRest.
  ///
  /// In en, this message translates to:
  /// **' Model downloading establishes a direct connection with Hugging Face. Please review the '**
  String get privacyS4HfRest;

  /// No description provided for @privacyS4HfLink.
  ///
  /// In en, this message translates to:
  /// **'Hugging Face Privacy Policy'**
  String get privacyS4HfLink;

  /// No description provided for @privacyS4HfAfter.
  ///
  /// In en, this message translates to:
  /// **' regarding how they handle asset downloads.\n\n'**
  String get privacyS4HfAfter;

  /// No description provided for @privacyS5Heading.
  ///
  /// In en, this message translates to:
  /// **'5. Data Security'**
  String get privacyS5Heading;

  /// No description provided for @privacyS5Body.
  ///
  /// In en, this message translates to:
  /// **'We implement reasonable technical measures to secure the text data you submit through the Feedback Form. However, please note that no method of transmission over the internet is 100% secure.'**
  String get privacyS5Body;

  /// No description provided for @termsTitle.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsTitle;

  /// No description provided for @termsLastUpdated.
  ///
  /// In en, this message translates to:
  /// **'July 16, 2026'**
  String get termsLastUpdated;

  /// No description provided for @termsS1Heading.
  ///
  /// In en, this message translates to:
  /// **'1. Acceptance of Terms'**
  String get termsS1Heading;

  /// No description provided for @termsS1Body.
  ///
  /// In en, this message translates to:
  /// **'By downloading, installing, or using this application (the \"App\"), you agree to be bound by these Terms of Service. If you do not agree to these terms, do not use the App.'**
  String get termsS1Body;

  /// No description provided for @termsS2Heading.
  ///
  /// In en, this message translates to:
  /// **'2. Description of Service'**
  String get termsS2Heading;

  /// No description provided for @termsS2Body.
  ///
  /// In en, this message translates to:
  /// **'The App provides vehicle diagnostic tools using the OBD II protocol. To analyze data, the App utilizes local, untrained open-weight Artificial Intelligence models (Gemma 2b and Gemma 4b) downloaded directly from Hugging Face.'**
  String get termsS2Body;

  /// No description provided for @termsS3Heading.
  ///
  /// In en, this message translates to:
  /// **'3. App Operation & Internet Requirements'**
  String get termsS3Heading;

  /// No description provided for @termsS3LocalLead.
  ///
  /// In en, this message translates to:
  /// **'Local Operation:'**
  String get termsS3LocalLead;

  /// No description provided for @termsS3LocalRest.
  ///
  /// In en, this message translates to:
  /// **'The core vehicle diagnostics and AI analysis perform entirely offline and locally on your device.'**
  String get termsS3LocalRest;

  /// No description provided for @termsS3InternetLead.
  ///
  /// In en, this message translates to:
  /// **'Internet Connection:'**
  String get termsS3InternetLead;

  /// No description provided for @termsS3InternetRest.
  ///
  /// In en, this message translates to:
  /// **'An active internet connection is strictly required only for:'**
  String get termsS3InternetRest;

  /// No description provided for @termsS3Bullet1.
  ///
  /// In en, this message translates to:
  /// **'Downloading the AI model weights from Hugging Face upon the initial setup or required updates.'**
  String get termsS3Bullet1;

  /// No description provided for @termsS3Bullet2.
  ///
  /// In en, this message translates to:
  /// **'Sending messages through the built-in Feedback Form.'**
  String get termsS3Bullet2;

  /// No description provided for @termsS4Heading.
  ///
  /// In en, this message translates to:
  /// **'4. Third-Party Licenses (Gemma Models)'**
  String get termsS4Heading;

  /// No description provided for @termsS4BeforeGemma.
  ///
  /// In en, this message translates to:
  /// **'The App utilizes Gemma models provided by Google LLC. By using this App, you also acknowledge and agree to comply with the '**
  String get termsS4BeforeGemma;

  /// No description provided for @termsS4GemmaLink.
  ///
  /// In en, this message translates to:
  /// **'Google Gemma Terms of Use'**
  String get termsS4GemmaLink;

  /// No description provided for @termsS4Between.
  ///
  /// In en, this message translates to:
  /// **'. Downloading these models is governed by '**
  String get termsS4Between;

  /// No description provided for @termsS4HfLink.
  ///
  /// In en, this message translates to:
  /// **'Hugging Face’s Terms of Service'**
  String get termsS4HfLink;

  /// No description provided for @termsS5Heading.
  ///
  /// In en, this message translates to:
  /// **'5. Disclaimer of Warranties & Limitation of Liability'**
  String get termsS5Heading;

  /// No description provided for @termsS5InfoLead.
  ///
  /// In en, this message translates to:
  /// **'For Informational Purposes Only:'**
  String get termsS5InfoLead;

  /// No description provided for @termsS5InfoRest.
  ///
  /// In en, this message translates to:
  /// **'The App is a diagnostic support tool and does not replace professional vehicle maintenance, repair, or expert inspection.'**
  String get termsS5InfoRest;

  /// No description provided for @termsS5RiskLead.
  ///
  /// In en, this message translates to:
  /// **'Use At Your Own Risk:'**
  String get termsS5RiskLead;

  /// No description provided for @termsS5RiskRest.
  ///
  /// In en, this message translates to:
  /// **'The developer is not liable for any damage to your vehicle, your OBD II scanning hardware, or any accidents/safety hazards resulting from or related to the use of the App.'**
  String get termsS5RiskRest;

  /// No description provided for @termsS5AsIs.
  ///
  /// In en, this message translates to:
  /// **'The App is provided on an \"AS IS\" and \"AS AVAILABLE\" basis without warranties of any kind.'**
  String get termsS5AsIs;

  /// No description provided for @termsS6Heading.
  ///
  /// In en, this message translates to:
  /// **'6. Governing Law and Dispute Resolution'**
  String get termsS6Heading;

  /// No description provided for @termsS6Body.
  ///
  /// In en, this message translates to:
  /// **'These Terms of Service and any separate agreements shall be governed by, and construed in accordance with, the laws of Georgia, without regard to its conflict of law principles. Any legal action, suit, or proceeding arising out of or relating to these Terms or the use of the App shall be instituted exclusively in the competent courts of Tbilisi, Georgia.'**
  String get termsS6Body;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
