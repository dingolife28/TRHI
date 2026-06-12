import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import 'app_lang.dart';
import 'language_scope.dart';

/// Kompakter DE | EN Umschalter für die Kopfzeile (oben links).
/// Liest und setzt den einen [LanguageController] — der „Bottleneck"-Schalter.
class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = LanguageScope.controllerOf(context);
    final lang = controller.lang;

    return Container(
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        border: Border.all(color: AppColors.hairlineDark),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _seg(context, 'DE', lang == AppLang.de,
              () => controller.set(AppLang.de)),
          _seg(context, 'EN', lang == AppLang.en,
              () => controller.set(AppLang.en)),
        ],
      ),
    );
  }

  Widget _seg(
      BuildContext context, String label, bool active, VoidCallback onTap) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
          decoration: BoxDecoration(
            color: active ? AppColors.canvasLight : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          child: Text(
            label,
            style: AppTextStyles.buttonSM.copyWith(
              fontSize: 12,
              color: active ? AppColors.canvasDark : AppColors.onDarkMuted,
              fontWeight: active ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
