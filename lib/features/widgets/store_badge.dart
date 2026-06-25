import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class StoreBadgesRow extends StatelessWidget {
  final VoidCallback? onAppStoreTap;
  final VoidCallback? onGooglePlayTap;

  const StoreBadgesRow({
    super.key,
    this.onAppStoreTap,
    this.onGooglePlayTap,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Занимает ровно столько места, сколько нужно кнопкам
      children: [
        // Кнопка App Store
        _StoreSvgButton(
          assetPath: 'assets/icons/download_on_the_app_store_badge.svg',
          onTap: onAppStoreTap,
        ),
        const SizedBox(width: 8), // Заданный вами отступ
        // Кнопка Google Play
        _StoreSvgButton(
          assetPath: 'assets/icons/google_play_store_badge.svg',
          onTap: onGooglePlayTap,
        ),
      ],
    );
  }
}

/// Приватный вспомогательный виджет для одной SVG-кнопки
class _StoreSvgButton extends StatelessWidget {
  final String assetPath;
  final VoidCallback? onTap;

  const _StoreSvgButton({
    required this.assetPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // Локальный трекер состояния наведения мыши
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
              opacity: hovered ? 0.8 : 1.0, // Мягкое изменение прозрачности
              child: child,
            );
          },
          child: SvgPicture.asset(
            assetPath,
            height: 40, // Стандартная высота для аккуратных кнопок в вебе
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
