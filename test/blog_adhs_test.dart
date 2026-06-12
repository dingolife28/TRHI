import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/blog/blog_data.dart';
import 'package:trhi_app/blog/blog_article_screen.dart';
import 'lang_test_util.dart';

void main() {
  GoogleFonts.config.allowRuntimeFetching = false;

  test('ADHS-Artikel ist als neuester Post im Wissenschaft-Filter vorhanden', () {
    final post = getPostBySlug('adhs-amphetamine');
    expect(post, isNotNull);
    expect(post!.categoryKey, 'science');
    // Newest-first: muss an erster Stelle stehen.
    expect(blogPosts.first.slug, 'adhs-amphetamine');
    expect(getPostsByCategory('science'), contains(post));
    expect(getPostsByCategory('all'), contains(post));
  });

  testWidgets('ADHS-Artikelseite rendert Titel & Inhalt (nicht NotFound)',
      (tester) async {
    await initializeDateFormatting('de');
    tester.view.physicalSize = const Size(1400, 1000);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.reset);

    // Ahem-Testfont erzeugt Layout-Overflows, die mit echten Fonts nicht
    // auftreten — hier geht es um Inhalt, nicht um Pixel-Layout.
    final origOnError = FlutterError.onError;
    FlutterError.onError = (details) {
      if (details.exceptionAsString().contains('overflowed')) return;
      origOnError?.call(details);
    };
    addTearDown(() => FlutterError.onError = origOnError);

    await tester.pumpWidget(withLang(const MaterialApp(
      home: BlogArticleScreen(slug: 'adhs-amphetamine'),
    )));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Artikel nicht gefunden.'), findsNothing);
    expect(
        find.text('ADHS und Amphetamine: Was wirklich in deinem Kind vorgeht'),
        findsOneWidget);
    // Eine Zwischenüberschrift aus dem konvertierten Inhalt.
    expect(find.text('Wie Amphetamine bei ADHS wirken'), findsOneWidget);
  });
}
