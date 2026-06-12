import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../i18n/language_scope.dart';
import 'mandala_layer.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < Breakpoints.tablet;

    // ── Footer-Bausteine (für Desktop-Row und Mobile-Column identisch) ──
    // Nur das (leicht vergrößerte) Logo — "TRHI" als Text entfällt
    // (Wortmarke steckt bereits im Logo).
    final brand = Image.asset('assets/trhi_logo.png',
        width: 44, height: 44,
        color: AppColors.onDark,
        errorBuilder: (context, error, stack) => const Icon(
            Icons.fitness_center, color: AppColors.onDark, size: 44));

    final tagline = Text(context.t.footerTagline,
        style: AppTextStyles.caption.copyWith(color: AppColors.stone));

    final qr = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Festes quadratisches Feld + QR ohne `size` füllt es vollständig —
        // verhindert das vertikale Abschneiden des Codes.
        SizedBox(
          width: 84,
          height: 84,
          child: QrImageView(
            data: 'https://trhi.net',
            version: QrVersions.auto,
            padding: const EdgeInsets.all(8),
            backgroundColor: Colors.white,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Colors.black,
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.square,
              color: Colors.black,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text('trhi.net',
            style: AppTextStyles.caption.copyWith(color: AppColors.stone)),
      ],
    );

    final copyright = Text('© 2025 TRHI',
        style: AppTextStyles.caption.copyWith(color: AppColors.stone));

    return Container(
      color: AppColors.canvasDark,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            right: -50,
            top: 0,
            bottom: 0,
            child: Center(
              child: MandalaLayer(
                opacity: 0.04,
                size: 900,
                initialRotationDeg: 320,
                rotationSpeedSec: 150,
                clockwise: true,
                invert: true,
              ),
            ),
          ),
          Container(
            // Volle Breite, damit der Top-Hairline durchläuft (sonst shrink-wrap
            // in der Stack mit losen Constraints).
            width: double.infinity,
            // band (120px) ist auf Mobile zu breit → auf xl (24px) reduzieren.
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? AppSpacing.xl : AppSpacing.band,
                vertical: AppSpacing.xxl),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.hairlineDark)),
            ),
            // Mobile: linksbündig gestapelt (4 Items passen nicht nebeneinander).
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      brand,
                      const SizedBox(height: AppSpacing.xl),
                      tagline,
                      const SizedBox(height: AppSpacing.xl),
                      qr,
                      const SizedBox(height: AppSpacing.xl),
                      copyright,
                    ],
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [brand, tagline, qr, copyright],
                  ),
          ),
        ],
      ),
    );
  }
}
