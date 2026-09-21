import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import 'common.dart';

class _Step {
  final String number;
  final String title;
  final String desc;
  const _Step(this.number, this.title, this.desc);
}

const _steps = [
  _Step(
    '1',
    'Add your customers & stock',
    'Bring in your existing customer list and inventory — or start fresh and add them as you go.',
  ),
  _Step(
    '2',
    'Record every sale & payment',
    'Sell on credit, take a deposit, or get paid in full — every transaction updates stock and balances instantly.',
  ),
  _Step(
    '3',
    'See your numbers clearly',
    "Check the dashboard each morning: what's owed, what's low, and what you actually earned this week.",
  ),
];

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Getting started',
            title: 'Up and running in three steps.',
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 28,
            runSpacing: 28,
            children: _steps.map((step) {
              return SizedBox(
                width: 320,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(color: colors.ink, shape: BoxShape.circle),
                      alignment: Alignment.center,
                      child: Text(
                        step.number,
                        style: GoogleFonts.spaceGrotesk(color: colors.amber, fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      step.title,
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600, color: colors.ink),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      step.desc,
                      style: TextStyle(fontSize: 14.5, color: colors.muted, height: 1.4),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
