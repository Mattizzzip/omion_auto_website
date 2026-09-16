import 'package:flutter/material.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';

import '../theme/breakpoints.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = !isMobileLayout(context);
    final l10n = AppLocalizations.of(context);
    final steps = [
      _StepData(
        number: '1',
        title: l10n.howItWorksStep1Title,
        subTitle: l10n.howItWorksStep1Body,
        icon: Icons.directions_car,
      ),
      _StepData(
        number: '2',
        title: l10n.howItWorksStep2Title,
        subTitle: l10n.howItWorksStep2Body,
        icon: Icons.bluetooth_searching,
      ),
      _StepData(
        number: '3',
        title: l10n.howItWorksStep3Title,
        subTitle: l10n.howItWorksStep3Body,
        icon: Icons.fact_check_outlined,
      ),
      _StepData(
        number: '4',
        title: l10n.howItWorksStep4Title,
        subTitle: l10n.howItWorksStep4Body,
        icon: Icons.psychology_outlined,
      ),
    ];

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - value)),
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          Text(
            l10n.howItWorksTitle,
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 28 : 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 12),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (final step in steps)
                      Expanded(
                        child: _StepCard(
                          number: step.number,
                          title: step.title,
                          subTitle: step.subTitle,
                          icon: step.icon,
                        ),
                      ),
                  ],
                )
              : Column(
                  children: [
                    for (var i = 0; i < steps.length; i++) ...[
                      if (i > 0) const SizedBox(height: 40),
                      _StepCard(
                        number: steps[i].number,
                        title: steps[i].title,
                        subTitle: steps[i].subTitle,
                        icon: steps[i].icon,
                        isMobile: true,
                      ),
                    ],
                  ],
                ),
        ],
      ),
    );
  }
}

class _StepData {
  final String number;
  final String title;
  final String subTitle;
  final IconData icon;

  const _StepData({
    required this.number,
    required this.title,
    required this.subTitle,
    required this.icon,
  });
}

class _StepCard extends StatelessWidget {
  final String number;
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isMobile;

  const _StepCard({
    required this.number,
    required this.title,
    required this.subTitle,
    required this.icon,
    this.isMobile = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 0.0 : 12.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Center(
                  child: Text(
                    number,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.12),
                      fontSize: isMobile ? 48 : 56,
                      fontWeight: FontWeight.bold,
                      height: 2.0,
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        subTitle,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.55),
                          fontSize: 13,
                          height: 1.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Icon(
            icon,
            size: isMobile ? 96 : 128,
            color: Colors.white.withOpacity(0.2),
          ),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
