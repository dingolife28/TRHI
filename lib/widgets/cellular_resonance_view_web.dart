// Web-Implementierung: Kunst als randloses, nicht-interaktives <iframe>,
// registriert als Flutter-Platform-View. Wird nur per bedingtem Import auf
// Flutter Web geladen. dart:html ist bewusst gewählt (keine Zusatz-Dependency).
// ignore_for_file: avoid_web_libraries_in_flutter, deprecated_member_use

import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

import 'package:flutter/widgets.dart';

const String _src = 'art/cellular-resonance-3d.html?bg=1';
const String _viewType = 'trhi-cellular-resonance';

class CellularResonanceView extends StatefulWidget {
  const CellularResonanceView({super.key});

  @override
  State<CellularResonanceView> createState() => _CellularResonanceViewState();
}

class _CellularResonanceViewState extends State<CellularResonanceView> {
  static bool _registered = false;

  @override
  void initState() {
    super.initState();
    // Factory nur einmal global registrieren (erneutes Registrieren würfe).
    if (!_registered) {
      ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
        final iframe = html.IFrameElement()
          ..src = _src
          ..style.border = 'none'
          ..style.width = '100%'
          ..style.height = '100%'
          ..style.backgroundColor = '#000000'
          ..style.pointerEvents = 'none' // Klicks/Scroll an die Hero-UI durchreichen
          ..allow = 'autoplay'
          ..title = 'Cellular Resonance'
          ..setAttribute('scrolling', 'no')
          ..setAttribute('aria-hidden', 'true');
        return iframe;
      });
      _registered = true;
    }
  }

  @override
  Widget build(BuildContext context) =>
      const HtmlElementView(viewType: _viewType);
}
