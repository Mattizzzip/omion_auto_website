import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';

class TermsOfServicePage extends StatelessWidget {
  const TermsOfServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LegalPage(
      title: 'Terms of Service',
      lastUpdated: 'July 16, 2026',
      sections: [
        LegalSection(
          heading: '1. Acceptance of Terms',
          body: [
            legalParagraph(
              'By downloading, installing, or using this application (the "App"), you agree to be bound by these Terms of Service. If you do not agree to these terms, do not use the App.',
            ),
          ],
        ),
        LegalSection(
          heading: '2. Description of Service',
          body: [
            legalParagraph(
              'The App provides vehicle diagnostic tools using the OBD II protocol. To analyze data, the App utilizes local, untrained open-weight Artificial Intelligence models (Gemma 2b and Gemma 4b) downloaded directly from Hugging Face.',
            ),
          ],
        ),
        LegalSection(
          heading: '3. App Operation & Internet Requirements',
          body: [
            legalBoldLead(
              'Local Operation:',
              'The core vehicle diagnostics and AI analysis perform entirely offline and locally on your device.',
            ),
            legalBoldLead(
              'Internet Connection:',
              'An active internet connection is strictly required only for:',
            ),
            legalBullet(
              'Downloading the AI model weights from Hugging Face upon the initial setup or required updates.',
            ),
            legalBullet(
              'Sending messages through the built-in Feedback Form.',
            ),
          ],
        ),
        LegalSection(
          heading: '4. Third-Party Licenses (Gemma Models)',
          body: [
            const TextSpan(
              text:
                  'The App utilizes Gemma models provided by Google LLC. By using this App, you also acknowledge and agree to comply with the ',
            ),
            legalLink('Google Gemma Terms of Use', kGemmaTermsUrl),
            const TextSpan(
              text:
                  '. Downloading these models is governed by ',
            ),
            legalLink('Hugging Face’s Terms of Service', kHuggingFaceTermsUrl),
            const TextSpan(text: '.\n\n'),
          ],
        ),
        LegalSection(
          heading: '5. Disclaimer of Warranties & Limitation of Liability',
          body: [
            legalBoldLead(
              'For Informational Purposes Only:',
              'The App is a diagnostic support tool and does not replace professional vehicle maintenance, repair, or expert inspection.',
            ),
            legalBoldLead(
              'Use At Your Own Risk:',
              'The developer is not liable for any damage to your vehicle, your OBD II scanning hardware, or any accidents/safety hazards resulting from or related to the use of the App.',
            ),
            legalParagraph(
              'The App is provided on an "AS IS" and "AS AVAILABLE" basis without warranties of any kind.',
            ),
          ],
        ),
        LegalSection(
          heading: '6. Governing Law and Dispute Resolution',
          body: [
            legalParagraph(
              'These Terms of Service and any separate agreements shall be governed by, and construed in accordance with, the laws of Georgia, without regard to its conflict of law principles. Any legal action, suit, or proceeding arising out of or relating to these Terms or the use of the App shall be instituted exclusively in the competent courts of Tbilisi, Georgia.',
            ),
          ],
        ),
      ],
    );
  }
}
