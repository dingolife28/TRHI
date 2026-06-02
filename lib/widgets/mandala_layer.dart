import 'dart:math';
import 'package:flutter/material.dart';

class MandalaLayer extends StatefulWidget {
  final double opacity;
  final double size;
  final double initialRotationDeg;
  final double rotationSpeedSec;
  final bool clockwise;
  final bool invert;
  final ScrollController? scrollController;
  final double parallaxFactor;

  const MandalaLayer({
    super.key,
    this.opacity = 0.07,
    this.size = 600,
    this.initialRotationDeg = 0,
    this.rotationSpeedSec = 90,
    this.clockwise = true,
    this.invert = false,
    this.scrollController,
    this.parallaxFactor = 0.0,
  });

  @override
  State<MandalaLayer> createState() => _MandalaLayerState();
}

class _MandalaLayerState extends State<MandalaLayer>
    with SingleTickerProviderStateMixin {
  late final AnimationController _rotCtrl;
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    if (widget.rotationSpeedSec > 0) {
      _rotCtrl = AnimationController(
        vsync: this,
        duration: Duration(seconds: widget.rotationSpeedSec.toInt()),
      )..repeat();
    } else {
      _rotCtrl = AnimationController(vsync: this);
    }
    widget.scrollController?.addListener(_onScroll);
  }

  void _onScroll() {
    if (mounted) setState(() => _scrollOffset = widget.scrollController!.offset);
  }

  @override
  void dispose() {
    widget.scrollController?.removeListener(_onScroll);
    _rotCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Uniform bump: every mandala bigger and slightly more visible.
    final effectiveSize = widget.size * 1.4;
    final effectiveOpacity = (widget.opacity * 1.15).clamp(0.0, 1.0);
    // Orb shading scales with the mandala's own visibility, so faint
    // background layers stay subtle while prominent ones read as domes.
    final highlight = (widget.opacity * 2.7).clamp(0.0, 0.33);
    final shadow = (widget.opacity * 3.6).clamp(0.0, 0.45);

    return AnimatedBuilder(
      animation: _rotCtrl,
      builder: (context, child) {
        final baseAngle = widget.initialRotationDeg * (pi / 180);
        final spinAngle = _rotCtrl.value * 2 * pi * (widget.clockwise ? 1 : -1);
        final parallaxY  = _scrollOffset * widget.parallaxFactor;

        return IgnorePointer(
          child: Transform.translate(
            offset: Offset(0, parallaxY),
            child: SizedBox(
              width: effectiveSize,
              height: effectiveSize,
              // One soft circular mask over the whole orb: the mandala and its
              // lighting share a single round, feathered edge (no hard rim).
              child: ShaderMask(
                blendMode: BlendMode.dstIn,
                shaderCallback: (rect) => const RadialGradient(
                  center: Alignment.center,
                  radius: 0.5,
                  colors: [Colors.white, Colors.white, Colors.transparent],
                  stops: [0.0, 0.40, 1.0],
                ).createShader(rect),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Spinning mandala disc
                    Opacity(
                      opacity: effectiveOpacity,
                      child: Transform.rotate(
                        angle: baseAngle + spinAngle,
                        child: ColorFiltered(
                          colorFilter: widget.invert
                              ? const ColorFilter.matrix([
                                  -1, 0, 0, 0, 255,
                                   0,-1, 0, 0, 255,
                                   0, 0,-1, 0, 255,
                                   0, 0, 0, 1,   0,
                                ])
                              : const ColorFilter.mode(
                                  Colors.transparent, BlendMode.dst),
                          child: Image.asset(
                            'assets/mandala_bg.webp',
                            width: effectiveSize,
                            height: effectiveSize,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ),
                    // Fixed light source — the spinning disc reads as a lit orb.
                    // Shadow sits on the far (bottom-right) side and the outer
                    // mask feathers it away, so there is no hard shadow ring.
                    DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          center: const Alignment(-0.3, -0.3),
                          radius: 0.9,
                          colors: [
                            Colors.white.withValues(alpha: highlight),
                            Colors.white.withValues(alpha: 0),
                            Colors.black.withValues(alpha: shadow),
                          ],
                          stops: const [0.0, 0.5, 1.0],
                        ),
                      ),
                      child: SizedBox(
                        width: effectiveSize,
                        height: effectiveSize,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class GlobalMandalaBackground extends StatelessWidget {
  const GlobalMandalaBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // √2 × longest side guarantees full coverage at any rotation angle
    final mandalaSize = (size.longestSide * 1.5).clamp(1200.0, 3000.0);

    return Positioned.fill(
      child: IgnorePointer(
        child: OverflowBox(
          maxWidth: double.infinity,
          maxHeight: double.infinity,
          child: Center(
            child: MandalaLayer(
              opacity: 0.025,
              size: mandalaSize,
              rotationSpeedSec: 120,
              clockwise: true,
              invert: false,
            ),
          ),
        ),
      ),
    );
  }
}
