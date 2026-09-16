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
        LegalSection(
          heading: l10n.termsS7Heading,
          body: [
            legalBoldLead(l10n.termsS7PremiumLead, l10n.termsS7PremiumRest),
            legalBoldLead(l10n.termsS7ProductsLead, l10n.termsS7ProductsRest),
            legalBullet(l10n.termsS7ProductBullet1),
            legalBullet(l10n.termsS7ProductBullet2),
            legalParagraph(l10n.termsS7ProductNames),
            legalBoldLead(l10n.termsS7BillingLead, l10n.termsS7BillingRest),
            legalBoldLead(
              l10n.termsS7AutoRenewLead,
              l10n.termsS7AutoRenewRest,
            ),
            legalBoldLead(l10n.termsS7LifetimeLead, l10n.termsS7LifetimeRest),
            legalBoldLead(l10n.termsS7RestoreLead, l10n.termsS7RestoreRest),
            legalBoldLead(l10n.termsS7RefundsLead, l10n.termsS7RefundsRest),
            legalBoldLead(l10n.termsS7NoProLead, l10n.termsS7NoProRest),
            legalBoldLead(l10n.termsS7LegacyLead, l10n.termsS7LegacyRest),
            TextSpan(text: l10n.termsS7PrivacyBefore),
            legalLink(l10n.termsS7PrivacyLink, kPrivacyPolicyUrl),
            const TextSpan(text: '\n'),
          ],
        ),
      ],
    );
  }
}
