import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import 'mandala_layer.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
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
            padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.band, vertical: AppSpacing.xxl),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: AppColors.hairlineDark)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Image.asset('assets/trhi_logo.png',
                      width: 32, height: 32,
                      color: AppColors.onDark,
                      errorBuilder: (context, error, stack) =>
                          const Icon(Icons.fitness_center,
                              color: AppColors.onDark, size: 32)),
                  const SizedBox(width: AppSpacing.sm),
                  Text('TRHI',
                      style: AppTextStyles.headingSM.copyWith(
                          color: AppColors.onDark)),
                ]),
                Text('Move · Mind · Nourish',
                    style: AppTextStyles.caption.copyWith(
                        color: AppColors.stone)),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    QrImageView(
                      data: 'https://trhi.net',
                      version: QrVersions.auto,
                      size: 72,
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
                    const SizedBox(height: AppSpacing.xs),
                    Text('trhi.net',
                        style: AppTextStyles.caption.copyWith(
                            color: AppColors.stone)),
                  ],
                ),
                Text('© 2025 TRHI',
                    style: AppTextStyles.caption.copyWith(
                        color: AppColors.stone)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
