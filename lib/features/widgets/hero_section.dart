import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';

class HeroSection extends StatelessWidget {
  final GlobalKey? headlineKey;

  const HeroSection({super.key, this.headlineKey});

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final screenWidth = MediaQuery.sizeOf(context).width;
    final logoWidth = isMobile ? screenWidth * 0.85 : 800.0;
    final headlineSize = isMobile ? 24.0 : 32.0;
    final bodySize = isMobile ? 16.0 : 18.0;
    final l10n = AppLocalizations.of(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: isMobile ? 40 : 80,
        horizontal: isMobile ? 8 : 20,
      ),
      color: AppColors.background,
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(milliseconds: 1500),
        curve: Curves.easeOutCubic,
        builder: (context, value, child) {
          return Opacity(
            opacity: value,
            child: Transform.translate(
              offset: Offset(0, 50 * (1 - value)),
              child: child,
            ),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/car_logo.svg',
              width: logoWidth,
              fit: BoxFit.contain,
            ),
            SizedBox(height: isMobile ? 24 : 40),
            Text(
              key: headlineKey,
              l10n.heroHeadline,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.lightStyle,
                fontSize: headlineSize,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                height: 1.4,
              ),
            ),
            SizedBox(height: isMobile ? 12 : 16),
            if (isMobile)
              Column(
                children: [
                  Text(
                    l10n.heroBody,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.lightStyle,
                      fontSize: bodySize,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const StoreBadgesRow(),
                ],
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const _HeroPhoneImage(width: 180),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          l10n.heroBody,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.lightStyle,
                            fontSize: bodySize,
                          ),
                        ),
                        const SizedBox(height: 24),
                        const StoreBadgesRow(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16),
                  const _HeroPhoneImage(width: 180),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _HeroPhoneImage extends StatelessWidget {
  final double width;

  const _HeroPhoneImage({required this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.topCenter,
      foregroundDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.0, 0.42, 0.48, 0.5, 1.0],
          colors: [
            Colors.transparent,
            Colors.transparent,
            AppColors.background.withValues(alpha: 0.55),
            AppColors.background,
            AppColors.background,
          ],
        ),
      ),
      child: Image.asset(
        'assets/images/phone_hero.png',
        width: width,
        fit: BoxFit.contain,
      ),
    );
  }
}
