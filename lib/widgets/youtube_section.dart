import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import 'mandala_layer.dart';

class YoutubeSection extends StatelessWidget {
  final ScrollController? scrollController;
  const YoutubeSection({super.key, this.scrollController});

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
          Positioned(
            left: -60,
            top: 0,
            bottom: 0,
            child: Center(
              child: MandalaLayer(
                opacity: 0.07,
                size: 600,
                initialRotationDeg: 270,
                rotationSpeedSec: 90,
                clockwise: true,
                invert: true,
                scrollController: scrollController,
                parallaxFactor: 0.12,
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
                Text('TRHI auf YouTube & mehr.',
                    style: AppTextStyles.headingLG.copyWith(
                        color: AppColors.onDark),
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.sm),
                Text('Gutes Wissen kennt keine Grenzen.',
                    style: AppTextStyles.bodyLG.copyWith(
                        color: AppColors.onDarkMuted),
                    textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.band),

                if (isMobile)
                  Column(children: _channelCards())
                else
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _channelCards()
                        .map((c) => Expanded(child: c))
                        .toList(),
                  ),

                const SizedBox(height: AppSpacing.xxl),

                Container(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  decoration: BoxDecoration(
                    color: AppColors.surfaceElevated,
                    borderRadius: AppRadius.md,
                  ),
                  child: Text(
                    'TRHI hat keine bezahlte Partnerschaft mit empfohlenen Kanälen. '
                    'Bildung geht uns vor Werbung.',
                    style: AppTextStyles.caption.copyWith(color: AppColors.stone),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _channelCards() => [
    _ChannelCard(
      name: 'TRHI',
      handle: '@TRHI',
      description: 'Mobility, Ernährung, Mind-Body — für Berufstätige, Eltern, 50+',
      url: 'https://youtube.com/@TRHI',
      badgeLabel: 'TRHI',
      badgeColor: AppColors.brand,
      ctaLabel: 'Abonnieren',
    ),
    const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
    _ChannelCard(
      name: 'Squat University',
      handle: '@SquatUniversity',
      description: 'Dr. Aaron Horschig — Physiotherapeut & Kraft-Coach. '
          'Wissenschaftlich fundierte Mobility-Arbeit. Pflicht für jeden mit Gelenken.',
      url: 'https://youtube.com/@SquatUniversity',
      badgeLabel: 'Empfohlen',
      badgeColor: Colors.red,
      ctaLabel: 'Besuchen →',
    ),
    const SizedBox(width: AppSpacing.xl, height: AppSpacing.xl),
    _ChannelCard(
      name: 'Dr. John Campbell',
      handle: '@Campbellteaching',
      description: 'Gesundheit, Ernährung, medizinische Forschung klar erklärt. '
          'Für Menschen die verstehen wollen, nicht nur folgen.',
      url: 'https://youtube.com/@Campbellteaching',
      badgeLabel: 'Empfohlen',
      badgeColor: Colors.red,
      ctaLabel: 'Besuchen →',
    ),
  ];
}

class _ChannelCard extends StatelessWidget {
  final String name;
  final String handle;
  final String description;
  final String url;
  final String badgeLabel;
  final Color badgeColor;
  final String ctaLabel;

  const _ChannelCard({
    required this.name,
    required this.handle,
    required this.description,
    required this.url,
    required this.badgeLabel,
    required this.badgeColor,
    required this.ctaLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.xxl),
      decoration: BoxDecoration(
        color: AppColors.surfaceElevated,
        borderRadius: AppRadius.lg,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.lg, vertical: AppSpacing.xs),
            decoration: BoxDecoration(
              color: badgeColor,
              borderRadius: AppRadius.full,
            ),
            child: Text(badgeLabel,
                style: AppTextStyles.label.copyWith(color: AppColors.onDark)),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(name,
              style: AppTextStyles.headingMD.copyWith(color: AppColors.onDark)),
          Text(handle,
              style: AppTextStyles.caption.copyWith(color: AppColors.stone)),
          const SizedBox(height: AppSpacing.lg),
          Text(description,
              style: AppTextStyles.bodyMD.copyWith(color: AppColors.onDarkMuted)),
          const SizedBox(height: AppSpacing.xl),
          GestureDetector(
            onTap: () => launchUrl(Uri.parse(url)),
            child: Text(ctaLabel,
                style: AppTextStyles.buttonSM.copyWith(color: AppColors.brand)),
          ),
        ],
      ),
    );
  }
}
