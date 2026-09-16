import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';
import 'package:omion_auto_website/l10n/app_localizations.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return LegalPage(
      title: l10n.privacyTitle,
      lastUpdated: l10n.privacyLastUpdated,
      sections: [
        LegalSection(
          heading: l10n.privacyS1Heading,
          body: [
            legalParagraph(l10n.privacyS1Intro),
            legalBoldLead(
              l10n.privacyS1FeedbackLead,
              l10n.privacyS1FeedbackRest,
            ),
            TextSpan(
              children: [
                TextSpan(
                  text: l10n.privacyS1NetworkLead,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: l10n.privacyS1NetworkRest),
              ],
            ),
            legalLink(l10n.privacyS1PrivacyPolicyLink, kHuggingFacePrivacyUrl),
            const TextSpan(text: '.\n\n'),
          ],
        ),
        LegalSection(
          heading: l10n.privacyS2Heading,
          body: [
            legalBoldLead(
              l10n.privacyS2NoDiagLead,
              l10n.privacyS2NoDiagRest,
            ),
            legalBoldLead(
              l10n.privacyS2NoAiLead,
              l10n.privacyS2NoAiRest,
            ),
            legalBoldLead(
              l10n.privacyS2NoAnalyticsLead,
              l10n.privacyS2NoAnalyticsRest,
            ),
          ],
        ),
        LegalSection(
          heading: l10n.privacyS3Heading,
          body: [
            TextSpan(text: l10n.privacyS3Intro),
            legalBullet(l10n.privacyS3Bullet1),
            legalBullet(l10n.privacyS3Bullet2),
            legalBullet(l10n.privacyS3Bullet3),
          ],
        ),
        LegalSection(
          heading: l10n.privacyS4Heading,
          body: [
            legalParagraph(l10n.privacyS4NoSell),
            TextSpan(
              children: [
                TextSpan(
                  text: l10n.privacyS4HfLead,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(text: l10n.privacyS4HfRest),
              ],
            ),
            legalLink(l10n.privacyS4HfLink, kHuggingFacePrivacyUrl),
            TextSpan(text: l10n.privacyS4HfAfter),
          ],
        ),
        LegalSection(
          heading: l10n.privacyS5Heading,
          body: [
            legalParagraph(l10n.privacyS5Body),
          ],
        ),
      ],
    );
  }
}
