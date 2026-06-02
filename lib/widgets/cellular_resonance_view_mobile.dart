// Mobile-Implementierung (Android/iOS): Kunst in einer WebView.
// Wird per bedingtem Import überall außer Web geladen.

import 'package:flutter/foundation.dart' show Factory;
import 'package:flutter/gestures.dart' show OneSequenceGestureRecognizer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String _assetKey = 'assets/art/cellular-resonance-3d.html';

class CellularResonanceView extends StatefulWidget {
  const CellularResonanceView({super.key});

  @override
  State<CellularResonanceView> createState() => _CellularResonanceViewState();
}

class _CellularResonanceViewState extends State<CellularResonanceView> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final raw = await rootBundle.loadString(_assetKey);
    // bg-Modus erzwingen: loadHtmlString kennt keine URL-Query (?bg=1), also
    // setzen wir die Klasse direkt aufs <html>-Tag. So bleibt die Asset-Datei
    // generisch (Web nutzt weiterhin den ?bg=1-Schalter).
    final markup = raw.contains('class="bg-mode"')
        ? raw
        : raw.replaceFirst('<html lang="de">', '<html lang="de" class="bg-mode">');

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF000000))
      ..loadHtmlString(markup);

    if (mounted) setState(() => _controller = controller);
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) {
      // Bis die WebView bereit ist: schlichtes Schwarz (kein weißer Blitz).
      return const ColoredBox(color: Color(0xFF000000));
    }
    return WebViewWidget(
      controller: controller,
      // Leeres gestureRecognizers-Set: die WebView beansprucht KEINE Gesten in
      // der Flutter-Gesten-Arena → der Seiten-Scroll behält Vorrang, die Kunst
      // „klaut" auf Mobile keine Touch-/Scroll-Gesten. Zusammen mit dem
      // IgnorePointer (in CellularResonanceBackground) bleibt sie reine,
      // nicht-interaktive Atmosphäre — auch falls der IgnorePointer mal entfällt.
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
    );
  }
}
