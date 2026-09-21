import 'package:flutter/material.dart';

import '../theme.dart';
import 'common.dart';

class _Persona {
  final String emoji;
  final String title;
  final String desc;
  const _Persona(this.emoji, this.title, this.desc);
}

const _personas = [
  _Persona('🛒', 'Provision & grocery shops', 'Fast-moving stock, regular credit customers, daily sales to track.'),
  _Persona('🔧', 'Hardware & building supplies', 'Bulk orders on account, supplier relationships worth remembering.'),
  _Persona('👗', 'Boutiques & fashion retail', 'Layaway payments and repeat customers who buy on trust.'),
  _Persona('💊', 'Pharmacies & cosmetics', 'Stock that must never run out, and margins worth watching closely.'),
];

class WhoItsForSection extends StatelessWidget {
  const WhoItsForSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: "Who it's for",
            title: 'If you sell on credit and track stock, this is for you.',
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 18,
            runSpacing: 18,
            children: _personas.map((p) {
              return SizedBox(
                width: 240,
                child: AppCard(
                  padding: const EdgeInsets.all(22),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(p.emoji, style: const TextStyle(fontSize: 28)),
                      const SizedBox(height: 10),
                      Text(
                        p.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: colors.ink),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        p.desc,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, color: colors.muted, height: 1.4),
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
