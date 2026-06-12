import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/i18n/app_lang.dart';
import 'package:trhi_app/i18n/app_text.dart';
import 'package:trhi_app/i18n/language_controller.dart';
import 'package:trhi_app/i18n/language_scope.dart';
import 'package:trhi_app/screens/home_screen.dart';
import 'package:trhi_app/blog/blog_data.dart';

// Beweist das „Bottleneck"-Prinzip: ein einziger Toggle am Controller schaltet
// die gesamte sichtbare UI um.
void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  test('AppText liefert je Sprache DE/EN', () {
    expect(const AppText(AppLang.de).ctaPrimary, 'Erstgespräch buchen');
    expect(const AppText(AppLang.en).ctaPrimary, 'Book a free call');
    // Markenbegriffe bleiben identisch.
    expect(const AppText(AppLang.de).brandTagline,
        const AppText(AppLang.en).brandTagline);
  });

  test('BlogPost liefert beide Sprachen + stabile Kategorie', () {
    final post = getPostBySlug('adhs-amphetamine')!;
    expect(post.titleOf(AppLang.de), startsWith('ADHS'));
    expect(post.titleOf(AppLang.en), startsWith('ADHD'));
    expect(post.categoryKey, 'science'); // sprachunabhängig
  });

  testWidgets('Toggle schaltet die Startseite live um', (tester) async {
    await initializeDateFormatting('de');
    await initializeDateFormatting('en');
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    final origOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      origOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = origOnError);

    final controller = LanguageController(AppLang.de);
    await tester.pumpWidget(LanguageScope(
      controller: controller,
      child: const MaterialApp(home: HomeScreen()),
    ));
    await tester.pump(const Duration(seconds: 1));

    // Deutsch sichtbar.
    expect(find.text('Erstgespräch buchen'), findsWidgets);
    expect(find.text('Book a free call'), findsNothing);

    // Ein Toggle …
    controller.toggle();
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 100));

    // … und alles ist Englisch.
    expect(find.text('Book a free call'), findsWidgets);
    expect(find.text('Erstgespräch buchen'), findsNothing);
  });
}
