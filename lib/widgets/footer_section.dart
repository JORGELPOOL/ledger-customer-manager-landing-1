import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import 'common.dart';

class FooterSection extends StatelessWidget {
  final VoidCallback onFeaturesTap;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onFaqTap;

  const FooterSection({
    super.key,
    required this.onFeaturesTap,
    required this.onHowItWorksTap,
    required this.onFaqTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
      border: Border(top: BorderSide(color: colors.border)),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        runAlignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        runSpacing: 16,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(color: colors.ink, borderRadius: BorderRadius.circular(7)),
                alignment: Alignment.center,
                child: Text(
                  'L',
                  style: GoogleFonts.spaceGrotesk(color: colors.amber, fontWeight: FontWeight.w700, fontSize: 13),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Ledger',
                style: GoogleFonts.spaceGrotesk(fontSize: 16, fontWeight: FontWeight.w700, color: colors.ink),
              ),
            ],
          ),
          Wrap(
            spacing: 24,
            children: [
              _FooterLink('Features', onFeaturesTap, colors),
              _FooterLink('How it works', onHowItWorksTap, colors),
              _FooterLink('FAQ', onFaqTap, colors),
            ],
          ),
          Text(
            '© 2026 Ledger. Built for shops that run on trust.',
            style: TextStyle(fontSize: 13, color: colors.muted),
          ),
        ],
      ),
    );
  }
}

class _FooterLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final LedgerColors colors;
  const _FooterLink(this.label, this.onTap, this.colors);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(label, style: TextStyle(fontSize: 14, color: colors.muted)),
    );
  }
}
