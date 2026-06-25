import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/breakpoints.dart';
import 'error_cards_stack.dart';

class ErrorCardsSection extends StatefulWidget {
  const ErrorCardsSection({super.key});

  @override
  State<ErrorCardsSection> createState() => _ErrorCardsSectionState();
}

class _ErrorCardsSectionState extends State<ErrorCardsSection> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _textFadeAnimation;
  late Animation<double> _stackAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    _textFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.4, curve: Curves.easeOut),
      ),
    );

    // Анимация развертывания / наслоения колоды карт
    _stackAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.2, 1.0, curve: Curves.elasticOut), // Мягкий пружинящий эффект появления
      ),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final bool isDesktop = !isMobileLayout(context);
        final titleSize = isDesktop ? 40.0 : 26.0;
        final bodySize = isDesktop ? 16.0 : 15.0;

        // Текст на английском согласно стандартам OBD II
        Widget textContent = FadeTransition(
          opacity: _textFadeAnimation,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Built-In OBD II Fault Code Directory',
                style: TextStyle(
                  color: AppColors.lightStyle,
                  fontSize: titleSize,
                  fontWeight: FontWeight.bold,
                  height: 1.2,
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 24),
              Text(
                'Never guess what a Check Engine light means again. Our built-in database is fully compliant with universal OBD II standards, containing thousands of diagnostic trouble codes.',
                style: TextStyle(
                  color: AppColors.lightStyle.withAlpha(128),
                  fontSize: bodySize,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Instantly lookup powertrain (P), body (B), chassis (C), and network (U) codes directly on your device. Get clear, professional-grade descriptions and immediate mechanical insights.',
                style: TextStyle(
                  color: AppColors.lightStyle.withAlpha(128),
                  fontSize: bodySize,
                  height: 1.5,
                ),
              ),
            ],
          ),
        );

        Widget cardsContent = ErrorCardsStack(animationProgress: _stackAnimation);

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: isDesktop ? 40 : 0,
            vertical: isDesktop ? 80 : 32,
          ),
          child: isDesktop
              ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 4, child: Center(child: cardsContent)),
              const SizedBox(width: 60),
              Expanded(flex: 5, child: textContent),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textContent,
              const SizedBox(height: 60),
              Center(child: cardsContent),
            ],
          ),
        );
      },
    );
  }
}
