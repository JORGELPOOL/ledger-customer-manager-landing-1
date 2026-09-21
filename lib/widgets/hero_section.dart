import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import 'common.dart';
import 'mockups.dart';

class HeroSection extends StatelessWidget {
  final VoidCallback onGetStartedTap;
  final VoidCallback onSeeFeaturesTap;

  const HeroSection({
    super.key,
    required this.onGetStartedTap,
    required this.onSeeFeaturesTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    final narrow = isNarrowWidth(context);

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Eyebrow('📒 Built to replace the notebook'),
        const SizedBox(height: 20),
        Text(
          "Know exactly who owes you — and what's left on your shelves.",
          style: GoogleFonts.spaceGrotesk(
            fontSize: narrow ? 32 : 46,
            fontWeight: FontWeight.w600,
            height: 1.08,
            letterSpacing: -0.5,
            color: colors.ink,
          ),
        ),
        const SizedBox(height: 20),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 560),
          child: Text(
            'Ledger tracks your customers, sales, debts, inventory, suppliers and '
            'expenses in one place — on your phone, your computer, or the web. No '
            'internet required to use it day to day.',
            style: TextStyle(fontSize: 18, color: colors.muted, height: 1.5),
          ),
        ),
        const SizedBox(height: 32),
        Wrap(
          spacing: 14,
          runSpacing: 14,
          children: [
            PrimaryButton(label: 'Get started free', onPressed: onGetStartedTap, large: true),
            GhostButton(label: 'See how it works', onPressed: onSeeFeaturesTap, large: true),
          ],
        ),
        const SizedBox(height: 28),
        Wrap(
          spacing: 8,
          runSpacing: 6,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Text('Works offline', style: TextStyle(color: colors.muted, fontSize: 13.5)),
            const DotSeparator(),
            Text('Android, desktop & web', style: TextStyle(color: colors.muted, fontSize: 13.5)),
            const DotSeparator(),
            Text('Priced for real shops', style: TextStyle(color: colors.muted, fontSize: 13.5)),
          ],
        ),
      ],
    );

    const mockup = DashboardMockup();

    return SectionContainer(
      padding: EdgeInsets.only(
        top: narrow ? 40 : 72,
        bottom: narrow ? 40 : 88,
        left: 24,
        right: 24,
      ),
      child: narrow
          ? Column(
              children: [
                textColumn,
                const SizedBox(height: 40),
                mockup,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: textColumn),
                const SizedBox(width: 56),
                Expanded(child: mockup),
              ],
            ),
    );
  }
}
