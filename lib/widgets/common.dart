import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

const double kMaxContentWidth = 1120;

bool isMobileWidth(BuildContext context) => MediaQuery.of(context).size.width < 720;
bool isNarrowWidth(BuildContext context) => MediaQuery.of(context).size.width < 900;

/// Centers content at a max width with consistent vertical/horizontal padding,
/// used to wrap every section on the page.
class SectionContainer extends StatelessWidget {
  final Widget child;
  final Color? background;
  final EdgeInsetsGeometry padding;
  final Border? border;

  const SectionContainer({
    super.key,
    required this.child,
    this.background,
    this.border,
    this.padding = const EdgeInsets.symmetric(vertical: 88, horizontal: 24),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: (background != null || border != null)
          ? BoxDecoration(color: background, border: border)
          : null,
      padding: padding,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: kMaxContentWidth),
          child: child,
        ),
      ),
    );
  }
}

class Eyebrow extends StatelessWidget {
  final String text;
  const Eyebrow(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: colors.amberSoft,
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(color: colors.amberInk, fontWeight: FontWeight.w600, fontSize: 13),
      ),
    );
  }
}

class SectionHeading extends StatelessWidget {
  final String eyebrow;
  final String title;
  final bool centered;

  const SectionHeading({
    super.key,
    required this.eyebrow,
    required this.title,
    this.centered = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Column(
      crossAxisAlignment: centered ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Eyebrow(eyebrow),
        const SizedBox(height: 18),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Text(
            title,
            textAlign: centered ? TextAlign.center : TextAlign.left,
            style: GoogleFonts.spaceGrotesk(
              fontSize: 32,
              fontWeight: FontWeight.w600,
              height: 1.15,
              letterSpacing: -0.3,
              color: colors.ink,
            ),
          ),
        ),
      ],
    );
  }
}

class PrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool large;

  const PrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.amber,
        foregroundColor: const Color(0xFF1C1300),
        elevation: 0,
        padding: EdgeInsets.symmetric(horizontal: large ? 30 : 24, vertical: large ? 18 : 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontSize: large ? 16 : 15, fontWeight: FontWeight.w600),
      ),
      child: Text(label),
    );
  }
}

class GhostButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final bool large;

  const GhostButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.large = false,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: colors.ink,
        side: BorderSide(color: colors.border),
        padding: EdgeInsets.symmetric(horizontal: large ? 30 : 24, vertical: large ? 18 : 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        textStyle: TextStyle(fontSize: large ? 16 : 15, fontWeight: FontWeight.w600),
      ),
      child: Text(label),
    );
  }
}

class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(26),
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: colors.border),
      ),
      child: child,
    );
  }
}

class DotSeparator extends StatelessWidget {
  const DotSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      width: 4,
      height: 4,
      decoration: BoxDecoration(color: colors.border, shape: BoxShape.circle),
    );
  }
}
