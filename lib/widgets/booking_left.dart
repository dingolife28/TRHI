import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

const _sessionTypes = [
  ('🎯', '1:1 Personal Training', '60 min · Bewegungsanalyse & Plan'),
  ('📋', 'Health Consulting',     '45 min · Ganzheitliche Beratung'),
  ('🧘', 'Mind-Body Session',     '45 min · Atemarbeit & Mindset'),
  ('✨', 'Erstgespräch',          '30 min · Kostenlos'),
];

const _slots = ['08:00', '09:00', '10:00', '11:00', '14:00', '15:00', '16:00', '17:00'];
const _unavailable = {'09:00', '11:00', '16:00'};

class BookingLeft extends StatelessWidget {
  final int selectedSession;
  final String? selectedSlot;
  final ValueChanged<int> onSessionChanged;
  final ValueChanged<String?> onSlotChanged;

  const BookingLeft({
    super.key,
    required this.selectedSession,
    required this.selectedSlot,
    required this.onSessionChanged,
    required this.onSlotChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppSpacing.band),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Was bringt dich hierher?',
              style: AppTextStyles.headingLG.copyWith(color: AppColors.onDark)),
          const SizedBox(height: AppSpacing.sm),
          Text('Erstgespräch immer kostenlos.',
              style: AppTextStyles.bodyMD.copyWith(color: AppColors.onDarkMuted)),
          const SizedBox(height: AppSpacing.xxxl),

          ..._sessionTypes.asMap().entries.map((e) {
            final i = e.key;
            final (icon, title, sub) = e.value;
            final selected = selectedSession == i;
            return GestureDetector(
              onTap: () => onSessionChanged(i),
              child: Container(
                margin: const EdgeInsets.only(bottom: AppSpacing.lg),
                padding: const EdgeInsets.all(AppSpacing.xl),
                decoration: BoxDecoration(
                  color: selected ? AppColors.brand.withValues(alpha: 0.15) : AppColors.surfaceElevated,
                  borderRadius: AppRadius.md,
                  border: Border.all(
                    color: selected ? AppColors.brand : AppColors.hairlineDark,
                    width: selected ? 1.5 : 1,
                  ),
                ),
                child: Row(children: [
                  Text(icon, style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: AppSpacing.lg),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Text(title,
                        style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark)),
                    Text(sub,
                        style: AppTextStyles.caption.copyWith(color: AppColors.stone)),
                  ]),
                ]),
              ),
            );
          }),

          const SizedBox(height: AppSpacing.xxl),
          Text('Uhrzeit wählen',
              style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark)),
          const SizedBox(height: AppSpacing.lg),

          Wrap(
            spacing: AppSpacing.lg,
            runSpacing: AppSpacing.lg,
            children: _slots.map((slot) {
              final avail = !_unavailable.contains(slot);
              final sel = selectedSlot == slot;
              return GestureDetector(
                onTap: avail ? () => onSlotChanged(slot) : null,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.xl, vertical: AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: sel ? AppColors.brand : Colors.transparent,
                    borderRadius: AppRadius.full,
                    border: Border.all(
                      color: sel
                          ? AppColors.brand
                          : avail
                              ? AppColors.hairlineDark
                              : AppColors.dividerSoft,
                    ),
                  ),
                  child: Text(slot,
                      style: AppTextStyles.buttonSM.copyWith(
                        color: sel
                            ? AppColors.onDark
                            : avail
                                ? AppColors.onDark
                                : AppColors.stone.withValues(alpha: 0.4),
                      )),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
