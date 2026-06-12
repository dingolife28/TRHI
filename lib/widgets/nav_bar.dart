import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';
import '../i18n/language_toggle.dart';

class TrhiNavBar extends StatelessWidget {
  /// Sektions-Links: Home übergibt einen Scroll-Callback; ohne Callback
  /// (Blog-Seiten) führen die Links zur Startseite.
  final ValueChanged<String>? onSectionTap;

  const TrhiNavBar({super.key, this.onSectionTap});

  void _openSection(BuildContext context, String id) {
    if (onSectionTap != null) {
      onSectionTap!(id);
    } else {
      context.go('/');
    }
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.desktop;
    final isNarrow = width < Breakpoints.mobile;

    return Positioned(
      top: 0, left: 0, right: 0,
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: AppColors.canvasDark,
          border: Border(bottom: BorderSide(color: AppColors.hairlineDark)),
        ),
        padding: EdgeInsets.symmetric(
            horizontal: isNarrow ? AppSpacing.lg : AppSpacing.xl),
        child: Row(
          children: [
            // Sprachumschalter ganz links (oben links in der Kopfzeile).
            const LanguageToggle(),
            SizedBox(width: isNarrow ? AppSpacing.sm : AppSpacing.md),
            // Logo + brand name — Expanded, damit der CTA-Button rechts immer
            // seinen vollen Platz behält. Auf schmalen Screens ellipsiert der
            // Markentext, statt "Erstgespräch" abzuschneiden.
            Expanded(
              child: Row(
                children: [
                  Image.asset('assets/trhi_logo.png',
                      width: isNarrow ? 46 : 52, height: isNarrow ? 46 : 52,
                      color: AppColors.onDark),
                  const SizedBox(width: AppSpacing.md),
                  // Nur noch der Schriftzug — die Wortmarke "TRHI" steckt bereits
                  // im Logo. Ellipsis als Sicherheitsnetz auf schmalen Screens.
                  Flexible(
                    child: Text(t.brandTagline,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.eyebrow.copyWith(
                            color: AppColors.brand,
                            fontSize: isNarrow ? 11 : 13,
                            letterSpacing: isNarrow ? 0.3 : 1.2)),
                  ),
                ],
              ),
            ),

            const SizedBox(width: AppSpacing.md),

            if (!isMobile) ...[
              _NavLink(t.navTraining, onTap: () => _openSection(context, 'training')),
              _NavLink(t.navMindBody, onTap: () => _openSection(context, 'mindbody')),
              _NavLink(t.navNutrition, onTap: () => _openSection(context, 'ernaehrung')),
              _NavLink(t.navYouTube, onTap: () => _openSection(context, 'youtube')),
              _NavLink(t.navBook, onTap: () => context.go('/booking')),
              const SizedBox(width: AppSpacing.lg),
            ],

            // CTA button — immer vollständig sichtbar
            FilledButton(
              onPressed: () => context.go('/booking'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.canvasLight,
                foregroundColor: AppColors.canvasDark,
                padding: EdgeInsets.symmetric(
                    horizontal: isNarrow ? AppSpacing.md : AppSpacing.xl,
                    vertical: AppSpacing.sm),
                shape: const StadiumBorder(),
                textStyle: AppTextStyles.buttonSM,
              ),
              child: Text(t.navCta),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavLink extends StatelessWidget {
  final String label;
  final VoidCallback? onTap;

  const _NavLink(this.label, {this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: onTap,
          child: Text(label,
              style: AppTextStyles.bodyMD.copyWith(color: AppColors.onDark)),
        ),
      ),
    );
  }
}
