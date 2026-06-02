import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer_widget.dart';
import '../widgets/mandala_layer.dart';
import 'blog_data.dart';
import 'blog_card.dart';

class BlogArticleScreen extends StatelessWidget {
  final String slug;
  const BlogArticleScreen({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    final post = getPostBySlug(slug);
    if (post == null) return _NotFound();

    final related = blogPosts
        .where((p) => p.slug != slug)
        .take(3)
        .toList();

    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final dateStr = DateFormat('d. MMMM yyyy', 'de').format(post.publishedAt);

    return Scaffold(
      backgroundColor: AppColors.canvasDark,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),

                // Dark header
                Container(
                  color: AppColors.canvasDark,
                  width: double.infinity,
                  child: Stack(
                    children: [
                      Positioned(
                        right: -60,
                        top: 0,
                        bottom: 0,
                        child: MandalaLayer(
                          opacity: 0.07,
                          size: 500,
                          rotationSpeedSec: 90,
                          invert: true,
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
                            Row(children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSpacing.lg,
                                    vertical: AppSpacing.xs),
                                decoration: const BoxDecoration(
                                  color: AppColors.brand,
                                  borderRadius: AppRadius.full,
                                ),
                                child: Text(post.category,
                                    style: AppTextStyles.eyebrow.copyWith(
                                        color: AppColors.onDark)),
                              ),
                              const SizedBox(width: AppSpacing.lg),
                              Text(dateStr,
                                  style: AppTextStyles.caption.copyWith(
                                      color: AppColors.stone)),
                            ]),
                            const SizedBox(height: AppSpacing.xl),
                            Text(post.title,
                                style: AppTextStyles.displayXL.copyWith(
                                    color: AppColors.onDark)),
                            const SizedBox(height: AppSpacing.lg),
                            Text('TRHI · ${post.readingTimeMin} min Lesezeit',
                                style: AppTextStyles.caption.copyWith(
                                    color: AppColors.stone)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Light content
                Container(
                  color: AppColors.canvasLight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                    vertical: AppSpacing.band,
                  ),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 680),
                      child: _ArticleBody(post: post),
                    ),
                  ),
                ),

                // Related articles
                if (related.isNotEmpty)
                  Container(
                    color: AppColors.surfaceSoft,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                      vertical: AppSpacing.band,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Weitere Artikel',
                            style: AppTextStyles.headingMD.copyWith(
                                color: AppColors.ink)),
                        const SizedBox(height: AppSpacing.xl),
                        isMobile
                            ? Column(
                                children: related
                                    .map((p) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: AppSpacing.xl),
                                          child: BlogCard(post: p),
                                        ))
                                    .toList(),
                              )
                            : Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: related
                                    .map((p) => Expanded(
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              right: p == related.last
                                                  ? 0
                                                  : AppSpacing.xl,
                                            ),
                                            child: BlogCard(post: p),
                                          ),
                                        ))
                                    .toList(),
                              ),
                      ],
                    ),
                  ),

                // CTA band
                Container(
                  color: AppColors.canvasDark,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                    vertical: AppSpacing.band,
                  ),
                  child: Column(
                    children: [
                      Text('Bereit loszulegen?',
                          style: AppTextStyles.displayLG.copyWith(
                              color: AppColors.onDark),
                          textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.lg),
                      Text('Erstgespräch kostenlos. Kein Druck. Kein Verkauf.',
                          style: AppTextStyles.bodyLG.copyWith(
                              color: AppColors.onDarkMuted),
                          textAlign: TextAlign.center),
                      const SizedBox(height: AppSpacing.xxl),
                      FilledButton(
                        onPressed: () => context.go('/booking'),
                        style: FilledButton.styleFrom(
                          backgroundColor: AppColors.canvasLight,
                          foregroundColor: AppColors.canvasDark,
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xxl,
                              vertical: AppSpacing.md),
                          shape: const StadiumBorder(),
                          textStyle: AppTextStyles.buttonLG,
                        ),
                        child: const Text('Erstgespräch buchen'),
                      ),
                    ],
                  ),
                ),

                const FooterWidget(),
              ],
            ),
          ),
          const TrhiNavBar(),
        ],
      ),
    );
  }
}

class _ArticleBody extends StatelessWidget {
  final BlogPost post;
  const _ArticleBody({required this.post});

  @override
  Widget build(BuildContext context) {
    final paragraphs = post.content.split('\n\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: paragraphs.map((para) {
        final isNumbered = RegExp(r'^\d+\.').hasMatch(para.trim());
        final isSingleLine = !para.contains('\n');

        if (isSingleLine && para.trim().length < 60 && !isNumbered) {
          // Short lines = subheadings
          return Padding(
            padding: const EdgeInsets.only(
                top: AppSpacing.xxl, bottom: AppSpacing.sm),
            child: Text(para.trim(),
                style: AppTextStyles.headingSM.copyWith(color: AppColors.ink)),
          );
        }

        // Check for blockquote-style (starts with ")
        if (para.trim().startsWith('"') || para.trim().startsWith('„')) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: AppSpacing.xl),
            child: Container(
              padding: const EdgeInsets.only(left: AppSpacing.lg),
              decoration: const BoxDecoration(
                border: Border(
                    left: BorderSide(color: AppColors.brand, width: 3)),
              ),
              child: Text(para.trim(),
                  style: AppTextStyles.bodyLG.copyWith(
                      color: AppColors.ink, fontStyle: FontStyle.italic)),
            ),
          );
        }

        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.lg),
          child: Text(para.trim(),
              style: AppTextStyles.bodyLG.copyWith(color: AppColors.ink)),
        );
      }).toList(),
    );
  }
}

class _NotFound extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.canvasDark,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Artikel nicht gefunden.',
                style: AppTextStyles.headingLG.copyWith(
                    color: AppColors.onDark)),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: () => context.go('/blog'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.brand,
                shape: const StadiumBorder(),
              ),
              child: Text('Zurück zum Journal',
                  style: AppTextStyles.buttonLG.copyWith(
                      color: AppColors.onDark)),
            ),
          ],
        ),
      ),
    );
  }
}
