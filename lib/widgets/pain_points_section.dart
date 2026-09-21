import 'package:flutter/material.dart';

import '../theme.dart';
import 'common.dart';

class _PainPoint {
  final IconData icon;
  final String text;
  const _PainPoint(this.icon, this.text);
}

const _painPoints = [
  _PainPoint(
    Icons.error_outline,
    "A customer swears they paid — but your notebook page is smudged, torn, or just missing.",
  ),
  _PainPoint(
    Icons.inventory_2_outlined,
    "You restock the wrong item because no one told you the fast-moving one had already run out.",
  ),
  _PainPoint(
    Icons.show_chart,
    "End of month arrives and you genuinely don't know if you made money or just moved it around.",
  ),
  _PainPoint(
    Icons.people_outline,
    "Your assistant runs the counter all day, and you have no idea what actually happened while you were out.",
  ),
];

class PainPointsSection extends StatelessWidget {
  const PainPointsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);

    return SectionContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionHeading(
            eyebrow: 'Sound familiar?',
            title: 'The notebook always lets you down at the worst time.',
          ),
          const SizedBox(height: 40),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: _painPoints.map((item) {
              return SizedBox(
                width: 480,
                child: AppCard(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(item.icon, color: colors.red, size: 24),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Text(
                          item.text,
                          style: TextStyle(color: colors.muted2, fontSize: 15, height: 1.4),
                        ),
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
