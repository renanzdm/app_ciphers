import 'package:shared_preferences/shared_preferences.dart';

import 'custom_shared_preferences.dart';

class CustomSharedPreferencesImpl implements CustomSharedPreferences {
  final Future<SharedPreferences> sharedPreferences;

  CustomSharedPreferencesImpl({required this.sharedPreferences});

  @override
  Future<Map<String, dynamic>> getJson({required String key}) async {
    final prefs = await sharedPreferences;
    return prefs.get(key) as Map<String, dynamic>;
  }
}
