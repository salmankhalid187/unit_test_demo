import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Integration Test Demo App', () {

    final examplesListPageTitle = find.byValueKey('First page title');
    final addProductsDemoFinderCard = find.byValueKey('Add Products example');
    final productsListPage = find.byValueKey("Products page title");

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts at Examples List', () async {
      expect(await driver.getText(examplesListPageTitle), "Examples List");
    });

    test('Navigates to Next page', () async {
      await driver.tap(addProductsDemoFinderCard);

      expect(await driver.getText(productsListPage), "Products List");
    });
  });
}
