// Sync-Schritt für die „Cellular Resonance"-Kunst.
//
// Kopiert die kanonische Kunstdatei (Quelle der Wahrheit) an die beiden Stellen,
// die die App tatsächlich ausliefert:
//   • web/art/...      → Flutter Web (iframe)
//   • assets/art/...   → Android/iOS (WebView, via rootBundle)
//
// Aufruf aus dem Projektverzeichnis (trhi_app):
//   dart run tool/sync_art.dart
// Optional eigener Quellpfad:
//   dart run tool/sync_art.dart "C:/Pfad/zur/cellular-resonance-3d.html"

import 'dart:io';

const _defaultSource = '../TRHI BLOG/art/cellular-resonance-3d.html';
const _targets = <String>[
  'web/art/cellular-resonance-3d.html',
  'assets/art/cellular-resonance-3d.html',
];

void main(List<String> args) {
  final sourcePath = args.isNotEmpty ? args.first : _defaultSource;
  final source = File(sourcePath);

  if (!source.existsSync()) {
    stderr.writeln('✗ Quelldatei nicht gefunden: ${source.absolute.path}');
    stderr.writeln('  Tipp: Pfad als Argument übergeben, falls die Kunst woanders liegt.');
    exit(1);
  }

  for (final target in _targets) {
    final out = File(target);
    out.parent.createSync(recursive: true);
    source.copySync(target);
    stdout.writeln('✓ $target');
  }
  stdout.writeln('Fertig — Kunst nach web/ und assets/ synchronisiert.');
}
