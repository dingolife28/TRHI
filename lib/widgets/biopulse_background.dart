import 'package:flutter/widgets.dart';

// Bedingter Import wählt die Plattform-Implementierung:
//   • Web      → biopulse_view_web.dart    (iframe via HtmlElementView)
//   • Mobile   → biopulse_view_mobile.dart (WebView via webview_flutter)
import 'biopulse_view_mobile.dart'
    if (dart.library.html) 'biopulse_view_web.dart' as view;

/// Lebendiger, nicht-interaktiver Partikel-Hintergrund („Biopulse Emergence").
///
/// Bettet die selbstständige p5.js-Seite (text-frei, ohne Bedienelemente) ein:
///   • Web:    `web/art/biopulse-emergence.html` als iframe.
///   • Mobile: `assets/art/biopulse-emergence.html` als WebView.
///
/// `IgnorePointer` sorgt dafür, dass Scroll/Tap an die darüberliegende UI
/// durchgereicht werden — die Kunst bleibt reine Atmosphäre.
class BiopulseBackground extends StatelessWidget {
  const BiopulseBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(child: view.BiopulseView());
  }
}
