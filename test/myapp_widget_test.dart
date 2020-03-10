import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/main.dart';
import 'package:unit_test_demo/product_manager.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Products List'), findsOneWidget);
    expect(find.byType(ProductManager), findsOneWidget);
  });

  testWidgets("Products page testing", (WidgetTester tester) async {
    final staringProduct = 'Product 1';
    final productManagerWidget = MaterialApp(
      home: ProductManager(staringProduct)
    );

    await tester.pumpWidget(productManagerWidget);
    
    expect(find.text(staringProduct), findsOneWidget);

    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    final ProductManagerState widgetState = tester.state(find.byType(ProductManager));
    expect(widgetState.products.length , 2);
  });
}
