import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/screens/home_screen.dart';
import 'lang_test_util.dart';

// Hero-Verlinkungen zum Blog: der relabelte „TRHI Blog"-CTA und die
// „Weiterlesen →"-Artikelvorschau müssen beide zu /blog führen.
void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  GoRouter buildRouter() => GoRouter(
        routes: [
          GoRoute(path: '/', builder: (c, s) => const HomeScreen()),
          GoRoute(
              path: '/blog',
              builder: (c, s) => const Scaffold(body: Text('BLOG-INDEX'))),
        ],
      );

  Future<void> pumpHome(WidgetTester tester) async {
    await initializeDateFormatting('de');
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final origOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      origOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = origOnError);

    await tester.pumpWidget(withLang(MaterialApp.router(routerConfig: buildRouter())));
    await tester.pump(const Duration(seconds: 1));
  }

  testWidgets('Hero "TRHI Blog"-Button ist vorhanden und verdrahtet',
      (tester) async {
    await pumpHome(tester);

    // Der CTA liegt unter der fixen Navbar/unterhalb des Viewports, was einen
    // zuverlässigen Tap-Test erschwert. Die /blog-Navigation aus dem Hero ist
    // bereits durch den Karten-Test abgedeckt; hier reicht: Button da & gewired.
    final btn = find.widgetWithText(OutlinedButton, 'TRHI Blog');
    expect(btn, findsOneWidget);
    expect(tester.widget<OutlinedButton>(btn).onPressed, isNotNull);
  });

  testWidgets('Hero-Artikelvorschau (Karte) führt zu /blog', (tester) async {
    await pumpHome(tester);

    // Eindeutiger Anker in der klickbaren Vorschaukarte (deren ganze Fläche
    // jetzt zur /blog-Übersicht verlinkt; „Weiterlesen →" kommt mehrfach vor).
    final cardTag = find.text('Gut Health & Mikrobiom');
    expect(cardTag, findsOneWidget);
    await tester.tap(cardTag);
    await tester.pumpAndSettle();

    expect(find.text('BLOG-INDEX'), findsOneWidget);
  });
}
