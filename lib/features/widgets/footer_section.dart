import 'package:flutter/material.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';

import '../theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lightStyle.withAlpha(0),
                  AppColors.lightStyle.withAlpha(95),
                  AppColors.lightStyle.withAlpha(0),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 24),
          const StoreBadgesRow(
            onAppStoreTap: null,
            onGooglePlayTap: null,
          ),
          const SizedBox(height: 32),
          const Text(
            '© 2026 OBDvia AI. All rights reserved.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 24.0,
            runSpacing: 12.0,
            alignment: WrapAlignment.center,
            children: [
              _buildFooterLink(
                text: 'Privacy Policy',
                onTap: () => Navigator.of(context).pushNamed(
                  AppRoutes.privacyPolicy,
                ),
              ),
              _buildFooterLink(
                text: 'Terms of Use',
                onTap: () => Navigator.of(context).pushNamed(
                  AppRoutes.termsOfService,
                ),
              ),
            ],
          ),
        ],
      );
  }

  // Вспомогательный метод для интерактивных текстовых кнопок в футере
  Widget _buildFooterLink({required String text, required VoidCallback onTap}) {
    final ValueNotifier<bool> isHovered = ValueNotifier<bool>(false);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => isHovered.value = true,
      onExit: (_) => isHovered.value = false,
      child: GestureDetector(
        onTap: onTap,
        child: ValueListenableBuilder<bool>(
          valueListenable: isHovered,
          builder: (context, hovered, child) {
            return AnimatedOpacity(
              duration: const Duration(milliseconds: 150),
              // Текст плавно становится ярче при наведении курсора
              opacity: hovered ? 1.0 : 0.45,
              child: child,
            );
          },
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline, // Подчеркивание ссылки
              decorationColor: Colors.white24,       // Цвет линии подчеркивания
            ),
          ),
        ),
      ),
    );
  }
}
