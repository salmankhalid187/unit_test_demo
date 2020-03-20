import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> delay([int milliseconds = 250]) async {
  await Future<void>.delayed(Duration(milliseconds: milliseconds));
}

void main() {
  group('Integration Test Demo App', () {

    final testDelayInMilliSeconds = 1000;

    final examplesListPageTitle = find.byValueKey('First page title');
    final addProductsDemoFinderCard = find.byValueKey('Add Products example');
    final productsListPage = find.byValueKey("Products page title");
    final addProductButton = find.byValueKey("Add product button");
    final newsApiDemoFinderCard = find.byValueKey('Trending News example');
    final newsDetailPage = find.byValueKey('article');

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

      await delay(testDelayInMilliSeconds);
    });

    test('Navigates to Products page', () async {
      await driver.tap(addProductsDemoFinderCard);

      expect(await driver.getText(productsListPage), "Products List");

      await delay(testDelayInMilliSeconds);

      await driver.tap(addProductButton);

      await delay(testDelayInMilliSeconds);

      await driver.tap(find.pageBack());
      
      await delay(testDelayInMilliSeconds);
    });

    test('Navigates to News page', () async {

      await driver.tap(newsApiDemoFinderCard);

      await delay(testDelayInMilliSeconds);

    });

    test('Navigates to News detail spage', () async {

      await driver.tap(newsDetailPage);

      await delay(testDelayInMilliSeconds);

      await driver.tap(find.pageBack());

      await delay(testDelayInMilliSeconds);

      await driver.tap(find.pageBack());

    });
  });
}
