import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';
import 'mandala_layer.dart';
import 'sticker_card.dart';
import 'cellular_resonance_background.dart';

class HeroSection extends StatefulWidget {
  final ScrollController? scrollController;
  const HeroSection({super.key, this.scrollController});

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with TickerProviderStateMixin {
  late final AnimationController _ctrl;

  // 7 slots: eyebrow, Dein, Körper, erinnert, sich., divider, body
  static const _count = 7;
  late final List<Animation<Offset>> _slides;
  late final List<Animation<double>> _fades;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000),
    );

    _slides = List.generate(_count, (i) {
      final start = i * 0.08;
      return Tween<Offset>(
        begin: const Offset(0, 1),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: _ctrl,
        curve: Interval(start, start + 0.38, curve: Curves.easeOutCubic),
      ));
    });

    _fades = List.generate(_count, (i) {
      final start = i * 0.08;
      return Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _ctrl,
        curve: Interval(start, start + 0.38, curve: Curves.easeOut),
      ));
    });

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  Widget _reveal(int slot, Widget child) {
    return ClipRect(
      child: FadeTransition(
        opacity: _fades[slot],
        child: SlideTransition(position: _slides[slot], child: child),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final size = MediaQuery.of(context).size;
    final isMobile = size.width < Breakpoints.tablet;
    final isDesktop = size.width >= Breakpoints.desktop;

    // Responsive headline size: 9vw clamped
    final headlineSize = (size.width * 0.09).clamp(40.0, 124.0);
    final headlineStyle = AppTextStyles.displayXXL.copyWith(
      color: AppColors.onDark,
      fontSize: headlineSize,
      letterSpacing: headlineSize * -0.025,
      height: 0.95,
    );

    return Container(
      color: AppColors.canvasDark,
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: isMobile ? size.height * 0.85 : size.height.toDouble(),
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Lebendiger 3D-Zellhintergrund („Cellular Resonance").
          // Nur auf Web aktiv; sonst No-op (Mandala bleibt der Hintergrund).
          const Positioned.fill(child: CellularResonanceBackground()),

          // Lesbarkeits-Scrim: an Ober-/Unterkante dunkler (Eyebrow & Body-Text),
          // in der Mitte transparenter, damit die Kunst hinter der Headline atmet.
          Positioned.fill(
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.canvasDark.withValues(alpha: 0.55),
                      AppColors.canvasDark.withValues(alpha: 0.30),
                      AppColors.canvasDark.withValues(alpha: 0.62),
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // Mandala outer layer — large, slow clockwise
          Positioned(
            right: -160,
            top: 0,
            bottom: 0,
            child: MandalaLayer(
              opacity: 0.10,
              size: 950,
              rotationSpeedSec: 80,
              clockwise: true,
              invert: true,
              scrollController: widget.scrollController,
              parallaxFactor: 0.15,
            ),
          ),
          // Mandala inner layer — smaller, counter-rotating, creates depth
          Positioned(
            right: -60,
            top: 0,
            bottom: 0,
            child: MandalaLayer(
              opacity: 0.07,
              size: 520,
              rotationSpeedSec: 55,
              clockwise: false,
              invert: true,
              scrollController: widget.scrollController,
              parallaxFactor: 0.22,
            ),
          ),

          // Main content
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── Top bar ──────────────────────────────────────────────
                SizedBox(
                  height: isDesktop ? size.height * 0.18 : AppSpacing.band,
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _reveal(
                          0,
                          Row(children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: const BoxDecoration(
                                color: AppColors.brand,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: AppSpacing.sm),
                            Text(t.heroEyebrow,
                                style: AppTextStyles.eyebrow.copyWith(
                                    color: AppColors.stone)),
                          ]),
                        ),
                        if (!isMobile)
                          _reveal(
                            0,
                            Text(t.heroMeta,
                                style: AppTextStyles.eyebrow.copyWith(
                                    color: AppColors.stone)),
                          ),
                      ],
                    ),
                  ),
                ),

                // ── Headline + Card ──────────────────────────────────────
                isMobile
                    ? _MobileHeadline(
                        headlineStyle: headlineStyle,
                        reveal: _reveal,
                        lines: t.heroHeadlineLines,
                      )
                    : _DesktopHeadline(
                        headlineStyle: headlineStyle,
                        reveal: _reveal,
                        screenHeight: size.height,
                        lines: t.heroHeadlineLines,
                      ),

                // ── Hairline divider ─────────────────────────────────────
                _reveal(
                  5,
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: AppSpacing.xxl),
                    child: Divider(
                      color: AppColors.hairlineDark,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ),

                // ── Body + CTAs ──────────────────────────────────────────
                _reveal(
                  6,
                  isMobile
                      ? _BodyMobile()
                      : _BodyDesktop(),
                ),

                SizedBox(height: isDesktop ? size.height * 0.10 : AppSpacing.band),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ── Desktop: headline left, card floats right ────────────────────────────────

class _DesktopHeadline extends StatelessWidget {
  final TextStyle headlineStyle;
  final Widget Function(int, Widget) reveal;
  final double screenHeight;
  final List<String> lines;

  const _DesktopHeadline({
    required this.headlineStyle,
    required this.reveal,
    required this.screenHeight,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.52,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Headline words. FittedBox(scaleDown) verhindert, dass überlange
          // Wörter ("erinnert") bei mittleren Desktop-Breiten aus ihrer Spalte
          // laufen (RenderFlex-Overflow). Bei breiten Viewports passiert nichts
          // (No-op), die Headline behält dort ihre volle Größe.
          Expanded(
            flex: 5,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  for (var i = 0; i < lines.length; i++)
                    reveal(
                      (i + 1).clamp(1, 4),
                      Text(lines[i],
                          style: i == lines.length - 1
                              ? headlineStyle.copyWith(color: AppColors.brand)
                              : headlineStyle),
                    ),
                ],
              ),
            ),
          ),
          const SizedBox(width: AppSpacing.xxl),
          // Sticker card — fixed width so Row layout doesn't break at tablet sizes
          SizedBox(
            width: 300,
            child: reveal(4, const StickerCard()),
          ),
          const SizedBox(width: AppSpacing.xxl),
          // Article
          Expanded(
            flex: 3,
            child: reveal(4, const _ArticlePreview()),
          ),
        ],
      ),
    );
  }
}

