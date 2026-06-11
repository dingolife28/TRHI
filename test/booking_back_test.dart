import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trhi_app/screens/booking_screen.dart';

// Repro für den gemeldeten Bug: Alle Wege zur Buchung nutzen context.go(),
// der Navigator-Stack ist also leer — der Zurück-Pfeil muss trotzdem zur
// Startseite führen.
void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  GoRouter buildRouter() => GoRouter(
        initialLocation: '/booking',
        routes: [
          GoRoute(
              path: '/',
              builder: (context, state) =>
                  const Scaffold(body: Text('HOME'))),
          GoRoute(
              path: '/booking',
              builder: (context, state) => const BookingScreen()),
        ],
      );

  testWidgets('Mobil: Zurück-Pfeil führt bei leerem Stack zur Startseite',
      (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp.router(routerConfig: buildRouter()));
    await tester.pumpAndSettle();

    await tester.tap(find.byType(BackButton));
    await tester.pumpAndSettle();

    expect(find.text('HOME'), findsOneWidget);
  });

  testWidgets('Desktop: Zurück-Pfeil führt bei leerem Stack zur Startseite',
      (tester) async {
    tester.view.physicalSize = const Size(1400, 900);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    await tester.pumpWidget(MaterialApp.router(routerConfig: buildRouter()));
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.arrow_back));
    await tester.pumpAndSettle();

    expect(find.text('HOME'), findsOneWidget);
  });
}
