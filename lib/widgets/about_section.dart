import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';
import 'mandala_layer.dart';
import 'biopulse_background.dart';

class AboutSection extends StatelessWidget {
  final ScrollController? scrollController;
  const AboutSection({super.key, this.scrollController});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;

    return Container(
      color: AppColors.canvasDark,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Biopulse-Partikel als lebendiger Hintergrund („zweites schwarzes
          // Feld"). Nicht-interaktiv; Scroll/Tap gehen an die UI durch.
          const Positioned.fill(child: BiopulseBackground()),

          // Lesbarkeits-Scrim: hält den text-dichten About-Block über den
          // Partikeln lesbar, lässt die Kunst aber sichtbar atmen.
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      // Auf Mobile läuft der Fließtext volle Breite über die
                      // hellsten Partikel — dort kräftiger abdunkeln. Desktop
                      // (Text in linker Spalte) bleibt luftiger.
                      AppColors.canvasDark.withValues(alpha: isMobile ? 0.70 : 0.60),
                      AppColors.canvasDark.withValues(alpha: isMobile ? 0.62 : 0.45),
                      AppColors.canvasDark.withValues(alpha: isMobile ? 0.74 : 0.66),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            right: -80,
            top: 0,
            bottom: 0,
            child: MandalaLayer(
              opacity: 0.08,
              size: 800,
              initialRotationDeg: 120,
              rotationSpeedSec: 100,
              clockwise: true,
              invert: true,
              scrollController: scrollController,
              parallaxFactor: 0.20,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
              vertical: AppSpacing.band,
            ),
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _Left(),
                      const SizedBox(height: AppSpacing.band),
                      _Right(),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: _Left()),
                      const SizedBox(width: AppSpacing.band),
                      Expanded(child: _Right()),
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}

class _Left extends StatefulWidget {
  @override
  State<_Left> createState() => _LeftState();
}

class _LeftState extends State<_Left> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.aboutEyebrow,
            style: AppTextStyles.eyebrow.copyWith(
                color: AppColors.brand, letterSpacing: 1.5)),
        const SizedBox(height: AppSpacing.lg),

        Text(t.aboutTitle,
            style: AppTextStyles.displayLG.copyWith(color: AppColors.onDark)),
        const SizedBox(height: AppSpacing.xxl),

        Text(t.aboutBody,
            style: AppTextStyles.bodyLG.copyWith(color: AppColors.onDarkMuted)),
        const SizedBox(height: AppSpacing.xxl),

        Container(
          padding: const EdgeInsets.only(left: AppSpacing.lg),
          decoration: const BoxDecoration(
            border: Border(left: BorderSide(color: AppColors.brand, width: 3)),
          ),
          child: Text(t.aboutQuote,
              style: AppTextStyles.bodyLG.copyWith(
                  color: AppColors.onDark, fontStyle: FontStyle.italic)),
        ),

        const SizedBox(height: AppSpacing.xxl),

        GestureDetector(
          onTap: () => setState(() => _open = !_open),
          child: Row(children: [
            Text(t.aboutDisclaimerToggle,
                style: AppTextStyles.bodySM.copyWith(color: AppColors.stone)),
            const SizedBox(width: AppSpacing.sm),
            Icon(_open ? Icons.expand_less : Icons.expand_more,
                color: AppColors.stone, size: 18),
          ]),
        ),
        if (_open) ...[
          const SizedBox(height: AppSpacing.lg),
          Text(t.disclaimer,
              style: AppTextStyles.caption.copyWith(color: AppColors.stone)),
        ],
      ],
    );
  }
}

class _Right extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    // Schmaler als 600px: drei Karten nebeneinander werden zu eng (der Titel
    // "Berufstätige" läuft sonst über) → vertikal stapeln.
    final isNarrow = MediaQuery.of(context).size.width < Breakpoints.mobile;

    final cards = [
      _AudienceCard('🧑‍💼', t.audienceProfessionals, t.audienceProfessionalsBody),
      _AudienceCard('👨‍👩‍👧', t.audienceParents, t.audienceParentsBody),
      _AudienceCard('🧓', t.audienceSeniors, t.audienceSeniorsBody),
    ];

    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(AppSpacing.xxl),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: AppRadius.lg,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(children: [
                Text('TRHI',
                    style: AppTextStyles.headingMD.copyWith(
                        color: AppColors.brand)),
                const SizedBox(width: AppSpacing.sm),
                Text(t.brandTagline,
                    style: AppTextStyles.label.copyWith(
                        color: AppColors.onDarkMuted)),
              ]),
              const SizedBox(height: AppSpacing.xl),
              Text(t.trhiMotto,
                  style: AppTextStyles.bodyLG.copyWith(
                      color: AppColors.onDark, fontStyle: FontStyle.italic)),
            ],
          ),
        ),

        const SizedBox(height: AppSpacing.xl),

        isNarrow
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  cards[0],
                  const SizedBox(height: AppSpacing.lg),
                  cards[1],
                  const SizedBox(height: AppSpacing.lg),
                  cards[2],
                ],
              )
            : Row(children: [
                Expanded(child: cards[0]),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: cards[1]),
                const SizedBox(width: AppSpacing.lg),
                Expanded(child: cards[2]),
              ]),
      ],
    );
  }
}

class _AudienceCard extends StatelessWidget {
  final String emoji;
  final String title;
  final String body;
  const _AudienceCard(this.emoji, this.title, this.body);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: AppRadius.md,
        border: Border.all(color: AppColors.hairlineDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 24)),
          const SizedBox(height: AppSpacing.sm),
          Text(title,
              style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark)),
          const SizedBox(height: AppSpacing.xs),
          Text(body,
              style: AppTextStyles.caption.copyWith(color: AppColors.stone)),
        ],
      ),
    );
  }
}
