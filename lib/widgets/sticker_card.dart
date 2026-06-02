import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

class StickerCard extends StatefulWidget {
  const StickerCard({super.key});

  @override
  State<StickerCard> createState() => _StickerCardState();
}

class _StickerCardState extends State<StickerCard> {
  bool _showArticle = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(AppSpacing.xxl),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: AppRadius.xl,
        border: Border.all(color: AppColors.hairlineDark),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        child: _showArticle
            ? _ArticleContent(
                key: const ValueKey('article'),
                onClose: () => setState(() => _showArticle = false),
              )
            : _DefaultContent(
                key: const ValueKey('default'),
                onTapOval: () => setState(() => _showArticle = true),
              ),
      ),
    );
  }
}

// ── Default view ─────────────────────────────────────────────────────────────

class _DefaultContent extends StatelessWidget {
  final VoidCallback onTapOval;
  const _DefaultContent({super.key, required this.onTapOval});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Logo
        Image.asset(
          'assets/trhi_logo.png',
          width: 88,
          height: 88,
          color: AppColors.onDark,
          errorBuilder: (context, error, stack) => Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.hairlineDark),
              borderRadius: AppRadius.md,
            ),
            child: const Icon(Icons.fitness_center,
                color: AppColors.stone, size: 40),
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        // Divider · dot · divider
        Row(children: [
          Expanded(child: Divider(color: AppColors.hairlineDark, thickness: 1, height: 1)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
            child: Container(
              width: 4, height: 4,
              decoration: const BoxDecoration(
                color: AppColors.stone, shape: BoxShape.circle),
            ),
          ),
          Expanded(child: Divider(color: AppColors.hairlineDark, thickness: 1, height: 1)),
        ]),

        const SizedBox(height: AppSpacing.xl),

        // Tappable "UNFUCK YOUR GUT" sticker
        GestureDetector(
          onTap: onTapOval,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'UNFUCK',
                  style: AppTextStyles.displayLG.copyWith(
                    color: AppColors.onDark,
                    fontWeight: FontWeight.w700,
                    height: 0.95,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 6),
                  child: Text(
                    'YOUR',
                    style: AppTextStyles.headingLG.copyWith(
                      color: AppColors.stone,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
                Text(
                  'GUT',
                  style: AppTextStyles.displayLG.copyWith(
                    color: AppColors.onDark,
                    fontWeight: FontWeight.w700,
                    height: 0.95,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: AppSpacing.xxl),

        // Footer
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('TRHI', style: AppTextStyles.label.copyWith(color: AppColors.stone)),
            Text('fermented goods', style: AppTextStyles.label.copyWith(color: AppColors.stone)),
            Text('®', style: AppTextStyles.label.copyWith(color: AppColors.stone)),
          ],
        ),
      ],
    );
  }
}

// ── Article view ──────────────────────────────────────────────────────────────

class _ArticleContent extends StatelessWidget {
  final VoidCallback onClose;
  const _ArticleContent({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Header row: category + close
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
              decoration: const BoxDecoration(
                color: AppColors.brand,
                borderRadius: AppRadius.full,
              ),
              child: Text('Gut Health & Mikrobiom',
                  style: AppTextStyles.eyebrow.copyWith(color: AppColors.onDark)),
            ),
            GestureDetector(
              onTap: onClose,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Icon(Icons.close, color: AppColors.stone, size: 18),
              ),
            ),
          ],
        ),

        const SizedBox(height: AppSpacing.lg),

        Text(
          'Fermentation: Warum unser Körper diese Jahrtausende alte Technik braucht',
          style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark),
        ),

        const SizedBox(height: AppSpacing.lg),

        _Para(
          'Fermentation ist wahrscheinlich so alt wie die Menschheit selbst. '
          'Nicht weil unsere Vorfahren besonders klug waren, sondern weil '
          'Lebensmittel nun mal vergären, wenn man sie lässt.',
          bold: true,
        ),
        _Para(
          'Was dabei passiert ist: Über zehntausende von Jahren haben wir uns '
          'gemeinsam mit Mikroben entwickelt. Unser Immunsystem hat gelernt, mit '
          'ihnen umzugehen. Das Mikrobiom — die Milliarden von Mikroorganismen '
          'in unserem Verdauungstrakt — ist kein Nebenprodukt der Evolution, '
          'sondern ein aktiver Teil davon.',
        ),
        _Para(
          'Fermentierte Lebensmittel liefern genau das, was dieses System braucht: '
          'lebende Mikroorganismen, die die Darmflora bevölkern, stabilisieren und '
          'in ihrer Vielfalt erhöhen. Diversität ist dabei der entscheidende Faktor.',
        ),
        _Para(
          'Darm und Gehirn kommunizieren ständig miteinander — über den Vagusnerv, '
          'Hormone, und Botenstoffe, die ausschließlich im Darm produziert werden.',
        ),
        _Para(
          'Hochverarbeitete Lebensmittel, Antibiotika, sterile Umgebungen — das '
          'alles hat das Mikrobiom des durchschnittlichen Westeuropäers ärmer '
          'gemacht als das von Jäger-Sammler-Gesellschaften, die an keiner unserer '
          'Zivilisationskrankheiten leiden.',
        ),
        _Para(
          'Fermentation ist keine Lifestyle-Entscheidung. Es ist eine Rückkehr zu '
          'etwas, das unsere Physiologie ohnehin erwartet.',
        ),
      ],
    );
  }
}

class _Para extends StatelessWidget {
  final String text;
  final bool bold;
  const _Para(this.text, {this.bold = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.lg),
      child: Text(
        text,
        style: (bold ? AppTextStyles.bodyMD : AppTextStyles.bodySM).copyWith(
          color: bold ? AppColors.onDark : AppColors.onDarkMuted,
          fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
    );
  }
}
