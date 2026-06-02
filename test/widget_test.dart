import 'package:flutter_test/flutter_test.dart';
import 'package:trhi_app/app.dart';

void main() {
  testWidgets('App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const TrhiApp());
    expect(find.byType(TrhiApp), findsOneWidget);
  });
}
