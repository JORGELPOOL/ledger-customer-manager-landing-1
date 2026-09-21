import 'package:flutter/material.dart';

import '../theme.dart';
import 'common.dart';

class _Faq {
  final String question;
  final String answer;
  const _Faq(this.question, this.answer);
}

const _faqs = [
  _Faq(
    'Does it work without internet?',
    'Yes. On Android and desktop, Ledger stores everything on your device, so it works with '
        'no signal at all. The web version saves data in your browser and only needs a '
        'connection to load the page itself.',
  ),
  _Faq(
    'Can more than one staff member use it?',
    'Yes. An admin account can create staff logins, and choose whether each one is staff or '
        'admin. Sensitive data like expenses and profit is visible to admins only.',
  ),
  _Faq(
    'Is my data safe if my phone breaks?',
    'You can export a full backup of your customers, sales, inventory, suppliers and expenses '
        "as a single file at any time, so you're never dependent on one device.",
  ),
  _Faq(
    'What devices does it run on?',
    'Android phones, Windows, macOS, Linux, and any modern web browser — one app, built to '
        'fit however you actually work.',
  ),
  _Faq(
    'What currency does it use?',
    'Ghanaian Cedi (GH₵) by default, formatted throughout the app — easy to adapt if you need '
        'another currency.',
  ),
];

class FaqSection extends StatelessWidget {
  const FaqSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      background: colors.surface,
      border: Border(top: BorderSide(color: colors.border), bottom: BorderSide(color: colors.border)),
      child: Column(
        children: [
          const SectionHeading(
            eyebrow: 'Questions',
            title: 'Good to know',
            centered: true,
          ),
          const SizedBox(height: 32),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: Column(
                children: _faqs.map((faq) {
                  return Container(
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(color: colors.border)),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        faq.question,
                        style: TextStyle(fontSize: 15.5, fontWeight: FontWeight.w600, color: colors.ink),
                      ),
                      iconColor: colors.muted,
                      collapsedIconColor: colors.muted,
                      childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      expandedAlignment: Alignment.centerLeft,
                      children: [
                        Text(
                          faq.answer,
                          style: TextStyle(fontSize: 14.5, color: colors.muted2, height: 1.5),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
