import 'package:flutter/material.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';

import '../theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const _email = 'info@offlience.com';
  static const _emailGold = Color(0xFFC9A227);

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final l10n = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
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
        const SizedBox(height: 32),
        const StoreBadgesRow(),
        const SizedBox(height: 40),
        if (isMobile)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ContactsColumn(emailGold: _emailGold, email: _email),
              const SizedBox(height: 28),
              const _LegalCard(),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _ContactsColumn(emailGold: _emailGold, email: _email),
              ),
              const SizedBox(width: 32),
              const Expanded(child: _LegalCard()),
            ],
          ),
        const SizedBox(height: 36),
        Divider(color: AppColors.lightStyle.withValues(alpha: 0.18), height: 1),
        const SizedBox(height: 20),
        Text(
          l10n.footerCopyright,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColors.lightStyle.withValues(alpha: 0.55),
            fontSize: 13,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
      ],
    );
  }
}

class _ContactsColumn extends StatelessWidget {
  final Color emailGold;
  final String email;

  const _ContactsColumn({
    required this.emailGold,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.footerContacts,
          style: const TextStyle(
            color: AppColors.lightStyle,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          l10n.footerEmail,
          style: TextStyle(
            color: AppColors.lightStyle.withValues(alpha: 0.55),
            fontSize: 13,
          ),
        ),
        const SizedBox(height: 6),
        _HoverLink(
          text: email,
          color: emailGold,
          decorationColor: emailGold.withValues(alpha: 0.7),
          fontSize: 15,
          fontWeight: FontWeight.w500,
          onTap: () => openExternalUrl('mailto:$email'),
        ),
        const SizedBox(height: 28),
        _HoverLink(
          text: l10n.footerPrivacyPolicy,
          color: AppColors.lightStyle.withValues(alpha: 0.75),
          decorationColor: AppColors.lightStyle.withValues(alpha: 0.35),
          fontSize: 14,
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.privacyPolicy),
        ),
        const SizedBox(height: 12),
        _HoverLink(
          text: l10n.footerTerms,
          color: AppColors.lightStyle.withValues(alpha: 0.75),
          decorationColor: AppColors.lightStyle.withValues(alpha: 0.35),
          fontSize: 14,
          onTap: () =>
              Navigator.of(context).pushNamed(AppRoutes.termsOfService),
        ),
      ],
    );
  }
}

class _LegalCard extends StatelessWidget {
  const _LegalCard();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l10n.footerEntrepreneur,
            style: const TextStyle(
              color: AppColors.lightStyle,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          const SizedBox(height: 20),
          _LegalField(
            label: l10n.footerBusinessId,
            value: '302373429',
          ),
          const SizedBox(height: 16),
          _LegalField(
            label: l10n.footerCountry,
            value: l10n.footerCountryValue,
          ),
          const SizedBox(height: 16),
          _LegalField(
            label: l10n.footerAddress,
            value: l10n.footerAddressValue,
          ),
        ],
      ),
    );
  }
}

class _LegalField extends StatelessWidget {
  final String label;
  final String value;

  const _LegalField({
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: AppColors.lightStyle.withValues(alpha: 0.5),
            fontSize: 12,
            height: 1.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.lightStyle,
            fontSize: 14,
            height: 1.45,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _HoverLink extends StatefulWidget {
  final String text;
  final Color color;
  final Color decorationColor;
  final double fontSize;
  final FontWeight fontWeight;
  final VoidCallback onTap;

  const _HoverLink({
    required this.text,
    required this.color,
    required this.decorationColor,
    required this.fontSize,
    this.fontWeight = FontWeight.w400,
    required this.onTap,
  });

  @override
  State<_HoverLink> createState() => _HoverLinkState();
}

class _HoverLinkState extends State<_HoverLink> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 150),
          opacity: _hovered ? 1.0 : 0.85,
          child: Text(
            widget.text,
            style: TextStyle(
              color: widget.color,
              fontSize: widget.fontSize,
              fontWeight: widget.fontWeight,
              decoration: TextDecoration.underline,
              decorationColor: widget.decorationColor,
              height: 1.3,
            ),
          ),
        ),
      ),
    );
  }
}
