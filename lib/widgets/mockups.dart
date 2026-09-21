import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme.dart';

/// A stylized recreation of the app's Dashboard screen — not a real
/// screenshot, hand-built from simple widgets so it never goes stale and
/// needs no external image assets.
class DashboardMockup extends StatelessWidget {
  const DashboardMockup({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    final barHeights = [0.4, 0.65, 0.35, 0.8, 0.55, 0.9, 0.7];

    return Container(
      decoration: BoxDecoration(
        color: colors.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colors.border),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.07), blurRadius: 30, offset: const Offset(0, 10)),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            decoration: BoxDecoration(border: Border(bottom: BorderSide(color: colors.border))),
            child: Row(
              children: List.generate(
                3,
                (i) => Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(color: colors.border, shape: BoxShape.circle),
                  ),
                ),
              ),
            ),
          ),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: 130,
                  color: colors.ink,
                  padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _SideItem('Dashboard', active: true),
                      _SideItem('Customers'),
                      _SideItem('Inventory'),
                      _SideItem('Suppliers'),
                      _SideItem('Reminders'),
                      _SideItem('Reports'),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: colors.bg,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: colors.surface,
                            border: Border.all(color: colors.border),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: _TallyCell('REVENUE', 'GH₵ 4,820', colors.ink, showBorder: true),
                              ),
                              Expanded(
                                child: _TallyCell('COLLECTED', 'GH₵ 3,910', colors.emerald, showBorder: true),
                              ),
                              Expanded(
                                child: _TallyCell('OWED', 'GH₵ 910', colors.red, showBorder: false),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 90,
                          padding: const EdgeInsets.all(14),
                          decoration: BoxDecoration(
                            color: colors.surface,
                            border: Border.all(color: colors.border),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: barHeights
                                .map(
                                  (h) => Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 3),
                                      child: FractionallySizedBox(
                                        heightFactor: h,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.bottomCenter,
                                              end: Alignment.topCenter,
                                              colors: [const Color(0xFFFBBF24), colors.amber],
                                            ),
                                            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SideItem extends StatelessWidget {
  final String label;
  final bool active;
  const _SideItem(this.label, {this.active = false});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 6),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
      decoration: BoxDecoration(
        color: active ? Colors.white.withOpacity(0.08) : null,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (active)
            Container(
              width: 3,
              height: 10,
              color: colors.amber,
              margin: const EdgeInsets.only(right: 6),
            ),
          Text(
            label,
            style: TextStyle(
              color: active ? Colors.white : Colors.white.withOpacity(0.55),
              fontSize: 10.5,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _TallyCell extends StatelessWidget {
  final String label;
  final String value;
  final Color valueColor;
  final bool showBorder;
  const _TallyCell(this.label, this.value, this.valueColor, {required this.showBorder});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: showBorder ? Border(right: BorderSide(color: colors.border)) : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(label, style: TextStyle(fontSize: 9, color: colors.muted, letterSpacing: 0.3)),
          const SizedBox(height: 4),
          Text(
            value,
            style: GoogleFonts.spaceGrotesk(fontSize: 13, fontWeight: FontWeight.w700, color: valueColor),
          ),
        ],
      ),
    );
  }
}

/// A stylized phone showing the Payment Reminders screen, used in the
/// showcase section.
class PhoneReminderMockup extends StatelessWidget {
  const PhoneReminderMockup({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      width: 220,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: colors.ink, borderRadius: BorderRadius.circular(30)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
        constraints: const BoxConstraints(minHeight: 340),
        decoration: BoxDecoration(color: colors.surface, borderRadius: BorderRadius.circular(22)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PAYMENT REMINDERS',
              style: TextStyle(fontSize: 10.5, fontWeight: FontWeight.w700, color: colors.muted, letterSpacing: 0.4),
            ),
            const SizedBox(height: 12),
            const _ReminderTile(
              name: 'Kwame Mensah',
              sub: 'Bag of rice x2 · Overdue since 10 Sep',
              amount: 'GH₵ 21.00',
              overdue: true,
            ),
            const SizedBox(height: 10),
            const _ReminderTile(
              name: 'Abena Owusu',
              sub: 'Cooking oil x1 · Due 18 Sep',
              amount: 'GH₵ 45.00',
              overdue: false,
            ),
            const SizedBox(height: 10),
            const _ReminderTile(
              name: 'Yaw Boateng',
              sub: 'Assorted items · No due date',
              amount: 'GH₵ 12.50',
              overdue: false,
            ),
          ],
        ),
      ),
    );
  }
}

class _ReminderTile extends StatelessWidget {
  final String name;
  final String sub;
  final String amount;
  final bool overdue;

  const _ReminderTile({
    required this.name,
    required this.sub,
    required this.amount,
    required this.overdue,
  });

  @override
  Widget build(BuildContext context) {
    final colors = LedgerColors.of(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: overdue ? colors.red : colors.border),
        color: overdue ? colors.redSoft : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(name, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: colors.ink)),
          const SizedBox(height: 2),
          Text(sub, style: TextStyle(fontSize: 10, color: colors.muted)),
          const SizedBox(height: 6),
          Text(
            amount,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: overdue ? colors.red : colors.amberInk,
            ),
          ),
        ],
      ),
    );
  }
}
