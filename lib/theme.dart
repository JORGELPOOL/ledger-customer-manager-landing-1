import 'package:flutter/material.dart';

/// Brand palette, matching the "ledger book" identity used across the rest
/// of the Ledger app: warm paper background, dark emerald ink, amber accent.
class LedgerColors {
  final Color bg;
  final Color surface;
  final Color ink;
  final Color inkSoft;
  final Color muted;
  final Color muted2;
  final Color border;
  final Color amber;
  final Color amberInk;
  final Color amberSoft;
  final Color emerald;
  final Color emeraldSoft;
  final Color red;
  final Color redSoft;

  const LedgerColors({
    required this.bg,
    required this.surface,
    required this.ink,
    required this.inkSoft,
    required this.muted,
    required this.muted2,
    required this.border,
    required this.amber,
    required this.amberInk,
    required this.amberSoft,
    required this.emerald,
    required this.emeraldSoft,
    required this.red,
    required this.redSoft,
  });

  static const light = LedgerColors(
    bg: Color(0xFFFAFAF9),
    surface: Colors.white,
    ink: Color(0xFF022C22),
    inkSoft: Color(0xFF064E3B),
    muted: Color(0xFF78716C),
    muted2: Color(0xFF57534E),
    border: Color(0xFFE7E5E4),
    amber: Color(0xFFF59E0B),
    amberInk: Color(0xFF78350F),
    amberSoft: Color(0xFFFEF3C7),
    emerald: Color(0xFF059669),
    emeraldSoft: Color(0xFFECFDF5),
    red: Color(0xFFDC2626),
    redSoft: Color(0xFFFEF2F2),
  );

  static const dark = LedgerColors(
    bg: Color(0xFF051914),
    surface: Color(0xFF0A2A20),
    ink: Color(0xFFF5F5F4),
    inkSoft: Color(0xFFD6F5E8),
    muted: Color(0xFFA8A29E),
    muted2: Color(0xFFD6D3D1),
    border: Color(0x17FFFFFF),
    amber: Color(0xFFF59E0B),
    amberInk: Color(0xFFFCD34D),
    amberSoft: Color(0x26F59E0B),
    emerald: Color(0xFF10B981),
    emeraldSoft: Color(0x1A059669),
    red: Color(0xFFF87171),
    redSoft: Color(0x1ADC2626),
  );

  static LedgerColors of(BuildContext context) {
    return Theme.of(context).brightness == Brightness.dark ? dark : light;
  }
}
