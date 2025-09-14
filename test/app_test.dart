import 'package:flutter_test/flutter_test.dart';
import 'package:tourist_safety_app/main.dart';

void main() {
  testWidgets('App starts and shows language selection', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp(initialRoute: '/'));

    // Verify that the language selection screen is shown
    expect(find.text('Select your preferred language'), findsOneWidget);
    expect(find.text('English'), findsOneWidget);
    expect(find.text('हिंदी'), findsOneWidget);
  });
}
