
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/main.dart';
import 'package:unit_test_demo/product_manager.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('Products List'), findsOneWidget);
    expect(find.byType(ProductManager), findsOneWidget);    
  });
}
