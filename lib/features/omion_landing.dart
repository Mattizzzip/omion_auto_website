import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/default_appbar.dart';
import 'package:omion_auto_website/features/widgets/error_cards_section.dart';
import 'package:omion_auto_website/features/widgets/footer_section.dart';
import 'package:omion_auto_website/features/widgets/graphics_sector.dart';
import 'package:omion_auto_website/features/widgets/hero_section.dart';
import 'package:omion_auto_website/features/widgets/how_it_works.dart';
import 'package:omion_auto_website/features/widgets/key_features.dart';

class OmionLanding extends StatefulWidget {
  const OmionLanding({super.key});

  @override
  State<OmionLanding> createState() => _OmionLandingState();
}

class _OmionLandingState extends State<OmionLanding> {
  final _scrollController = ScrollController();
  final _heroKey = GlobalKey();
  final _downloadKey = GlobalKey();
  final _howItWorksKey = GlobalKey();
  final _featuresKey = GlobalKey();
  final _footerKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: DefaultAppbar(
        scrollController: _scrollController,
        homeKey: _heroKey,
        downloadKey: _downloadKey,
        howItWorksKey: _howItWorksKey,
        featuresKey: _featuresKey,
        footerKey: _footerKey,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 24),
          child: Column(
            children: [
              HeroSection(key: _heroKey, headlineKey: _downloadKey),
              const SizedBox(height: 32),
              HowItWorksSection(key: _howItWorksKey),
              const SizedBox(height: 32),
              KeyFeaturesSection(key: _featuresKey),
              const SizedBox(height: 32),
              const GraphicsSector(),
              const SizedBox(height: 32),
              const ErrorCardsSection(),
              const SizedBox(height: 32),
              FooterSection(key: _footerKey),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
