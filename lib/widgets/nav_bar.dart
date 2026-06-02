import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';

class TrhiNavBar extends StatelessWidget {
  const TrhiNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < Breakpoints.desktop;

    return Positioned(
      top: 0, left: 0, right: 0,
      child: Container(
        height: 64,
        decoration: const BoxDecoration(
          color: AppColors.canvasDark,
          border: Border(bottom: BorderSide(color: AppColors.hairlineDark)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xl),
        child: Row(
          children: [
            // Logo + brand name
            Row(
              children: [
                Image.asset('assets/trhi_logo.png', width: 44, height: 44,
                    color: AppColors.onDark),
                const SizedBox(width: AppSpacing.sm),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('TRHI',
                        style: AppTextStyles.headingSM.copyWith(
                            color: AppColors.onDark)),
                    Text('The Real Health Insurance',
                        style: AppTextStyles.eyebrow.copyWith(
                            color: AppColors.brand)),
                  ],
                ),
              ],
            ),

            const Spacer(),

            if (!isMobile) ...[
              _NavLink('Training'),
              _NavLink('Mind-Body'),
              _NavLink('Ernährung'),
              _NavLink('YouTube'),
              _NavLink('Buchen', onTap: () => context.go('/booking')),
              const SizedBox(width: AppSpacing.lg),
            ],

            // CTA button
            FilledButton(
              onPressed: () => context.go('/booking'),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.canvasLight,
                foregroundColor: AppColors.canvasDark,
                padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.xxl, vertical: AppSpacing.md),
                shape: const StadiumBorder(),
                textStyle: AppTextStyles.buttonLG,
              ),
              child: const Text('Erstgespräch'),
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
      child: GestureDetector(
        onTap: onTap,
        child: Text(label,
            style: AppTextStyles.bodyMD.copyWith(color: AppColors.onDark)),
      ),
    );
  }
}
