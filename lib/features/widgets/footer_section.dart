import 'package:flutter/material.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:omion_auto_website/features/widgets/store_badge.dart';

import '../theme/app_colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  static const _email = 'info@offlience.com';
  static const _emailGold = Color(0xFFC9A227);

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);

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
        const StoreBadgesRow(
          onAppStoreTap: null,
          onGooglePlayTap: null,
        ),
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
          '© 2026 ANDREI OSIPAU. All rights reserved.',
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contacts',
          style: TextStyle(
            color: AppColors.lightStyle,
            fontSize: 28,
            fontWeight: FontWeight.w700,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 20),
        Text(
          'Email',
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
          text: 'Privacy Policy',
          color: AppColors.lightStyle.withValues(alpha: 0.75),
          decorationColor: AppColors.lightStyle.withValues(alpha: 0.35),
          fontSize: 14,
          onTap: () => Navigator.of(context).pushNamed(AppRoutes.privacyPolicy),
        ),
        const SizedBox(height: 12),
        _HoverLink(
          text: 'Terms of Service / EULA',
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
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Individual Entrepreneur ANDREI OSIPAU',
            style: TextStyle(
              color: AppColors.lightStyle,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              height: 1.35,
            ),
          ),
          SizedBox(height: 20),
          _LegalField(
            label: 'Business ID / Tax Number',
            value: '302373429',
          ),
          SizedBox(height: 16),
          _LegalField(
            label: 'Country of Registration',
            value: 'Georgia',
          ),
          SizedBox(height: 16),
          _LegalField(
            label: 'Legal Registration Address',
            value:
                'Georgia, Tbilisi city, Chugureti district, Tsotne Dadiani street N 7, commercial space Nb229, floor 2',
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
