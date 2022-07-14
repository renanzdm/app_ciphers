import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences_impl.dart';

void main() {
  late final CustomSharedPreferences customSharedPreferences;

  setUpAll(() async {
    SharedPreferences.setMockInitialValues({
      'user': {'user_email': 'Renan'}
    });
    final prefs = SharedPreferences.getInstance();
    customSharedPreferences = CustomSharedPreferencesImpl(sharedPreferences: prefs);
  });
  test('custom shared preferences impl success...', () async {
    final response = await customSharedPreferences.getJson(key: 'user');
    expect(response, isA<Map<String, dynamic>>());
  });
}
