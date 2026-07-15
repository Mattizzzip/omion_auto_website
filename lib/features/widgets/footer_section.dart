import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';

import '../theme/app_colors.dart';
// Импортируйте ваш созданный ранее виджет с кнопками сторов
// import 'package:your_project/components/store_badges_row.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [

          // Разделительная тонкая линия с плавным проявлением к центру
          Container(
            width: double.infinity,
            height: 2, // Фиксированная толщина в 1 пиксель
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.lightStyle.withAlpha(0),  // Полностью прозрачный левый край
                  AppColors.lightStyle.withAlpha(95), // Видимый полупрозрачный центр
                  AppColors.lightStyle.withAlpha(0),  // Полностью прозрачный правый край
                ],
                // Направление градиента слева направо
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
          ),
          const SizedBox(height: 24),
          // 1. Фирменные кнопки сторов (наш кастомный Stateless-виджет)
          // Если используете заглушку, можно временно оставить пустые колбэки
          const StoreBadgesRow(
            onAppStoreTap: null,
            onGooglePlayTap: null,
          ),
          const SizedBox(height: 32),

          // 2. Строка копирайта с актуальным годом
          const Text(
            '© 2026 OBDvia AI. All rights reserved.',
            style: TextStyle(
              color: Colors.white60,
              fontSize: 14,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 16),

          // 3. Блок с юридическими ссылками
          Wrap(
            spacing: 24.0, // Отступ между кнопками по горизонтали
            runSpacing: 12.0, // Отступ при переносе на мобильных экранах
            alignment: WrapAlignment.center,
            children: [
              _buildFooterLink(
                text: 'Privacy Policy',
                onTap: () {
                  // Будущий переход на страницу политики конфиденциальности
                  print('Navigate to Privacy Policy');
                },
              ),
              _buildFooterLink(
                text: 'Terms of Use',
                onTap: () {
                  // Будущий переход на страницу пользовательского соглашения
                  print('Navigate to Terms of Use');
                },
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
