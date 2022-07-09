import 'package:shared_preferences/shared_preferences.dart';

import 'custom_shared_preferences.dart';

class CustomSharedPreferencesImpl implements CustomSharedPreferences {
  @override
  Future<Map<String, dynamic>> getJson({required String key}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.get(key) as Map<String, dynamic>;
  }
}
