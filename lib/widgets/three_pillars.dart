import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/app_text.dart';
import '../i18n/language_scope.dart';
import 'mandala_layer.dart';

class ThreePillars extends StatelessWidget {
  const ThreePillars({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;

    return Container(
      color: AppColors.canvasLight,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: 0,
            right: 0,
            top: 40,
            child: Center(
              child: MandalaLayer(
                opacity: 0.05,
                size: 500,
                initialRotationDeg: 90,
                rotationSpeedSec: 0,
                invert: false,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
              vertical: AppSpacing.band,
            ),
            child: Column(
              children: [
                Text(t.pillarsEyebrow,
                    style: AppTextStyles.eyebrow.copyWith(
                        color: AppColors.brand, letterSpacing: 1.5)),
                const SizedBox(height: AppSpacing.lg),
                Text(t.pillarsHeading,
                    style: AppTextStyles.displayLG.copyWith(color: AppColors.ink),
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.band),
                if (isMobile)
                  Column(children: _cards(t))
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _cards(t)
                        .map((c) => Expanded(child: c))
                        .toList(),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _cards(AppText t) => [
    _PillarCard(
      icon: '🏃',
      title: 'Mobility & Fitness',
      body: t.pillarMobilityBody,
      badge: t.pillarMobilityBadge,
      featured: true,
      url: 'https://www.youtube.com/@SquatUniversity',
      linkLabel: '▶ Squat University',
    ),
    const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
    _PillarCard(
      icon: '🧘',
      title: 'Mind-Body Connection',
      body: t.pillarMindBodyBody,
      badge: t.pillarMindBodyBadge,
      url: 'https://www.geo.de/wissen/gesundheit/selbstheilung--so-aktivieren-sie-den--inneren-arzt--30178428.html',
      linkLabel: t.pillarReadArticle,
    ),
    const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
    _PillarCard(
      icon: '🌿',
      title: t.pillarNutritionTitle,
      body: t.pillarNutritionBody,
      badge: t.pillarNutritionBadge,
      linkLabel: t.pillarReadArticle,
      showArticle: true,
    ),
  ];
}

// ── Pillar Card ───────────────────────────────────────────────────────────────

class _PillarCard extends StatefulWidget {
  final String icon;
  final String title;
  final String body;
  final String badge;
  final bool featured;
  final String? url;
  final String? linkLabel;
  final bool showArticle;

  const _PillarCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.badge,
    this.featured = false,
    this.url,
    this.linkLabel,
    this.showArticle = false,
  });

  @override
  State<_PillarCard> createState() => _PillarCardState();
}

class _PillarCardState extends State<_PillarCard> {
  bool _articleOpen = false;

  Future<void> _handleTap() async {
    if (widget.showArticle) {
      setState(() => _articleOpen = !_articleOpen);
      return;
    }
    if (widget.url != null) {
      final uri = Uri.parse(widget.url!);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isInteractive = widget.url != null || widget.showArticle;

    return GestureDetector(
      onTap: isInteractive ? _handleTap : null,
      child: MouseRegion(
        cursor: isInteractive ? SystemMouseCursors.click : MouseCursor.defer,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(AppSpacing.xxl),
          decoration: BoxDecoration(
            color: AppColors.canvasLight,
            borderRadius: AppRadius.lg,
            border: Border.all(
              color: widget.featured ? AppColors.ink : AppColors.hairlineLight,
              width: widget.featured ? 1.5 : 1,
            ),
          ),
          child: AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            switchInCurve: Curves.easeOutCubic,
            switchOutCurve: Curves.easeInCubic,
            child: _articleOpen
                ? _NutritionArticle(
                    key: const ValueKey('article'),
                    onClose: () => setState(() => _articleOpen = false),
                  )
                : _DefaultContent(
                    key: const ValueKey('default'),
                    icon: widget.icon,
                    title: widget.title,
                    body: widget.body,
                    badge: widget.badge,
                    linkLabel: widget.linkLabel,
                  ),
          ),
        ),
      ),
    );
  }
}

// ── Default card content ──────────────────────────────────────────────────────

class _DefaultContent extends StatelessWidget {
  final String icon;
  final String title;
  final String body;
  final String badge;
  final String? linkLabel;

  const _DefaultContent({
    super.key,
    required this.icon,
    required this.title,
    required this.body,
    required this.badge,
    this.linkLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(icon, style: const TextStyle(fontSize: 32)),
        const SizedBox(height: AppSpacing.lg),
        Text(title,
            style: AppTextStyles.headingMD.copyWith(color: AppColors.ink)),
        const SizedBox(height: AppSpacing.lg),
        Text(body,
            style: AppTextStyles.bodyMD.copyWith(color: AppColors.stone)),
        const SizedBox(height: AppSpacing.xl),
        Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
              decoration: const BoxDecoration(
                color: AppColors.surfaceSoft,
                borderRadius: AppRadius.full,
              ),
              child: Text(badge,
                  style: AppTextStyles.label.copyWith(color: AppColors.ink)),
            ),
            if (linkLabel != null) ...[
              const Spacer(),
              Text(
                linkLabel!,
                style: AppTextStyles.buttonSM.copyWith(color: AppColors.brand),
              ),
            ],
          ],
        ),
      ],
    );
  }
}

// ── Ernährung inline article ──────────────────────────────────────────────────

class _NutritionArticle extends StatelessWidget {
  final VoidCallback onClose;
  const _NutritionArticle({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
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
              child: Text(t.nutritionArticleTag,
                  style: AppTextStyles.eyebrow.copyWith(color: AppColors.onDark)),
            ),
            GestureDetector(
              onTap: onClose,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: const Icon(Icons.close, color: AppColors.stone, size: 18),
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.lg),
        Text(
          t.nutritionArticleTitle,
          style: AppTextStyles.headingSM.copyWith(color: AppColors.ink),
        ),
        const SizedBox(height: AppSpacing.lg),
        for (var i = 0; i < t.nutritionArticleParas.length; i++)
          _Para(t.nutritionArticleParas[i], bold: i == 0),
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
          color: bold ? AppColors.ink : AppColors.stone,
          fontWeight: bold ? FontWeight.w500 : FontWeight.w400,
        ),
      ),
    );
  }
}
