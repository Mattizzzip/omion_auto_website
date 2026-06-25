import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';

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
              'icons/car_logo.svg',
              width: logoWidth,
              fit: BoxFit.contain,
            ),
            SizedBox(height: isMobile ? 24 : 40),
            Text(
              key: headlineKey,
              'Smart Vehicle Telematics in Your Pocket',
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
                    'Turn your smartphone into a professional diagnostic tool. OMION connects directly to your car, delivering real-time data, performance metrics, and comprehensive health reports in a clean, intuitive interface.',
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
                  Image.asset('assets/images/phone_hero.png', width: 128),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Turn your smartphone into a professional diagnostic tool. OMION connects directly to your car, delivering real-time data, performance metrics, and comprehensive health reports in a clean, intuitive interface.',
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
                  Image.asset('assets/images/phone_hero.png', width: 128),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
