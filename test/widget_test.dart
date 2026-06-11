import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:trhi_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    // main() initialisiert das deutsche Datumsformat — im Test nötig,
    // weil BlogCard sonst mit LocaleDataException wirft.
    await initializeDateFormatting('de');
    await tester.pumpWidget(const TrhiApp());
    expect(find.byType(TrhiApp), findsOneWidget);
  });
}
