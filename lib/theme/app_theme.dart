import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppRadius {
  static const sm   = BorderRadius.all(Radius.circular(8));
  static const md   = BorderRadius.all(Radius.circular(12));
  static const lg   = BorderRadius.all(Radius.circular(20));
  static const xl   = BorderRadius.all(Radius.circular(28));
  static const full = BorderRadius.all(Radius.circular(9999));
}

class AppSpacing {
  static const xxs    = 4.0;
  static const xs     = 6.0;
  static const sm     = 8.0;
  static const md     = 14.0;
  static const lg     = 16.0;
  static const xl     = 24.0;
  static const xxl    = 32.0;
  static const xxxl   = 48.0;
  static const block   = 80.0;
  static const section = 88.0;
  static const band    = 120.0;
}

class Breakpoints {
  static const mobile  = 600.0;
  static const tablet  = 1024.0;
  static const desktop = 1280.0;
}

/// The one place that turns viewport width into a layout decision. Every
/// section used to re-derive this itself under a local `isMobile` that
/// silently meant a different threshold per file — this gives them one
/// question to ask, correctly named per threshold.
extension Responsive on BuildContext {
  double get _screenWidth => MediaQuery.of(this).size.width;

  /// Below 600 — phone-width paddings, audience cards stack instead of row.
  bool get isNarrow => _screenWidth < Breakpoints.mobile;

  /// Below 1024 — the stack-vs-row threshold most sections collapse at.
  bool get isCompact => _screenWidth < Breakpoints.tablet;

  /// 1280 and up — full desktop chrome (nav pills, hero side padding).
  bool get isWide => _screenWidth >= Breakpoints.desktop;
}

ThemeData buildAppTheme() {
  return ThemeData(
    colorScheme: const ColorScheme.dark(
      surface: AppColors.canvasDark,
      primary: AppColors.brand,
    ),
    scaffoldBackgroundColor: AppColors.canvasDark,
    useMaterial3: true,
  );
}
