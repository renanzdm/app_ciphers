import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';

class CustomSharedPreferencesMock extends Mock implements CustomSharedPreferences {}

void main() {
  CustomSharedPreferences customSharedPreferences = CustomSharedPreferencesMock();
  test('custom shared preferences impl ...', () async {
    when(() => customSharedPreferences.getJson(key: 'user')).thenAnswer((invocation) => Future.value({'email': 'Renan'}));
    final response = await customSharedPreferences.getJson(key: 'user');
    expect(response, isA<Map<String, dynamic>>());
  });
}
