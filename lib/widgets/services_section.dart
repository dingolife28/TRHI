import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';
import 'mandala_layer.dart';

class ServicesSection extends StatelessWidget {
  const ServicesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.t;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;

    return Container(
      color: AppColors.surfaceElevated,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -80,
            top: 0,
            child: MandalaLayer(
              opacity: 0.07,
              size: 400,
              initialRotationDeg: 180,
              rotationSpeedSec: 70,
              clockwise: false,
              invert: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
              vertical: AppSpacing.band,
            ),
            child: Column(
              children: [
                Text(t.servicesHeading,
                    style: AppTextStyles.headingLG.copyWith(
                        color: AppColors.onDark),
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.sm),
                Text(t.servicesSubheading,
                    style: AppTextStyles.bodyLG.copyWith(
                        color: AppColors.onDarkMuted),
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.band),
                if (isMobile)
                  Column(children: _cards(context))
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _cards(context)
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

  List<Widget> _cards(BuildContext context) {
    final t = context.t;
    return [
      _ServiceCard(
        icon: '🎯',
        title: '1:1 Coaching',
        body: t.service1Body,
        price: t.service1Price,
        cta: t.service1Cta,
        onTap: () => context.go('/booking'),
      ),
      const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
      _ServiceCard(
        icon: '📋',
        title: 'Health Consulting',
        body: t.service2Body,
        price: t.service2Price,
        cta: t.service2Cta,
        featured: true,
        onTap: () => context.go('/booking'),
      ),
      const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
      _ServiceCard(
        icon: '🦵',
        title: 'Mobility & Rehab',
        body: t.service3Body,
        price: t.service3Price,
        cta: t.service3Cta,
        onTap: () => context.go('/booking'),
      ),
    ];
  }
}

class _ServiceCard extends StatelessWidget {
  final String icon;
  final String title;
  final String body;
  final String price;
  final String cta;
  final bool featured;
  final VoidCallback onTap;

  const _ServiceCard({
    required this.icon,
    required this.title,
    required this.body,
    required this.price,
    required this.cta,
    required this.onTap,
    this.featured = false,
  });

  @override
  Widget build(BuildContext context) {
    final bg = featured ? AppColors.brand : AppColors.canvasDark;
    final mutedColor = featured
        ? AppColors.onDark.withValues(alpha: 0.7)
        : AppColors.stone;

    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: AppRadius.lg,
        border: featured ? null : Border.all(color: AppColors.hairlineDark),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (featured)
            Container(
              margin: const EdgeInsets.only(bottom: AppSpacing.lg),
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
              decoration: BoxDecoration(
                color: AppColors.canvasDark.withValues(alpha: 0.3),
                borderRadius: AppRadius.full,
              ),
              child: Text(context.t.featuredBadge,
                  style: AppTextStyles.label.copyWith(color: AppColors.onDark)),
            ),
          Text(icon, style: const TextStyle(fontSize: 32)),
          const SizedBox(height: AppSpacing.lg),
          Text(title,
              style: AppTextStyles.headingMD.copyWith(color: AppColors.onDark)),
          const SizedBox(height: AppSpacing.sm),
          Text(body,
              style: AppTextStyles.bodyMD.copyWith(color: mutedColor)),
          const SizedBox(height: AppSpacing.xl),
          Text(price,
              style: AppTextStyles.label.copyWith(color: mutedColor)),
          const SizedBox(height: AppSpacing.lg),
          GestureDetector(
            onTap: onTap,
            child: Text(cta,
                style: AppTextStyles.buttonLG.copyWith(color: AppColors.onDark)),
          ),
        ],
      ),
    );
  }
}
