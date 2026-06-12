import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/screens/home_screen.dart';
import 'package:trhi_app/widgets/nav_bar.dart';
import 'lang_test_util.dart';

// Die Desktop-Navlinks (Training/Mind-Body/Ernährung/YouTube) waren vorher
// tot — dieser Test stellt sicher, dass sie zur jeweiligen Sektion scrollen.
void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  testWidgets('Desktop: Navbar-Link "YouTube" scrollt zur Sektion',
      (tester) async {
    // Der Ahem-Testfont (jedes Zeichen ein breites Quadrat) provoziert in den
    // Karten-Layouts Overflows, die es mit echten Fonts nicht gibt. Dieser
    // Test prüft das Scrollen, nicht das Layout — Overflows hier ignorieren.
    final origOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('RenderFlex overflowed')) {
        return;
      }
      origOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = origOnError);

    await initializeDateFormatting('de');
    tester.view.physicalSize = const Size(1600, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(withLang(const MaterialApp(home: HomeScreen())));
    // Kein pumpAndSettle: Mandala/Ticker animieren endlos.
    await tester.pump(const Duration(seconds: 2));

    final position =
        tester.state<ScrollableState>(find.byType(Scrollable).first).position;
    expect(position.pixels, 0);

    await tester.tap(find.descendant(
        of: find.byType(TrhiNavBar), matching: find.text('YouTube')));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 700));

    expect(position.pixels, greaterThan(0));
  });
}
