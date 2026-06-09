// Mobile-Implementierung (Android/iOS): Kunst in einer WebView.
// Wird per bedingtem Import überall außer Web geladen.

import 'package:flutter/foundation.dart' show Factory;
import 'package:flutter/gestures.dart' show OneSequenceGestureRecognizer;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

const String _assetKey = 'assets/art/biopulse-emergence.html';

class BiopulseView extends StatefulWidget {
  const BiopulseView({super.key});

  @override
  State<BiopulseView> createState() => _BiopulseViewState();
}

class _BiopulseViewState extends State<BiopulseView> {
  WebViewController? _controller;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    // Die Biopulse-Seite ist bereits text- und UI-frei (reiner Hintergrund),
    // daher kein bg-Modus-Eingriff nötig — direkt laden.
    final markup = await rootBundle.loadString(_assetKey);

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFF080F0A))
      ..loadHtmlString(markup);

    if (mounted) setState(() => _controller = controller);
  }

  @override
  Widget build(BuildContext context) {
    final controller = _controller;
    if (controller == null) {
      // Bis die WebView bereit ist: schlichtes Dunkelgrün (kein weißer Blitz).
      return const ColoredBox(color: Color(0xFF080F0A));
    }
    return WebViewWidget(
      controller: controller,
      // Leeres gestureRecognizers-Set: die WebView beansprucht KEINE Gesten in
      // der Flutter-Gesten-Arena → der Seiten-Scroll behält Vorrang. Zusammen
      // mit dem IgnorePointer (in BiopulseBackground) bleibt sie reine,
      // nicht-interaktive Atmosphäre.
      gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
    );
  }
}
