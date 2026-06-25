import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/breakpoints.dart';

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
    final isMobile = isMobileLayout(context);
    final badgeHeight = isMobile ? 36.0 : 40.0;

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 8,
      runSpacing: 8,
      children: [
        _StoreSvgButton(
          assetPath: 'assets/icons/download_on_the_app_store_badge.svg',
          height: badgeHeight,
          onTap: onAppStoreTap,
        ),
        _StoreSvgButton(
          assetPath: 'assets/icons/google_play_store_badge.svg',
          height: badgeHeight,
          onTap: onGooglePlayTap,
        ),
      ],
    );
  }
}

class _StoreSvgButton extends StatelessWidget {
  final String assetPath;
  final double height;
  final VoidCallback? onTap;

  const _StoreSvgButton({
    required this.assetPath,
    required this.height,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
              opacity: hovered ? 0.8 : 1.0,
              child: child,
            );
          },
          child: SvgPicture.asset(
            assetPath,
            height: height,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
