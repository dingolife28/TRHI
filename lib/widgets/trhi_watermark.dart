import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TrhiWatermark extends StatelessWidget {
  final double opacity;
  final double size;
  final double rotation;
  final bool invert;

  const TrhiWatermark({
    super.key,
    this.opacity = 0.05,
    this.size = 600,
    this.rotation = 0,
    this.invert = false,
  });

  @override
  Widget build(BuildContext context) {
    Widget logo = SvgPicture.asset(
      'assets/trhi_logo.svg',
      width: size,
      height: size,
      colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
    );

    if (invert) {
      logo = ColorFiltered(
        colorFilter: const ColorFilter.matrix([
          -1, 0, 0, 0, 255,
           0,-1, 0, 0, 255,
           0, 0,-1, 0, 255,
           0, 0, 0, 1,   0,
        ]),
        child: logo,
      );
    }

    return IgnorePointer(
      child: Opacity(
        opacity: opacity,
        child: Transform.rotate(
          angle: rotation,
          child: logo,
        ),
      ),
    );
  }
}
