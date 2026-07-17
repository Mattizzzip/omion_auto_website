import 'package:flutter/material.dart';
import 'package:omion_auto_website/app_routes.dart';
import 'package:omion_auto_website/features/theme/app_colors.dart';
import 'package:omion_auto_website/features/theme/breakpoints.dart';
import 'package:url_launcher/url_launcher.dart';

const kGemmaTermsUrl = 'https://ai.google.dev/gemma/terms';
const kHuggingFaceTermsUrl = 'https://huggingface.co/terms-of-service';
const kHuggingFacePrivacyUrl = 'https://huggingface.co/privacy';

Future<void> openExternalUrl(String url) async {
  final uri = Uri.parse(url);
  await launchUrl(uri, mode: LaunchMode.externalApplication);
}

class LegalSection {
  final String heading;
  final List<InlineSpan> body;

  const LegalSection({
    required this.heading,
    required this.body,
  });
}

class LegalPage extends StatelessWidget {
  final String title;
  final String lastUpdated;
  final List<LegalSection> sections;

  const LegalPage({
    super.key,
    required this.title,
    required this.lastUpdated,
    required this.sections,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);
    final maxWidth = isMobile ? double.infinity : 820.0;
    final titleSize = isMobile ? 28.0 : 36.0;
    final horizontal = isMobile ? 20.0 : 24.0;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.lightStyle),
          onPressed: () {
            final navigator = Navigator.of(context);
            if (navigator.canPop()) {
              navigator.pop();
            } else {
              navigator.pushReplacementNamed(AppRoutes.home);
            }
          },
        ),
        title: Text(
          title,
          style: const TextStyle(
            color: AppColors.lightStyle,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SelectionArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(horizontal, 8, horizontal, 48),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.lightStyle,
                      fontSize: titleSize,
                      fontWeight: FontWeight.bold,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'Last Updated: $lastUpdated',
                    style: TextStyle(
                      color: AppColors.lightStyle.withValues(alpha: 0.55),
                      fontSize: 14,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const SizedBox(height: 32),
                  for (var i = 0; i < sections.length; i++) ...[
                    if (i > 0) const SizedBox(height: 28),
                    Text(
                      sections[i].heading,
                      style: const TextStyle(
                        color: AppColors.lightStyle,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text.rich(
                      TextSpan(
                        style: TextStyle(
                          color: AppColors.lightStyle.withValues(alpha: 0.88),
                          fontSize: 16,
                          height: 1.6,
                        ),
                        children: sections[i].body,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InlineSpan legalParagraph(String text) => TextSpan(text: '$text\n\n');

InlineSpan legalBoldLead(String lead, String rest) {
  return TextSpan(
    children: [
      TextSpan(
        text: lead,
        style: const TextStyle(fontWeight: FontWeight.w700),
      ),
      TextSpan(text: ' $rest\n\n'),
    ],
  );
}

InlineSpan legalBullet(String text) => TextSpan(text: '• $text\n');

InlineSpan legalLink(String label, String url) {
  return WidgetSpan(
    alignment: PlaceholderAlignment.baseline,
    baseline: TextBaseline.alphabetic,
    child: MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => openExternalUrl(url),
        child: Text(
          label,
          style: const TextStyle(
            color: AppColors.chartBlue,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.chartBlue,
            fontSize: 16,
            height: 1.6,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}
