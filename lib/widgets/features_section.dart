import 'package:flutter/material.dart';

import '../theme.dart';
import 'common.dart';

class _FeatureItem {
  final IconData icon;
  final String title;
  final String desc;
  final Color bg;
  final Color fg;
  const _FeatureItem(this.icon, this.title, this.desc, this.bg, this.fg);
}

const _features = [
  _FeatureItem(
    Icons.people_alt_outlined,
    'Customers & purchase history',
    "Every customer's name, phone number, and full buying history — searchable in seconds.",
    Color(0xFFFEF3C7),
    Color(0xFF78350F),
  ),
  _FeatureItem(
    Icons.payments_outlined,
    'Debt & payment tracking',
    'Record sales on credit, take partial payments, and always know the exact balance owed.',
    Color(0xFFECFDF5),
    Color(0xFF059669),
  ),
  _FeatureItem(
    Icons.inventory_2_outlined,
    'Inventory & low-stock alerts',
    "Stock levels update automatically with every sale, and you're flagged before anything runs out.",
    Color(0xFFE0E7FF),
    Color(0xFF4338CA),
  ),
  _FeatureItem(
    Icons.notifications_active_outlined,
    'Payment reminders',
    'One screen shows every outstanding balance, sorted by due date, with overdue ones flagged in red.',
    Color(0xFFFEF2F2),
    Color(0xFFDC2626),
  ),
  _FeatureItem(
    Icons.local_shipping_outlined,
    'Suppliers',
    'Keep track of who you buy stock from, and link inventory items to their supplier.',
    Color(0xFFFAE8FF),
    Color(0xFFA21CAF),
  ),
  _FeatureItem(
    Icons.bar_chart_outlined,
    'Expenses & profit reports',
    'Log rent, transport, and other costs, then see revenue, collections, and estimated profit clearly.',
    Color(0xFFDBEAFE),
    Color(0xFF1D4ED8),
  ),
  _FeatureItem(
    Icons.shield_outlined,
    'Staff accounts & roles',
    'Give staff their own logins, and keep sensitive numbers like expenses visible to admins only.',
    Color(0xFFFEF3C7),
    Color(0xFF92400E),
  ),
  _FeatureItem(
    Icons.wifi_off_outlined,
    'Works offline, built for cedis',
    'No signal at your shop? No problem. Prices and reports are formatted in Ghanaian Cedi from the start.',
    Color(0xFFCCFBF1),
    Color(0xFF0F766E),
  ),
];

class FeaturesSection extends StatelessWidget {
  const FeaturesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      background: colors.surface,
      border: Border(top: BorderSide(color: colors.border), bottom: BorderSide(color: colors.border)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Everything in one place',
            title: 'Built around how shops actually run.',
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _features.map((f) {
              return SizedBox(
                width: 250,
                child: AppCard(
                  padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 26),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(color: f.bg, borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Icon(f.icon, color: f.fg, size: 22),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        f.title,
                        style: TextStyle(fontSize: 16.5, fontWeight: FontWeight.w600, color: colors.ink),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        f.desc,
                        style: TextStyle(fontSize: 14, color: colors.muted, height: 1.4),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
