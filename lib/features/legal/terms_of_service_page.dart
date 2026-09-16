import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LegalPage(
      title: l10n.termsTitle,
      lastUpdated: l10n.termsLastUpdated,
      sections: [
        LegalSection(
          heading: l10n.termsS1Heading,
          body: [
            legalParagraph(l10n.termsS1Body),
          ],
        ),
        LegalSection(
          heading: l10n.termsS2Heading,
          body: [
            legalParagraph(l10n.termsS2Body),
          ],
        ),
        LegalSection(
          heading: l10n.termsS3Heading,
          body: [
            legalBoldLead(
              l10n.termsS3LocalLead,
              l10n.termsS3LocalRest,
            ),
            legalBoldLead(
              l10n.termsS3InternetLead,
              l10n.termsS3InternetRest,
            ),
            legalBullet(l10n.termsS3Bullet1),
            legalBullet(l10n.termsS3Bullet2),
          ],
        ),
        LegalSection(
          heading: l10n.termsS4Heading,
          body: [
            TextSpan(text: l10n.termsS4BeforeGemma),
            legalLink(l10n.termsS4GemmaLink, kGemmaTermsUrl),
            TextSpan(text: l10n.termsS4Between),
            legalLink(l10n.termsS4HfLink, kHuggingFaceTermsUrl),
            const TextSpan(text: '.\n\n'),
          ],
        ),
        LegalSection(
          heading: l10n.termsS5Heading,
          body: [
            legalBoldLead(
              l10n.termsS5InfoLead,
              l10n.termsS5InfoRest,
            ),
            legalBoldLead(
              l10n.termsS5RiskLead,
              l10n.termsS5RiskRest,
            ),
            legalParagraph(l10n.termsS5AsIs),
          ],
        ),
        LegalSection(
          heading: l10n.termsS6Heading,
          body: [
            legalParagraph(l10n.termsS6Body),
          ],
        ),
      ],
    );
  }
}
