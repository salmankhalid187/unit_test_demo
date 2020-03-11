import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/main.dart';
import 'package:unit_test_demo/addProductsExample/product_manager.dart';

void main() {
  testWidgets('MyApp test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Products List'), findsOneWidget);
    expect(find.byType(ProductManager), findsOneWidget);
  });

  testWidgets("Products page testing", (WidgetTester tester) async {
    final startingProduct = 'Product 1';
    final productManagerWidget = MaterialApp(
      home: ProductManager(startingProduct)
    );

    await tester.pumpWidget(productManagerWidget);

    expect(find.text(startingProduct), findsOneWidget);
  
    await tester.tap(find.byType(RaisedButton));
    await tester.pump();

    final ProductManagerState widgetState = tester.state(find.byType(ProductManager));
    expect(widgetState.products.length , 2);
  });
}
