import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';
import 'common.dart';

class NavBar extends StatelessWidget {
  final VoidCallback onFeaturesTap;
  final VoidCallback onHowItWorksTap;
  final VoidCallback onWhoItsForTap;
  final VoidCallback onFaqTap;
  final VoidCallback onGetStartedTap;

  const NavBar({
    super.key,
    required this.onFeaturesTap,
    required this.onHowItWorksTap,
    required this.onWhoItsForTap,
    required this.onFaqTap,
    required this.onGetStartedTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    final narrow = isMobileWidth(context);

    return Container(
      decoration: BoxDecoration(
        color: colors.bg,
        border: Border(bottom: BorderSide(color: colors.border)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      child: Row(
        children: [
          const _Brand(),
          const Spacer(),
          if (narrow)
            Builder(
              builder: (innerContext) => IconButton(
                onPressed: () => Scaffold.of(innerContext).openDrawer(),
                icon: Icon(Icons.menu, color: colors.ink),
              ),
            )
          else
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                _NavLink('Features', onFeaturesTap),
                const SizedBox(width: 28),
                _NavLink('How it works', onHowItWorksTap),
                const SizedBox(width: 28),
                _NavLink("Who it's for", onWhoItsForTap),
                const SizedBox(width: 28),
                _NavLink('FAQ', onFaqTap),
                const SizedBox(width: 28),
                GhostButton(label: 'Log in', onPressed: onGetStartedTap),
                const SizedBox(width: 12),
                PrimaryButton(label: 'Get started', onPressed: onGetStartedTap),
              ],
            ),
        ],
      ),
    );
  }
}

class _Brand extends StatelessWidget {
  const _Brand();

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 34,
          height: 34,
          decoration: BoxDecoration(color: colors.ink, borderRadius: BorderRadius.circular(9)),
          alignment: Alignment.center,
          child: Text(
            'L',
            style: GoogleFonts.spaceGrotesk(color: colors.amber, fontWeight: FontWeight.w700, fontSize: 16),
          ),
        ),
        const SizedBox(width: 10),
        Text(
          'Ledger',
          style: GoogleFonts.spaceGrotesk(fontSize: 19, fontWeight: FontWeight.w700, color: colors.ink),
        ),
      ],
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  const _NavLink(this.label, this.onTap);

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return InkWell(
      onTap: onTap,
      child: Text(
        label,
        style: TextStyle(color: colors.muted2, fontWeight: FontWeight.w500, fontSize: 14.5),
      ),
    );
  }
}

/// Slide-in drawer shown on narrow screens, opened from the hamburger button.
class MobileNavDrawer extends StatelessWidget {
  final void Function(GlobalKey key) onNavigate;
  final GlobalKey featuresKey;
  final GlobalKey howItWorksKey;
  final GlobalKey whoItsForKey;
  final GlobalKey faqKey;
  final GlobalKey getStartedKey;

  const MobileNavDrawer({
    super.key,
    required this.onNavigate,
    required this.featuresKey,
    required this.howItWorksKey,
    required this.whoItsForKey,
    required this.faqKey,
    required this.getStartedKey,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Drawer(
      backgroundColor: colors.bg,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
          children: [
            ListTile(
              title: Text('Features', style: TextStyle(color: colors.ink)),
              onTap: () => onNavigate(featuresKey),
            ),
            ListTile(
              title: Text('How it works', style: TextStyle(color: colors.ink)),
              onTap: () => onNavigate(howItWorksKey),
            ),
            ListTile(
              title: Text("Who it's for", style: TextStyle(color: colors.ink)),
              onTap: () => onNavigate(whoItsForKey),
            ),
            ListTile(
              title: Text('FAQ', style: TextStyle(color: colors.ink)),
              onTap: () => onNavigate(faqKey),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: PrimaryButton(
                label: 'Get started',
                onPressed: () => onNavigate(getStartedKey),
                large: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
