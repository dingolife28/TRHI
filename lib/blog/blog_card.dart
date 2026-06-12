import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/app_lang.dart';
import '../i18n/language_scope.dart';
import 'blog_data.dart';

class BlogCard extends StatelessWidget {
  final BlogPost post;
  final bool onDark;

  const BlogCard({super.key, required this.post, this.onDark = false});

  @override
  Widget build(BuildContext context) {
    final lang = context.lang;
    final t = context.t;
    final bg = onDark ? AppColors.surfaceElevated : AppColors.surfaceSoft;
    final titleColor = onDark ? AppColors.onDark : AppColors.ink;
    final bodyColor = onDark ? AppColors.onDarkMuted : AppColors.stone;
    final dateStr = DateFormat('d. MMM yyyy', lang.code).format(post.publishedAt);

    return GestureDetector(
      onTap: () => context.go('/blog/${post.slug}'),
      child: Container(
        padding: const EdgeInsets.all(AppSpacing.xxl),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: AppRadius.lg,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
              decoration: const BoxDecoration(
                color: AppColors.brand,
                borderRadius: AppRadius.full,
              ),
              child: Text(post.tagOf(lang),
                  style: AppTextStyles.eyebrow.copyWith(
                      color: AppColors.onDark)),
            ),

            const SizedBox(height: AppSpacing.lg),

            Text(post.titleOf(lang),
                style: AppTextStyles.headingMD.copyWith(color: titleColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),

            const SizedBox(height: AppSpacing.lg),

            Text(post.teaserOf(lang),
                style: AppTextStyles.bodySM.copyWith(color: bodyColor),
                maxLines: 3,
                overflow: TextOverflow.ellipsis),

            const SizedBox(height: AppSpacing.xl),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Text(t.cardMeta(post.readingTimeMin, dateStr),
                      style: AppTextStyles.caption.copyWith(color: AppColors.stone),
                      overflow: TextOverflow.ellipsis),
                ),
                const SizedBox(width: AppSpacing.sm),
                Text(t.linkReadMore,
                    style: AppTextStyles.buttonSM.copyWith(
                        color: AppColors.brand)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
