import 'package:flutter/material.dart';

import '../theme.dart';
import 'common.dart';
import 'mockups.dart';

class ShowcaseSection extends StatelessWidget {
  const ShowcaseSection({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    final narrow = isNarrowWidth(context);

    final textColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Eyebrow('See it before you need it'),
        const SizedBox(height: 14),
        Text(
          'Reminders that actually get looked at.',
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.w600, color: colors.ink),
        ),
        const SizedBox(height: 10),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 480),
          child: Text(
            "No more flipping back through pages trying to remember who owes what. Every "
            "outstanding balance lives in one sorted list.",
            style: TextStyle(fontSize: 16, color: colors.muted, height: 1.5),
          ),
        ),
        const SizedBox(height: 24),
        _CheckLine(colors: colors, text: 'Sorted by due date, overdue ones flagged in red'),
        const SizedBox(height: 16),
        _CheckLine(colors: colors, text: 'One tap to record a partial or full payment'),
        const SizedBox(height: 16),
        _CheckLine(colors: colors, text: 'Total outstanding debt shown right at the top'),
      ],
    );

    const mockup = Center(child: PhoneReminderMockup());

    return SectionContainer(
      background: colors.surface,
      border: Border(top: BorderSide(color: colors.border), bottom: BorderSide(color: colors.border)),
      child: narrow
          ? Column(
              children: [
                mockup,
                const SizedBox(height: 40),
                textColumn,
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: mockup),
                const SizedBox(width: 56),
                Expanded(child: textColumn),
              ],
            ),
    );
  }
}

class _CheckLine extends StatelessWidget {
  final LedgerColors colors;
  final String text;
  const _CheckLine({required this.colors, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.check_circle, size: 18, color: colors.emerald),
        const SizedBox(width: 12),
        Expanded(
          child: Text(text, style: TextStyle(fontSize: 15, color: colors.muted2)),
        ),
      ],
    );
  }
}
