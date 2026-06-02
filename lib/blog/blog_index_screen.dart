import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../widgets/nav_bar.dart';
import '../widgets/footer_widget.dart';
import 'blog_data.dart';
import 'blog_card.dart';

const _categories = ['Alle', 'Fitness', 'Ernährung', 'Mind-Body', 'Wissenschaft', 'Saisonal'];

class BlogIndexScreen extends StatefulWidget {
  const BlogIndexScreen({super.key});

  @override
  State<BlogIndexScreen> createState() => _BlogIndexScreenState();
}

class _BlogIndexScreenState extends State<BlogIndexScreen> {
  String _selectedCategory = 'Alle';

  @override
  Widget build(BuildContext context) {
    final filtered = getPostsByCategory(_selectedCategory);
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.mobile;
    final isTablet = width < Breakpoints.tablet;

    return Scaffold(
      backgroundColor: AppColors.canvasDark,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 64),

                // Header band (dark)
                Container(
                  color: AppColors.canvasDark,
                  width: double.infinity,
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
                              color: AppColors.onDark)),
                      const SizedBox(height: AppSpacing.lg),
                      Text(
                        'Fitness · Ernährung · Mentale Stärke — verbunden mit dem, was gerade passiert.',
                        style: AppTextStyles.bodyLG.copyWith(
                            color: AppColors.onDarkMuted),
                      ),
                    ],
                  ),
                ),

                // Filter pills (light)
                Container(
                  color: AppColors.canvasLight,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                    vertical: AppSpacing.xl,
                  ),
                  child: Wrap(
                    spacing: AppSpacing.sm,
                    runSpacing: AppSpacing.sm,
                    children: _categories.map((cat) {
                      final sel = _selectedCategory == cat;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedCategory = cat),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.xl,
                              vertical: AppSpacing.xs),
                          decoration: BoxDecoration(
                            color: sel
                                ? AppColors.canvasDark
                                : AppColors.surfaceSoft,
                            borderRadius: AppRadius.full,
                          ),
                          child: Text(cat,
                              style: AppTextStyles.label.copyWith(
                                  color: sel
                                      ? AppColors.onDark
                                      : AppColors.ink)),
                        ),
                      );
                    }).toList(),
                  ),
                ),

                // Article grid (light)
                Container(
                  color: AppColors.canvasLight,
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                    vertical: AppSpacing.xxl,
                  ),
                  child: filtered.isEmpty
                      ? Center(
                          child: Padding(
                            padding: const EdgeInsets.all(AppSpacing.band),
                            child: Text('Keine Artikel in dieser Kategorie.',
                                style: AppTextStyles.bodyLG.copyWith(
                                    color: AppColors.stone)),
                          ),
                        )
                      : isTablet
                          ? Column(
                              children: filtered
                                  .map((p) => Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: AppSpacing.xl),
                                        child: BlogCard(post: p),
                                      ))
                                  .toList(),
                            )
                          : _DesktopGrid(posts: filtered),
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

class _DesktopGrid extends StatelessWidget {
  final List<BlogPost> posts;
  const _DesktopGrid({required this.posts});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < posts.length; i += 3) {
      final rowPosts = posts.skip(i).take(3).toList();
      rows.add(
        Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.xl),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var j = 0; j < rowPosts.length; j++) ...[
                Expanded(child: BlogCard(post: rowPosts[j])),
                if (j < rowPosts.length - 1)
                  const SizedBox(width: AppSpacing.xl),
              ],
              // fill empty columns
              for (var k = rowPosts.length; k < 3; k++) ...[
                const SizedBox(width: AppSpacing.xl),
                const Expanded(child: SizedBox()),
              ],
            ],
          ),
        ),
      );
    }
    return Column(children: rows);
  }
}
