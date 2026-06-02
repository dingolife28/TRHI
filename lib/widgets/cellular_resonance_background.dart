import 'package:flutter/widgets.dart';

// Bedingter Import wählt die Plattform-Implementierung:
//   • Web      → cellular_resonance_view_web.dart    (iframe via HtmlElementView)
//   • Mobile   → cellular_resonance_view_mobile.dart (WebView via webview_flutter)
import 'cellular_resonance_view_mobile.dart'
    if (dart.library.html) 'cellular_resonance_view_web.dart' as view;

/// Lebendiger, nicht-interaktiver 3D-Zellhintergrund („Cellular Resonance").
///
/// Bettet die selbstständige Three.js-Seite im Hintergrund-Modus (ohne
/// Bedienelemente) ein:
///   • Web:    `web/art/cellular-resonance-3d.html?bg=1` als iframe.
///   • Mobile: `assets/art/cellular-resonance-3d.html` als WebView (bg-Modus
///             wird beim Laden erzwungen).
///
/// `IgnorePointer` sorgt dafür, dass Scroll/Tap an die Hero-UI durchgereicht
/// werden — die Kunst bleibt reine Atmosphäre.
class CellularResonanceBackground extends StatelessWidget {
  const CellularResonanceBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const IgnorePointer(child: view.CellularResonanceView());
  }
}
