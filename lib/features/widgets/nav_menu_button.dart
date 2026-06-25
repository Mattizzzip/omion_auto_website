import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

class NavMenuButton extends StatefulWidget {
  final String title;
  final GlobalKey targetKey;

  const NavMenuButton({
    super.key,
    required this.title,
    required this.targetKey,
  });

  @override
  State<NavMenuButton> createState() => _NavMenuButtonState();
}

class _NavMenuButtonState extends State<NavMenuButton> {
  // Флаг для отслеживания наведения мыши
  bool _isHovered = false;

  void _scrollToSection() {
    final context = widget.targetKey.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      // Перехватываем вход и выход курсора из зоны кнопки
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      cursor: SystemMouseCursors.click, // Меняем курсор на "пальчик" при наведении
      child: GestureDetector(
        onTap: _scrollToSection,
        child: AnimatedContainer(
          // Длительность и кривая плавной анимации цвета
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            // Динамически меняем цвет в зависимости от состояния
            color: _isHovered ? AppColors.lightStyle : AppColors.background,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Text(
            widget.title,
            style: TextStyle(
              color: _isHovered ? AppColors.background : AppColors.lightStyle,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
