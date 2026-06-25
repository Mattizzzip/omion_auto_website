import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import 'scroll_utils.dart';

class NavMenuButton extends StatefulWidget {
  final String title;
  final GlobalKey targetKey;
  final VoidCallback? onNavigate;
  final bool isExpanded;
  final BorderRadius borderRadius;

  const NavMenuButton({
    super.key,
    required this.title,
    required this.targetKey,
    this.onNavigate,
    this.isExpanded = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(16)),
  });

  @override
  State<NavMenuButton> createState() => _NavMenuButtonState();
}

class _NavMenuButtonState extends State<NavMenuButton> {
  // Флаг для отслеживания наведения мыши
  bool _isHovered = false;

  void _scrollToSection() {
    widget.onNavigate?.call();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollToKey(widget.targetKey);
    });
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
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
          width: widget.isExpanded ? double.infinity : null,
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          decoration: BoxDecoration(
            color: _isHovered ? AppColors.lightStyle : AppColors.background,
            borderRadius: widget.borderRadius,
          ),
          child: Text(
            widget.title,
            textAlign: widget.isExpanded ? TextAlign.left : TextAlign.center,
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
