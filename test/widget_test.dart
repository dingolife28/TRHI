import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/app.dart';
import 'package:trhi_app/i18n/app_lang.dart';
import 'package:trhi_app/i18n/language_controller.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // main() initialisiert das deutsche Datumsformat — im Test nötig,
    // weil BlogCard sonst mit LocaleDataException wirft.
    await initializeDateFormatting('de');
    await initializeDateFormatting('en');
    await tester.pumpWidget(TrhiApp(language: LanguageController(AppLang.de)));
    expect(find.byType(TrhiApp), findsOneWidget);
  });
}
