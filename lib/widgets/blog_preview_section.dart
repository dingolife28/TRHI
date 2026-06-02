import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../blog/blog_data.dart';
import '../blog/blog_card.dart';
import 'mandala_layer.dart';

class BlogPreviewSection extends StatelessWidget {
  const BlogPreviewSection({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.tablet;
    final preview = blogPosts.take(3).toList();

    return Container(
      color: AppColors.canvasLight,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -60,
            bottom: -60,
            child: MandalaLayer(
              opacity: 0.05,
              size: 450,
              initialRotationDeg: 220,
              rotationSpeedSec: 0,
              invert: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
              vertical: AppSpacing.band,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('TRHI Journal',
                    style: AppTextStyles.eyebrow.copyWith(
                        color: AppColors.brand, letterSpacing: 1.5)),
                const SizedBox(height: AppSpacing.lg),
                Text('Einmal pro Woche.\nImmer mit Grund.',
                    style: AppTextStyles.displayLG.copyWith(
                        color: AppColors.ink)),
                const SizedBox(height: AppSpacing.lg),
                Text(
                  'Kein Newsletter-Blödsinn. Nur das, was gerade wichtig ist — '
                  'ob Feiertag, Jahreszeit oder das, was die Wissenschaft diese Woche rausgefunden hat.',
                  style: AppTextStyles.bodyLG.copyWith(color: AppColors.stone),
                ),
                const SizedBox(height: AppSpacing.band),

                if (isMobile)
                  Column(
                    children: preview
                        .map((p) => Padding(
                              padding: const EdgeInsets.only(
                                  bottom: AppSpacing.xl),
                              child: BlogCard(post: p),
                            ))
                        .toList(),
                  )
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: preview
                        .map((p) => Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: p == preview.last
                                      ? 0
                                      : AppSpacing.xl,
                                ),
                                child: BlogCard(post: p),
                              ),
                            ))
                        .toList(),
                  ),

                const SizedBox(height: AppSpacing.xxl),

                Center(
                  child: OutlinedButton(
                    onPressed: () => context.go('/blog'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.ink,
                      side: const BorderSide(color: AppColors.ink),
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.xxl,
                          vertical: AppSpacing.md),
                      shape: const StadiumBorder(),
                      textStyle: AppTextStyles.buttonLG,
                    ),
                    child: const Text('Alle Artikel lesen →'),
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
