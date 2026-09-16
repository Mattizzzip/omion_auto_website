// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'OBDvia AI - Smart Car Scanning';

  @override
  String get navHowItWorks => 'How it works';

  @override
  String get navFeatures => 'Features';

  @override
  String get navContacts => 'Contacts';

  @override
  String get navDownload => 'Download';

  @override
  String get languageSwitcherLabel => 'Language';

  @override
  String get heroHeadline => 'Smart Vehicle Telematics in Your Pocket';

  @override
  String get heroBody =>
      'Turn your smartphone into a professional diagnostic tool. OBDvia AI connects directly to your car, delivering real-time data, performance metrics, and comprehensive health reports in a clean, intuitive interface.';

  @override
  String get howItWorksTitle => 'HOW IT WORKS';

  @override
  String get howItWorksStep1Title => 'CONNECT TO CAR';

  @override
  String get howItWorksStep1Body =>
      'Plug your ELM327 scanner directly into the vehicle\'s OBD2 port.';

  @override
  String get howItWorksStep2Title => 'PAIR WITH PHONE';

  @override
  String get howItWorksStep2Body =>
      'Connect via Wi-Fi or BT. Note: iOS does not support BT Classic.';

  @override
  String get howItWorksStep3Title => 'SELECT YOUR VEHICLE';

  @override
  String get howItWorksStep3Body =>
      'Specify your car model for accurate diagnostics interpretation.';

  @override
  String get howItWorksStep4Title => 'OFFLINE AI ASSISTANT';

  @override
  String get howItWorksStep4Body =>
      'Built-in autonomous 2-5 GB AI model that works entirely without internet.';

  @override
  String get featuresTitle => 'KEY FEATURES';

  @override
  String get featureClearErrorsTitle => 'CLEAR ERRORS';

  @override
  String get featureClearErrorsBody =>
      'Instantly read, decode, and clear vehicle trouble codes without mechanic help.';

  @override
  String get featureExportReportsTitle => 'EXPORT REPORTS';

  @override
  String get featureExportReportsBody =>
      'Generate and share comprehensive PDF summaries of your car health.';

  @override
  String get featureLiveMonitoringTitle => 'LIVE MONITORING';

  @override
  String get featureLiveMonitoringBody =>
      'Track critical engine parameters and sensor graphics in real time.';

  @override
  String get featureOfflineAiTitle => 'OFFLINE AI';

  @override
  String get featureOfflineAiBody =>
      'Get autonomous diagnostic assistance powered by a built-in AI assistant.';

  @override
  String get graphicsTitle =>
      'Real-Time Automotive\nTelemetry & Data\nProcessing';

  @override
  String get graphicsBody1 =>
      'Track sensors, valve, and fuel trim instantly. Our system processes live OBD-II streams with minimal lag, giving you crystal-clear insights into your engine\'s performance right as you drive.';

  @override
  String get graphicsBody2 =>
      'From tracking Short Term Fuel Trims to monitoring engine load and coolant temperatures — capture critical anomalies before they turn into costly repairs.';

  @override
  String get chartFuelTrimLabel => 'Short Term Fuel Trim:';

  @override
  String get chartValueLabel => 'value: ';

  @override
  String get errorDirectoryTitle => 'Built-In OBD II Fault Code Directory';

  @override
  String get errorDirectoryBody1 =>
      'Never guess what a Check Engine light means again. Our built-in database is fully compliant with universal OBD II standards, containing thousands of diagnostic trouble codes.';

  @override
  String get errorDirectoryBody2 =>
      'Instantly lookup powertrain (P), body (B), chassis (C), and network (U) codes directly on your device. Get clear, professional-grade descriptions and immediate mechanical insights.';

  @override
  String get errorCategoryBody => 'Body';

  @override
  String get errorTitleClimate => 'Climate Control Failure';

  @override
  String get errorCategoryChassis => 'Chassis';

  @override
  String get errorTitleAbs => 'ABS Sensor Circuit Malfunction';

  @override
  String get errorCategoryNetwork => 'Network & Wiring';

  @override
  String get errorTitleO2 =>
      'O2 Sensor Circuit Slow Response\n(Bank 1, Sensor 1)';

  @override
  String get errorTitleCan => 'CAN Communication Error';

  @override
  String get errorSearch => 'Search';

  @override
  String get errorAskAi => 'Ask AI';

  @override
  String get footerContacts => 'Contacts';

  @override
  String get footerEmail => 'Email';

  @override
  String get footerPrivacyPolicy => 'Privacy Policy';

  @override
  String get footerTerms => 'Terms of Service / EULA';

  @override
  String get footerEntrepreneur => 'Individual Entrepreneur ANDREI OSIPAU';

  @override
  String get footerBusinessId => 'Business ID / Tax Number';

  @override
  String get footerCountry => 'Country of Registration';

  @override
  String get footerCountryValue => 'Georgia';

  @override
  String get footerAddress => 'Legal Registration Address';

  @override
  String get footerAddressValue =>
      'Georgia, Tbilisi city, Chugureti district, Tsotne Dadiani street N 7, commercial space Nb229, floor 2';

  @override
  String get footerCopyright => '© 2026 ANDREI OSIPAU. All rights reserved.';

  @override
  String legalLastUpdated(String date) {
    return 'Last Updated: $date';
  }

  @override
  String get privacyTitle => 'Privacy Policy';

  @override
  String get privacyLastUpdated => 'September 16, 2026';

  @override
  String get privacyS1Heading => '1. Information We Collect';

  @override
  String get privacyS1Intro =>
      'We are highly committed to user privacy. The App collects only the minimum necessary data required to provide specific requested features:';

  @override
  String get privacyS1FeedbackLead => 'Feedback Form Data:';

  @override
  String get privacyS1FeedbackRest =>
      'If you choose to contact us, we collect your name, email address, and the description of your idea, bug report, or improvement suggestion.';

  @override
  String get privacyS1NetworkLead => 'Technical Network Requests:';

  @override
  String get privacyS1NetworkRest =>
      ' When downloading AI models, your device connects directly to Hugging Face infrastructure. Your IP address and standard network logs may be processed by Hugging Face in accordance with their ';

  @override
  String get privacyS1PrivacyPolicyLink => 'privacy policy';

  @override
  String get privacyS2Heading =>
      '2. Data We DO NOT Collect (Zero-Data Privacy)';

  @override
  String get privacyS2NoDiagLead => 'No Diagnostic Data Logging:';

  @override
  String get privacyS2NoDiagRest =>
      'All data read from your vehicle via the OBD II adapter is processed live and locally on your mobile device. We never transmit your vehicle diagnostics to external servers.';

  @override
  String get privacyS2NoAiLead => 'No AI Query Logging:';

  @override
  String get privacyS2NoAiRest =>
      'The Gemma 2b/4b models run entirely offline. Your inputs, prompts, and diagnostic analysis outcomes never leave your device.';

  @override
  String get privacyS2NoAnalyticsLead => 'No Third-Party Analytics:';

  @override
  String get privacyS2NoAnalyticsRest =>
      'We do not use tracking software, advertising identifiers, or third-party analytics SDKs (such as Firebase Analytics or Crashlytics). Your usage remains completely anonymous.';

  @override
  String get privacyS3Heading => '3. How We Use Your Information';

  @override
  String get privacyS3Intro =>
      'Data submitted via the Feedback Form is used strictly to:\n';

  @override
  String get privacyS3Bullet1 => 'Respond to your support inquiries.';

  @override
  String get privacyS3Bullet2 => 'Troubleshoot reported bugs and app crashes.';

  @override
  String get privacyS3Bullet3 =>
      'Implement user-requested features and application updates.';

  @override
  String get privacyS4Heading => '4. Data Sharing and Third Parties';

  @override
  String get privacyS4NoSell =>
      'We do not sell, trade, rent, or share your personal data with third parties.';

  @override
  String get privacyS4HfLead => 'Hugging Face:';

  @override
  String get privacyS4HfRest =>
      ' Model downloading establishes a direct connection with Hugging Face. Please review the ';

  @override
  String get privacyS4HfLink => 'Hugging Face Privacy Policy';

  @override
  String get privacyS4HfAfter =>
      ' regarding how they handle asset downloads.\n\n';

  @override
  String get privacyS5Heading => '5. Data Security';

  @override
  String get privacyS5Body =>
      'We implement reasonable technical measures to secure the text data you submit through the Feedback Form. However, please note that no method of transmission over the internet is 100% secure.';

  @override
  String get privacyS6Heading =>
      '6. In-App Purchases, Subscriptions, and Premium';

  @override
  String get privacyS6Intro =>
      'OBDvia offers optional Premium access through in-app purchases processed by platform stores, not by us directly.';

  @override
  String get privacyS6AppleLead => 'Apple App Store (iOS).';

  @override
  String get privacyS6AppleRest =>
      'Weekly and monthly Premium plans are auto-renewable subscriptions. Lifetime Premium is a one-time (non-consumable) purchase. Payment, billing, and refund eligibility are handled by Apple under Apple\'s terms and privacy policy. We do not collect or store your payment card or bank details.';

  @override
  String get privacyS6GoogleLead => 'Google Play (Android).';

  @override
  String get privacyS6GoogleRest =>
      'Where available, Premium may be offered through Google Play billing (including third-party subscription management tools we use to validate purchases). Payment and refunds are handled by Google (and its policies). We do not receive your full payment credentials.';

  @override
  String get privacyS6DataLead => 'Data we process for Premium.';

  @override
  String get privacyS6DataRest =>
      'To unlock features, the app may store Premium entitlement status (e.g. active plan, expiry, or lifetime flag) locally on your device using secure storage. We do not use this information for advertising or cross-app tracking. We do not operate our own billing server for vehicle or diagnostic data.';

  @override
  String get privacyS6CancelLead => 'Cancellation.';

  @override
  String get privacyS6CancelRest =>
      'You can manage or cancel subscriptions in your device account settings (for example: iOS — Settings → Apple ID → Subscriptions; Android — Google Play → Subscriptions).';

  @override
  String get privacyS6RestoreLead => 'Restore purchases.';

  @override
  String get privacyS6RestoreRest =>
      'You may use Restore Purchases in the app to re-apply prior store purchases tied to the same store account.';

  @override
  String get privacyS6LegacyLead => 'Legacy paid app.';

  @override
  String get privacyS6LegacyRest =>
      'Users who purchased the app before it became free may receive Lifetime access according to our support process (for example, verification and an App Store offer code). Details are shown in the app; contact us via the Feedback Form if needed.';

  @override
  String get termsTitle => 'Terms of Service';

  @override
  String get termsLastUpdated => 'September 16, 2026';

  @override
  String get termsS1Heading => '1. Acceptance of Terms';

  @override
  String get termsS1Body =>
      'By downloading, installing, or using this application (the \"App\"), you agree to be bound by these Terms of Service. If you do not agree to these terms, do not use the App.';

  @override
  String get termsS2Heading => '2. Description of Service';

  @override
  String get termsS2Body =>
      'The App provides vehicle diagnostic tools using the OBD II protocol. To analyze data, the App utilizes local, untrained open-weight Artificial Intelligence models (Gemma 2b and Gemma 4b) downloaded directly from Hugging Face.';

  @override
  String get termsS3Heading => '3. App Operation and Internet Requirements';

  @override
  String get termsS3LocalLead => 'Local Operation:';

  @override
  String get termsS3LocalRest =>
      'The core vehicle diagnostics and AI analysis perform entirely offline and locally on your device.';

  @override
  String get termsS3InternetLead => 'Internet Connection:';

  @override
  String get termsS3InternetRest =>
      'An active internet connection is strictly required only for:';

  @override
  String get termsS3Bullet1 =>
      'Downloading the AI model weights from Hugging Face upon the initial setup or required updates.';

  @override
  String get termsS3Bullet2 =>
      'Sending messages through the built-in Feedback Form.';

  @override
  String get termsS4Heading => '4. Third-Party Licenses (Gemma Models)';

  @override
  String get termsS4BeforeGemma =>
      'The App utilizes Gemma models provided by Google LLC. By using this App, you also acknowledge and agree to comply with the ';

  @override
  String get termsS4GemmaLink => 'Google Gemma Terms of Use';

  @override
  String get termsS4Between => '. Downloading these models is governed by ';

  @override
  String get termsS4HfLink => 'Hugging Face’s Terms of Service';

  @override
  String get termsS5Heading =>
      '5. Disclaimer of Warranties and Limitation of Liability';

  @override
  String get termsS5InfoLead => 'For Informational Purposes Only:';

  @override
  String get termsS5InfoRest =>
      'The App is a diagnostic support tool and does not replace professional vehicle maintenance, repair, or expert inspection.';

  @override
  String get termsS5RiskLead => 'Use At Your Own Risk:';

  @override
  String get termsS5RiskRest =>
      'The developer is not liable for any damage to your vehicle, your OBD II scanning hardware, or any accidents or safety hazards resulting from or related to the use of the App.';

  @override
  String get termsS5AsIs =>
      'The App is provided on an \"AS IS\" and \"AS AVAILABLE\" basis without warranties of any kind.';

  @override
  String get termsS6Heading => '6. Governing Law and Dispute Resolution';

  @override
  String get termsS6Body =>
      'These Terms of Service and any separate agreements shall be governed by, and construed in accordance with, the laws of Georgia, without regard to its conflict of law principles. Any legal action, suit, or proceeding arising out of or relating to these Terms or the use of the App shall be instituted exclusively in the competent courts of Tbilisi, Georgia.';

  @override
  String get termsS7Heading =>
      '7. Premium, Subscriptions, and In-App Purchases';

  @override
  String get termsS7PremiumLead => 'Premium features.';

  @override
  String get termsS7PremiumRest =>
      'Certain features require Premium access. Premium is optional; core diagnostic flows may remain available without Premium as described in the App.';

  @override
  String get termsS7ProductsLead => 'Products.';

  @override
  String get termsS7ProductsRest => 'Premium may be offered as:';

  @override
  String get termsS7ProductBullet1 =>
      'Weekly and Monthly — auto-renewable subscriptions;';

  @override
  String get termsS7ProductBullet2 =>
      'Lifetime — a one-time purchase that does not auto-renew.';

  @override
  String get termsS7ProductNames =>
      'Product names, prices, and billing periods are shown in the App at the time of purchase and may vary by region and store.';

  @override
  String get termsS7BillingLead => 'Billing.';

  @override
  String get termsS7BillingRest =>
      'All in-app purchases are processed by Apple (App Store) or Google (Google Play), as applicable. You agree to the store\'s payment terms. We are not responsible for store billing errors, failed charges, or account issues outside the App.';

  @override
  String get termsS7AutoRenewLead => 'Auto-renewal (subscriptions).';

  @override
  String get termsS7AutoRenewRest =>
      'Subscriptions automatically renew unless you turn off auto-renewal at least 24 hours before the end of the current billing period. Your account will be charged for renewal within the window permitted by the store. You manage subscriptions in your store account settings (for example, on iOS: Settings → Apple ID → Subscriptions).';

  @override
  String get termsS7LifetimeLead => 'Lifetime.';

  @override
  String get termsS7LifetimeRest =>
      'The Lifetime product is a single, non-recurring charge. It does not convert into a subscription and does not auto-renew.';

  @override
  String get termsS7RestoreLead => 'Restore.';

  @override
  String get termsS7RestoreRest =>
      'The App provides Restore Purchases to restore eligible prior purchases associated with your store account on that platform.';

  @override
  String get termsS7RefundsLead => 'Refunds.';

  @override
  String get termsS7RefundsRest =>
      'Refund requests are governed by Apple\'s or Google\'s refund policies. We cannot override store refund decisions.';

  @override
  String get termsS7NoProLead => 'No professional reliance.';

  @override
  String get termsS7NoProRest =>
      'Premium does not change the informational nature of the App (see Disclaimer of Warranties). Diagnostic and AI output remain for informational purposes only.';

  @override
  String get termsS7LegacyLead => 'Legacy customers.';

  @override
  String get termsS7LegacyRest =>
      'If you bought the paid App before the freemium release, additional access may be granted through our documented process (in-app instructions and support). Abuse of legacy or promotional codes may result in revoked access.';

  @override
  String get termsS7PrivacyBefore => 'Privacy Policy: ';

  @override
  String get termsS7PrivacyLink => 'https://obdvia.com/privacy_policy';
}
