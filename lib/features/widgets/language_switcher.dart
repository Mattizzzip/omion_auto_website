import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';
import 'package:omion_auto_website/l10n/locale_controller.dart';

class LanguageSwitcher extends StatelessWidget {
  final bool compact;

  const LanguageSwitcher({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final controller = LocaleScope.of(context);
    final isRu = locale.languageCode == 'ru';

    return Semantics(
      label: l10n.languageSwitcherLabel,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.lightStyle.withValues(alpha: 0.28),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _LangOption(
              label: 'EN',
              selected: !isRu,
              compact: compact,
              onTap: () => controller.setLocale(const Locale('en')),
            ),
            _LangOption(
              label: 'RU',
              selected: isRu,
              compact: compact,
              onTap: () => controller.setLocale(const Locale('ru')),
            ),
          ],
        ),
      ),
    );
  }
}

class _LangOption extends StatelessWidget {
  final String label;
  final bool selected;
  final bool compact;
  final VoidCallback onTap;

  const _LangOption({
    required this.label,
    required this.selected,
    required this.compact,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          curve: Curves.easeInOut,
          padding: EdgeInsets.symmetric(
            horizontal: compact ? 10 : 12,
            vertical: compact ? 5 : 6,
          ),
          decoration: BoxDecoration(
            color: selected ? AppColors.lightStyle : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            label,
            style: TextStyle(
              color: selected ? AppColors.background : AppColors.lightStyle,
              fontSize: compact ? 12 : 13,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
            ),
          ),
        ),
      ),
    );
  }
}
