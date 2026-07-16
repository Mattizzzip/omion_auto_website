import 'package:flutter/material.dart';
import 'package:omion_auto_website/features/legal/legal_page.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LegalPage(
      title: 'Privacy Policy',
      lastUpdated: 'July 16, 2026',
      sections: [
        LegalSection(
          heading: '1. Information We Collect',
          body: [
            legalParagraph(
              'We are highly committed to user privacy. The App collects only the minimum necessary data required to provide specific requested features:',
            ),
            legalBoldLead(
              'Feedback Form Data:',
              'If you choose to contact us, we collect your name, email address, and the description of your idea, bug report, or improvement suggestion.',
            ),
            const TextSpan(
              children: [
                TextSpan(
                  text: 'Technical Network Requests:',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text:
                      ' When downloading AI models, your device connects directly to Hugging Face infrastructure. Your IP address and standard network logs may be processed by Hugging Face in accordance with their ',
                ),
              ],
            ),
            legalLink('privacy policy', kHuggingFacePrivacyUrl),
            const TextSpan(text: '.\n\n'),
          ],
        ),
        LegalSection(
          heading: '2. Data We DO NOT Collect (Zero-Data Privacy)',
          body: [
            legalBoldLead(
              'No Diagnostic Data Logging:',
              'All data read from your vehicle via the OBD II adapter is processed live and locally on your mobile device. We never transmit your vehicle diagnostics to external servers.',
            ),
            legalBoldLead(
              'No AI Query Logging:',
              'The Gemma 2b/4b models run entirely offline. Your inputs, prompts, and diagnostic analysis outcomes never leave your device.',
            ),
            legalBoldLead(
              'No Third-Party Analytics:',
              'We do not use tracking software, advertising identifiers, or third-party analytics SDKs (such as Firebase Analytics or Crashlytics). Your usage remains completely anonymous.',
            ),
          ],
        ),
        LegalSection(
          heading: '3. How We Use Your Information',
          body: [
            const TextSpan(
              text: 'Data submitted via the Feedback Form is used strictly to:\n',
            ),
            legalBullet('Respond to your support inquiries.'),
            legalBullet('Troubleshoot reported bugs and app crashes.'),
            legalBullet(
              'Implement user-requested features and application updates.',
            ),
          ],
        ),
        LegalSection(
          heading: '4. Data Sharing and Third Parties',
          body: [
            legalParagraph(
              'We do not sell, trade, rent, or share your personal data with third parties.',
            ),
            const TextSpan(
              children: [
                TextSpan(
                  text: 'Hugging Face:',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                TextSpan(
                  text:
                      ' Model downloading establishes a direct connection with Hugging Face. Please review the ',
                ),
              ],
            ),
            legalLink('Hugging Face Privacy Policy', kHuggingFacePrivacyUrl),
            const TextSpan(
              text: ' regarding how they handle asset downloads.\n\n',
            ),
          ],
        ),
        LegalSection(
          heading: '5. Data Security',
          body: [
            legalParagraph(
              'We implement reasonable technical measures to secure the text data you submit through the Feedback Form. However, please note that no method of transmission over the internet is 100% secure.',
            ),
          ],
        ),
      ],
    );
  }
}
