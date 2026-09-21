import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import 'common.dart';

class CtaSection extends StatelessWidget {
  final VoidCallback onGetStartedTap;
  const CtaSection({super.key, required this.onGetStartedTap});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 64, horizontal: 40),
        decoration: BoxDecoration(color: colors.ink, borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Text(
              'Stop guessing. Start knowing.',
              textAlign: TextAlign.center,
              style: GoogleFonts.spaceGrotesk(fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(height: 14),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 480),
              child: Text(
                'Set up your shop in minutes — add your first customer, your first item, '
                'and see it come together.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.65), fontSize: 15.5, height: 1.5),
              ),
            ),
            const SizedBox(height: 30),
            PrimaryButton(label: 'Get started free', onPressed: onGetStartedTap, large: true),
          ],
        ),
      ),
    );
  }
}
