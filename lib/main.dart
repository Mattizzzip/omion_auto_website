import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/legal/privacy_policy_page.dart';
import 'package:omion_auto_website/features/legal/terms_of_service_page.dart';
import 'package:omion_auto_website/features/omion_landing.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';
import 'package:omion_auto_website/l10n/locale_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  final localeController = LocaleController();
  await localeController.load();
  runApp(MyApp(localeController: localeController));
}

class MyApp extends StatefulWidget {
  final LocaleController? localeController;

  const MyApp({super.key, this.localeController});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final LocaleController _localeController =
      widget.localeController ?? LocaleController();

  @override
  void initState() {
    super.initState();
    if (widget.localeController == null) {
      _localeController.load();
    }
  }

  @override
  void dispose() {
    if (widget.localeController == null) {
      _localeController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LocaleScope(
      controller: _localeController,
      child: ListenableBuilder(
        listenable: _localeController,
        builder: (context, _) {
          return MaterialApp(
            onGenerateTitle: (context) => AppLocalizations.of(context).appTitle,
            debugShowCheckedModeBanner: false,
            locale: _localeController.locale,
            supportedLocales: LocaleController.supportedLocales,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
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
        },
      ),
    );
  }
}
