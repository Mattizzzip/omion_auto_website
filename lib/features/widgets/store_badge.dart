import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';

import '../theme/breakpoints.dart';

const kAppStoreUrl =
    'https://apps.apple.com/us/app/obdvia-ai-smart-car-scanning/id6791101467';

const kAppGalleryUrl = 'https://appgallery.huawei.ru/app/C118696683';

class StoreBadgesRow extends StatelessWidget {
  final VoidCallback? onAppStoreTap;
  final VoidCallback? onAppGalleryTap;

  const StoreBadgesRow({
    super.key,
    this.onAppStoreTap,
    this.onAppGalleryTap,
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
          onTap: onAppStoreTap ?? () => openExternalUrl(kAppStoreUrl),
        ),
        _StoreSvgButton(
          assetPath: 'assets/icons/explore_it_on_appgallery_badge.svg',
          height: badgeHeight,
          onTap: onAppGalleryTap ?? () => openExternalUrl(kAppGalleryUrl),
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
