import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/legal/privacy_policy_page.dart';
import 'package:omion_auto_website/features/legal/terms_of_service_page.dart';
import 'package:omion_auto_website/features/omion_landing.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'OBDvia AI - Smart Car Scanning',
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (_) => const OmionLanding(),
        AppRoutes.privacyPolicy: (_) => const PrivacyPolicyPage(),
        AppRoutes.termsOfService: (_) => const TermsOfServicePage(),
      },
      onUnknownRoute: (_) => MaterialPageRoute<void>(
        builder: (_) => const OmionLanding(),
      ),
    );
  }
}
