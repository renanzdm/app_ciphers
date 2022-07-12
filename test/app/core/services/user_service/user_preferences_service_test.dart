import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';
import 'package:the_cipher_app/app/core/services/user_service/user_preferences_service.dart';

class CustomSharedPreferencesMock extends Mock implements CustomSharedPreferences {}

void main() {
  late final UserPreferencesService userPreferencesService;
  late final CustomSharedPreferences customSharedPreferences;
  setUpAll(() {
    customSharedPreferences = CustomSharedPreferencesMock();
    userPreferencesService = UserPreferencesServiceImpl(customSharedPreferences: customSharedPreferences);
  });

  test('user preferences service get user with success...', () async {
    when(
      () => customSharedPreferences.getJson(key: 'user'),
    ).thenAnswer((invocation) => Future.value({'user_email': 'Renan', 'user_name': 'Renan', 'id': 12, 'jwt': 'token'}));
    var response = await userPreferencesService.getUser();
    expect(response, isA<UserModel>());
  });
  test('user preferences service get user with error key value...', () async {
    when(
      () => customSharedPreferences.getJson(key: 'user'),
    ).thenAnswer((invocation) => Future.value({'user_emai': 'Renan', 'user_name': 'Renan', 'id': 12, 'jwt': 'token'}));
    var response = await userPreferencesService.getUser();
    expect(response.email, isEmpty);
  });
}
