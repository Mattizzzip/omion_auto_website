import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/nav_menu_button.dart';
import 'package:omion_auto_website/features/widgets/scroll_utils.dart';

class DefaultAppbar extends StatefulWidget implements PreferredSizeWidget {
  final ScrollController scrollController;
  final GlobalKey homeKey;
  final GlobalKey downloadKey;
  final GlobalKey howItWorksKey;
  final GlobalKey featuresKey;
  final GlobalKey footerKey;

  const DefaultAppbar({
    super.key,
    required this.scrollController,
    required this.homeKey,
    required this.downloadKey,
    required this.howItWorksKey,
    required this.featuresKey,
    required this.footerKey,
  });

  @override
  State<DefaultAppbar> createState() => _DefaultAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DefaultAppbarState extends State<DefaultAppbar> with SingleTickerProviderStateMixin {
  final _burgerKey = GlobalKey();
  OverlayEntry? _menuOverlay;
  late final AnimationController _menuController;
  late final Animation<double> _menuFade;
  late final Animation<Offset> _menuSlide;

  @override
  void initState() {
    super.initState();
    _menuController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 220),
    );
    _menuFade = CurvedAnimation(parent: _menuController, curve: Curves.easeOut);
    _menuSlide = Tween<Offset>(
      begin: const Offset(0, -0.08),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _menuController, curve: Curves.easeOutCubic));
  }

  @override
  void dispose() {
    _removeMenuOverlay();
    _menuController.dispose();
    super.dispose();
  }

  void _scrollToHome() {
    scrollToKey(widget.homeKey);
  }

  void _toggleMobileMenu() {
    if (_menuOverlay != null) {
      _closeMobileMenu();
    } else {
      _openMobileMenu();
    }
  }

  void _openMobileMenu() {
    final burgerContext = _burgerKey.currentContext;
    final renderBox = burgerContext?.findRenderObject() as RenderBox?;
    if (renderBox == null || !mounted) return;

    final overlay = Overlay.of(context);
    final burgerTopLeft = renderBox.localToGlobal(Offset.zero);
    final burgerSize = renderBox.size;
    final screenWidth = MediaQuery.sizeOf(context).width;
    const menuWidth = 220.0;

    final menuLeft = (burgerTopLeft.dx + burgerSize.width - menuWidth)
        .clamp(8.0, screenWidth - menuWidth - 8);
    final menuTop = burgerTopLeft.dy + burgerSize.height + 4;

    _menuController.forward(from: 0);
    _menuOverlay = OverlayEntry(
      builder: (context) {
        return Stack(
          children: [
            Positioned.fill(
              child: GestureDetector(
                onTap: _closeMobileMenu,
                child: Container(color: Colors.black.withValues(alpha: 0.25)),
              ),
            ),
            Positioned(
              left: menuLeft,
              top: menuTop,
              width: menuWidth,
              child: SlideTransition(
                position: _menuSlide,
                child: FadeTransition(
                  opacity: _menuFade,
                  child: Material(
                    color: AppColors.background,
                    elevation: 8,
                    shadowColor: Colors.black.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(16),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NavMenuButton(
                          title: 'How it works',
                          targetKey: widget.howItWorksKey,
                          onNavigate: _closeMobileMenu,
                          isExpanded: true,
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        NavMenuButton(
                          title: 'Features',
                          targetKey: widget.featuresKey,
                          onNavigate: _closeMobileMenu,
                          isExpanded: true,
                          borderRadius: BorderRadius.zero,
                        ),
                        NavMenuButton(
                          title: 'Contacts',
                          targetKey: widget.footerKey,
                          onNavigate: _closeMobileMenu,
                          isExpanded: true,
                          borderRadius: BorderRadius.zero,
                        ),
                        NavMenuButton(
                          title: 'Download',
                          targetKey: widget.downloadKey,
                          onNavigate: _closeMobileMenu,
                          isExpanded: true,
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(16),
                            bottomRight: Radius.circular(16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );

    overlay.insert(_menuOverlay!);
    setState(() {});
  }

  Future<void> _closeMobileMenu() async {
    if (_menuOverlay == null) return;
    await _menuController.reverse();
    _removeMenuOverlay();
    if (mounted) setState(() {});
  }

  void _removeMenuOverlay() {
    _menuOverlay?.remove();
    _menuOverlay = null;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final isMenuOpen = _menuOverlay != null;

    return AppBar(
      backgroundColor: AppColors.background,
      elevation: 0,
      scrolledUnderElevation: 0,
      title: Padding(
        padding: EdgeInsets.symmetric(horizontal: isMobile ? 0 : 20),
        child: Row(
          children: [
            GestureDetector(
              onTap: _scrollToHome,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SvgPicture.asset(
                      'icons/mini_car.svg',
                      width: isMobile ? 40 : 64,
                    ),
                    const SizedBox(width: 10),
                    Text(
                      'OBDvia AI',
                      style: TextStyle(
                        color: AppColors.lightStyle,
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            if (isMobile)
              IconButton(
                key: _burgerKey,
                icon: Icon(
                  isMenuOpen ? Icons.close : Icons.menu,
                  color: AppColors.lightStyle,
                ),
                onPressed: _toggleMobileMenu,
              )
            else ...[
              NavMenuButton(title: 'How it works', targetKey: widget.howItWorksKey),
              const SizedBox(width: 8),
              NavMenuButton(title: 'Features', targetKey: widget.featuresKey),
              const SizedBox(width: 8),
              NavMenuButton(title: 'Contacts', targetKey: widget.footerKey),
              const SizedBox(width: 8),
              NavMenuButton(title: 'Download', targetKey: widget.downloadKey),
            ],
          ],
        ),
      ),
    );
  }
}
