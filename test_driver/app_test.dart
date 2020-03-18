import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> delay([int milliseconds = 250]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}

void main() {
  group('Integration Test Demo App', () {

    final examplesListPageTitle = find.byValueKey('First page title');
    final addProductsDemoFinderCard = find.byValueKey('Add Products example');
    final productsListPage = find.byValueKey("Products page title");
    final addProductButton = find.byValueKey("Add product button");
    final newsApiDemoFinderCard = find.byValueKey('Trending News example');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('check flutter driver health', () async {
      final health = await driver.checkHealth();
      expect(health.status, HealthStatus.ok);
    });

    test('starts at Examples List', () async {
      expect(await driver.getText(examplesListPageTitle), "Examples List");

      delay(750);
    });

    test('Navigates to Products page', () async {
      await driver.tap(addProductsDemoFinderCard);

      expect(await driver.getText(productsListPage), "Products List");

      delay(750);

      await driver.tap(addProductButton);

      delay(750);

      await driver.tap(find.pageBack());
      
      delay(750);
    });

    test('Navigates to News page', () async {

      await driver.tap(newsApiDemoFinderCard);

      delay(4000);

      await driver.tap(find.pageBack());

    });
  });
}
