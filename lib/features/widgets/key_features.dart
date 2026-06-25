import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class KeyFeaturesSection extends StatelessWidget {
  const KeyFeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isDesktop = screenWidth > 950; // Порог для переноса в мобильный вид

    return TweenAnimationBuilder<double>(
      tween: Tween<double>(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 1000),
      curve: Curves.easeOutCubic,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, 40 * (1 - value)), // Анимация появления снизу вверх
            child: child,
          ),
        );
      },
      child: Column(
        children: [
          // Главный заголовок блока
          const Text(
            'KEY FEATURES',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          const SizedBox(height: 50),

          // Ряд из 4 карточек для ПК или вертикальный список для мобильных
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
              : Column(
            children: [
              const _FeatureCard(title: 'CLEAR ERRORS', subTitle: 'Instantly read, decode, and clear vehicle trouble codes without mechanic help.', icon: Icons.gpp_good_outlined),
              const SizedBox(height: 16),
              const _FeatureCard(title: 'EXPORT REPORTS', subTitle: 'Generate and share comprehensive PDF summaries of your car health.', icon: Icons.assignment_outlined),
              const SizedBox(height: 16),
              const _FeatureCard(title: 'LIVE MONITORING', subTitle: 'Track critical engine parameters and sensor graphics in real time.', icon: Icons.speed_outlined),
              const SizedBox(height: 16),
              const _FeatureCard(title: 'OFFLINE AI', subTitle: 'Get autonomous diagnostic assistance powered by a built-in AI assistant.', icon: Icons.psychology_outlined),
            ],
          ),
        ],
      ),
    );
  }
}

/// Приватный виджет интерактивной карточки преимущества с эффектом Hover
class _FeatureCard extends StatefulWidget {
  final String title;
  final String subTitle;
  final IconData icon;

  const _FeatureCard({
    required this.title,
    required this.subTitle,
    required this.icon,
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
        padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
        height: 280,
        width: 512,// Фиксированная высота для выравнивания карточек в ряду
        decoration: BoxDecoration(
          // При наведении карточка окрашивается в цвет кнопок навигации, иначе остается полупрозрачной
          color: _isHovered ? AppColors.featureHovered : AppColors.featureUnhovered,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered ? AppColors.background.withAlpha(70) : Color(0xFF67707F),
            width: 1,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Центрирование контента как на макете
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Верхняя иконка
            Icon(
              widget.icon,
              size: 48,
              color: Colors.white.withOpacity(_isHovered ? 0.9 : 0.6), // Иконка становится ярче при наведении
            ),
            const SizedBox(height: 24),
            // Заголовок карточки
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
            // Краткое описание фишки
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
