import 'package:flutter/material.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_theme.dart';
import '../theme/copy.dart';
import 'mandala_layer.dart';

class TickerBanner extends StatefulWidget {
  final ScrollController? scrollController;
  const TickerBanner({super.key, this.scrollController});

  @override
  State<TickerBanner> createState() => _TickerBannerState();
}

class _TickerBannerState extends State<TickerBanner>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 28),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final items = TrhiCopy.tickerItems;
    final full = items.map((e) => '$e  ◈  ').join();

    return Container(
      height: 48,
      color: AppColors.surfaceElevated,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: -60,
            top: -126,
            child: MandalaLayer(
              opacity: 0.06,
              size: 300,
              initialRotationDeg: 45,
              rotationSpeedSec: 60,
              clockwise: false,
              invert: true,
              scrollController: widget.scrollController,
              parallaxFactor: 0.10,
            ),
          ),
          ClipRect(
            child: AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return CustomPaint(
                  painter: _TickerPainter(
                    text: full,
                    progress: _controller.value,
                    style: AppTextStyles.label.copyWith(
                      color: AppColors.onDarkMuted,
                      letterSpacing: AppSpacing.xs,
                    ),
                  ),
                  size: Size.infinite,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _TickerPainter extends CustomPainter {
  final String text;
  final double progress;
  final TextStyle style;

  _TickerPainter({
    required this.text,
    required this.progress,
    required this.style,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final tp = TextPainter(
      text: TextSpan(text: text + text, style: style),
      textDirection: TextDirection.ltr,
    )..layout();

    final totalWidth = tp.width / 2;
    final offset = progress * totalWidth;
    tp.paint(canvas, Offset(-offset, (size.height - tp.height) / 2));
  }

  @override
  bool shouldRepaint(_TickerPainter old) => old.progress != progress;
}
