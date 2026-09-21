import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'theme.dart';
import 'widgets/nav_bar.dart';
import 'widgets/hero_section.dart';
import 'widgets/pain_points_section.dart';
import 'widgets/features_section.dart';
import 'widgets/how_it_works_section.dart';
import 'widgets/showcase_section.dart';
import 'widgets/who_its_for_section.dart';
import 'widgets/faq_section.dart';
import 'widgets/cta_section.dart';
import 'widgets/footer_section.dart';

void main() {
  runApp(const LandingApp());
}

class LandingApp extends StatelessWidget {
  const LandingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ledger — Track customers, debts, inventory & profit',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      home: const LandingPage(),
    );
  }

  ThemeData _buildTheme(Brightness brightness) {
    final colors = brightness == Brightness.dark ? LedgerColors.dark : LedgerColors.light;
    final base = brightness == Brightness.dark ? ThemeData.dark() : ThemeData.light();
    final textTheme = GoogleFonts.interTextTheme(base.textTheme).apply(
      bodyColor: colors.muted2,
      displayColor: colors.ink,
    );
    return base.copyWith(
      brightness: brightness,
      scaffoldBackgroundColor: colors.bg,
      textTheme: textTheme,
      colorScheme: base.colorScheme.copyWith(
        primary: colors.amber,
        surface: colors.surface,
      ),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _scrollController = ScrollController();
  final _featuresKey = GlobalKey();
  final _howItWorksKey = GlobalKey();
  final _whoItsForKey = GlobalKey();
  final _faqKey = GlobalKey();
  final _getStartedKey = GlobalKey();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTo(GlobalKey key) {
    final ctx = key.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void _navigateFromDrawer(GlobalKey key) {
    Navigator.of(context).pop();
    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollTo(key));
  }

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return Scaffold(
      backgroundColor: colors.bg,
      drawer: MobileNavDrawer(
        onNavigate: _navigateFromDrawer,
        featuresKey: _featuresKey,
        howItWorksKey: _howItWorksKey,
        whoItsForKey: _whoItsForKey,
        faqKey: _faqKey,
        getStartedKey: _getStartedKey,
      ),
      body: SafeArea(
        child: Column(
          children: [
            NavBar(
              onFeaturesTap: () => _scrollTo(_featuresKey),
              onHowItWorksTap: () => _scrollTo(_howItWorksKey),
              onWhoItsForTap: () => _scrollTo(_whoItsForKey),
              onFaqTap: () => _scrollTo(_faqKey),
              onGetStartedTap: () => _scrollTo(_getStartedKey),
            ),
            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  children: [
                    HeroSection(
                      onGetStartedTap: () => _scrollTo(_getStartedKey),
                      onSeeFeaturesTap: () => _scrollTo(_featuresKey),
                    ),
                    const PainPointsSection(),
                    FeaturesSection(key: _featuresKey),
                    HowItWorksSection(key: _howItWorksKey),
                    const ShowcaseSection(),
                    WhoItsForSection(key: _whoItsForKey),
                    FaqSection(key: _faqKey),
                    // This section is itself the "get started" destination that the nav
                    // and hero buttons scroll to, so its own button is a placeholder —
                    // wire it to your real signup/download/contact action.
                    CtaSection(key: _getStartedKey, onGetStartedTap: () {}),
                    FooterSection(
                      onFeaturesTap: () => _scrollTo(_featuresKey),
                      onHowItWorksTap: () => _scrollTo(_howItWorksKey),
                      onFaqTap: () => _scrollTo(_faqKey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
