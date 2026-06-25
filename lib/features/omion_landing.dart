import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
              children: [
                DefaultAppbar(),
                HeroSection(),
                SizedBox(height: 32),
                HowItWorksSection(),
                SizedBox(height: 32),
                KeyFeaturesSection(),
                SizedBox(height: 32),
                GraphicsSector(),
                SizedBox(height: 32),
                ErrorCardsSection(),
                SizedBox(height: 32),
                FooterSection(),
                SizedBox(height: 32),
              ]
          ),
        )
      )
    );
  }
}
