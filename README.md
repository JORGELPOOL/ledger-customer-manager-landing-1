# Ledger — Landing Page (Flutter)

A marketing landing page for the Ledger shop-management app, built in Flutter instead of
HTML/CSS — so it fits alongside the rest of your Flutter codebase and builds the same way
(`flutter build web`, or even as a section of the main app later if you want).

## ⚠️ Important: this has not been compiled or run

Unlike the Node.js backend built earlier in this project (which was actually installed, run,
and tested end-to-end), **no Flutter/Dart SDK was available in the environment this was
written in**, so this code could not be compiled or run before being handed to you. It was
written carefully and checked by hand — brace/parenthesis balance, matching constructor
parameters across every file, correct imports — but that is not a substitute for actually
running `flutter analyze` and `flutter run`. Please treat the first build as the real test,
and share any error output if something doesn't compile — most likely candidates would be a
typo in a widget parameter name or an API that changed between Flutter versions.

## Getting started

This ships as just the `lib/` folder and `pubspec.yaml` — not a full Flutter project skeleton
(no `android/`, `ios/`, `web/` folders), since those are auto-generated and better created
fresh by your own Flutter SDK version:

```bash
flutter create . --project-name ledger_landing_page
```

Running that inside this folder generates the missing platform folders without touching the
`lib/` or `pubspec.yaml` you already have (confirm "yes" if it asks to overwrite — check the
diff on `pubspec.yaml` afterward and re-add the `google_fonts` dependency if it gets reset).

Then:

```bash
flutter pub get
flutter analyze        # check for any issues before running
flutter run -d chrome   # or your platform of choice
```

## Building for deployment

```bash
flutter build web --release
```

Outputs a static site in `build/web/` — upload it to any static host (Netlify, Vercel, GitHub
Pages, Firebase Hosting, your own server).

## What's a placeholder

- The **"Get started" buttons** throughout the page scroll to the final CTA section, and that
  section's own button is an empty placeholder (`onPressed: () {}`). Wire it to your actual
  signup flow, download link, or contact action once you have one.
- **Pricing** isn't included, since no pricing model was specified — add a section for it if/
  when you decide on one.

## Project structure

```
lib/
  main.dart                      App entry point, theme, and page assembly with scroll-to-section nav
  theme.dart                     LedgerColors — the brand palette (light + dark mode)
  widgets/
    common.dart                  Shared primitives: SectionContainer, buttons, cards, headings
    mockups.dart                 Hand-built Dashboard and phone mockups (no real screenshots needed)
    nav_bar.dart                 Responsive nav bar + mobile drawer
    hero_section.dart
    pain_points_section.dart
    features_section.dart
    how_it_works_section.dart
    showcase_section.dart
    who_its_for_section.dart
    faq_section.dart              Uses Flutter's built-in ExpansionTile for the accordion
    cta_section.dart
    footer_section.dart
```

## Customizing

- **Colors**: edit `LedgerColors.light` and `LedgerColors.dark` in `lib/theme.dart` — every
  widget reads from there, so both light and dark mode update together.
- **Copy**: each section's text lives directly in its own file under `lib/widgets/`.
- **Fonts**: Space Grotesk (headings) + Inter (body) via the `google_fonts` package, which
  downloads fonts at runtime — no bundled font files to manage.
- **Responsiveness**: sections use `Wrap` for grids (they reflow automatically based on
  available width) and a manual narrow/wide check (`isNarrowWidth`, `isMobileWidth` in
  `common.dart`) for two-column-vs-stacked layouts like the hero and showcase sections.
