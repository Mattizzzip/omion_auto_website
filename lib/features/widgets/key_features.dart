import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/breakpoints.dart';

class KeyFeaturesSection extends StatelessWidget {
  const KeyFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = !isMobileLayout(context);

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
            'KEY FEATURES',
            style: TextStyle(
              color: Colors.white,
              fontSize: isDesktop ? 28 : 22,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          SizedBox(height: isDesktop ? 50 : 32),
          isDesktop
              ? const Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _FeatureCard(title: 'CLEAR ERRORS', subTitle: 'Instantly read, decode, and clear vehicle trouble codes without mechanic help.', icon: Icons.gpp_good_outlined)),
                    SizedBox(width: 16),
                    Expanded(child: _FeatureCard(title: 'EXPORT REPORTS', subTitle: 'Generate and share comprehensive PDF summaries of your car health.', icon: Icons.assignment_outlined)),
                    SizedBox(width: 16),
                    Expanded(child: _FeatureCard(title: 'LIVE MONITORING', subTitle: 'Track critical engine parameters and sensor graphics in real time.', icon: Icons.speed_outlined)),
                    SizedBox(width: 16),
                    Expanded(child: _FeatureCard(title: 'OFFLINE AI', subTitle: 'Get autonomous diagnostic assistance powered by a built-in AI assistant.', icon: Icons.psychology_outlined)),
                  ],
                )
              : const Column(
                  children: [
                    _FeatureCard(title: 'CLEAR ERRORS', subTitle: 'Instantly read, decode, and clear vehicle trouble codes without mechanic help.', icon: Icons.gpp_good_outlined, isMobile: true),
                    SizedBox(height: 16),
                    _FeatureCard(title: 'EXPORT REPORTS', subTitle: 'Generate and share comprehensive PDF summaries of your car health.', icon: Icons.assignment_outlined, isMobile: true),
                    SizedBox(height: 16),
                    _FeatureCard(title: 'LIVE MONITORING', subTitle: 'Track critical engine parameters and sensor graphics in real time.', icon: Icons.speed_outlined, isMobile: true),
                    SizedBox(height: 16),
                    _FeatureCard(title: 'OFFLINE AI', subTitle: 'Get autonomous diagnostic assistance powered by a built-in AI assistant.', icon: Icons.psychology_outlined, isMobile: true),
                  ],
                ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final bool isMobile;

  const _FeatureCard({
    required this.title,
    required this.subTitle,
    required this.icon,
    this.isMobile = false,
  });

  @override
  State<_FeatureCard> createState() => _FeatureCardState();
}

class _FeatureCardState extends State<_FeatureCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        padding: EdgeInsets.symmetric(
          vertical: widget.isMobile ? 28 : 40,
          horizontal: 20,
        ),
        height: widget.isMobile ? null : 280,
        width: widget.isMobile ? double.infinity : 512,
        decoration: BoxDecoration(
          color: _isHovered ? AppColors.featureHovered : AppColors.featureUnhovered,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.background.withAlpha(70) : const Color(0xFF67707F),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              widget.icon,
              size: widget.isMobile ? 40 : 48,
              color: Colors.white.withOpacity(_isHovered ? 0.9 : 0.6),
            ),
            SizedBox(height: widget.isMobile ? 16 : 24),
            Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 0.8,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              widget.subTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