class _ArticlePreview extends StatelessWidget {
  const _ArticlePreview();

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    // Bis es einen eigenen Fermentation-Artikel gibt, führt die Vorschau zur
    // Blog-Übersicht. Die ganze Karte ist klickbar (Hand-Cursor auf Web).
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => GoRouter.of(context).go('/blog'),
        child: Container(
          padding: const EdgeInsets.all(AppSpacing.xxl),
          decoration: BoxDecoration(
            color: AppColors.surfaceElevated,
            borderRadius: AppRadius.xl,
            border: Border.all(color: AppColors.hairlineDark),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // Category tag
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
                decoration: const BoxDecoration(
                  color: AppColors.brand,
                  borderRadius: AppRadius.full,
                ),
                child: Text(t.fermentTag,
                    style: AppTextStyles.eyebrow
                        .copyWith(color: AppColors.onDark)),
              ),
              const SizedBox(height: AppSpacing.lg),

              // Title
              Text(
                t.fermentTitle,
                style: AppTextStyles.headingSM.copyWith(color: AppColors.onDark),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.lg),

              // Lead
              Text(
                t.fermentParas[0],
                style: AppTextStyles.bodySM
                    .copyWith(color: AppColors.onDarkMuted),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.xxl),

              // Read more
              Text(t.linkReadMore,
                  style:
                      AppTextStyles.buttonSM.copyWith(color: AppColors.brand)),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Mobile: stacked ──────────────────────────────────────────────────────────

class _MobileHeadline extends StatelessWidget {
  final TextStyle headlineStyle;
  final Widget Function(int, Widget) reveal;
  final List<String> lines;

  const _MobileHeadline({
    required this.headlineStyle,
    required this.reveal,
    required this.lines,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: AppSpacing.xl),
        for (var i = 0; i < lines.length; i++)
          reveal(
            (i + 1).clamp(1, 4),
            Text(lines[i],
                style: i == lines.length - 1
                    ? headlineStyle.copyWith(color: AppColors.brand)
                    : headlineStyle),
          ),
        const SizedBox(height: AppSpacing.xxl),
        reveal(4, const StickerCard()),
      ],
    );
  }
}

// ── Body row ─────────────────────────────────────────────────────────────────

class _BodyDesktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 5,
          child: Text(t.heroBody,
              style: AppTextStyles.bodyLG.copyWith(
                  color: AppColors.onDarkMuted)),
        ),
        const SizedBox(width: AppSpacing.band),
        Expanded(
          flex: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(t.heroSubline,
                  style: AppTextStyles.eyebrow.copyWith(
                      color: AppColors.stone, letterSpacing: 1.2)),
              const SizedBox(height: AppSpacing.xxl),
              Wrap(
                spacing: AppSpacing.lg,
                runSpacing: AppSpacing.lg,
                children: [
                  FilledButton(
                    onPressed: () => GoRouter.of(context).go('/booking'),
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.canvasLight,
                      foregroundColor: AppColors.canvasDark,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xxl,
                          vertical: AppSpacing.md),
                      shape: const StadiumBorder(),
                      textStyle: AppTextStyles.buttonLG,
                    ),
                    child: Text(t.ctaPrimary),
                  ),
                  OutlinedButton(
                    onPressed: () => GoRouter.of(context).go('/blog'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.onDark,
                      side: const BorderSide(color: AppColors.hairlineDark),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xxl,
                          vertical: AppSpacing.md),
                      shape: const StadiumBorder(),
                      textStyle: AppTextStyles.buttonLG,
                    ),
                    child: Text(t.ctaSecondary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _BodyMobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.heroBody,
            style: AppTextStyles.bodyMD.copyWith(
                color: AppColors.onDarkMuted)),
        const SizedBox(height: AppSpacing.xl),
        Text(t.heroSubline,
            style: AppTextStyles.eyebrow.copyWith(
                color: AppColors.stone, letterSpacing: 1.2)),
        const SizedBox(height: AppSpacing.xxl),
        Wrap(
          spacing: AppSpacing.lg,
          runSpacing: AppSpacing.lg,
          children: [
            FilledButton(
              onPressed: () => GoRouter.of(context).go('/booking'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.canvasLight,
                foregroundColor: AppColors.canvasDark,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxl, vertical: AppSpacing.md),
                shape: const StadiumBorder(),
                textStyle: AppTextStyles.buttonLG,
              ),
              child: Text(t.ctaPrimary),
            ),
            OutlinedButton(
              onPressed: () => GoRouter.of(context).go('/blog'),
              style: OutlinedButton.styleFrom(
                foregroundColor: AppColors.onDark,
                side: const BorderSide(color: AppColors.hairlineDark),
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxl, vertical: AppSpacing.md),
                shape: const StadiumBorder(),
                textStyle: AppTextStyles.buttonLG,
              ),
              child: Text(t.ctaSecondary),
            ),
          ],
        ),
      ],
    );
  }
}
