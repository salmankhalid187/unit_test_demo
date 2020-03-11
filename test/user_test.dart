import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_demo/user.dart';

void main() {
  test('User returns full name', () {
    
    final user = User("Salman", "Khalid");

    expect(user.getFullName(), "Salman Khalid");

  });
}
