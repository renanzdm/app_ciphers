import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';

abstract class UserPreferencesService {
  Future<UserModel> getUser();
}

class UserPreferencesServiceImpl implements UserPreferencesService {
  final CustomSharedPreferences _customSharedPreferences;
  UserPreferencesServiceImpl({required CustomSharedPreferences customSharedPreferences}) : _customSharedPreferences = customSharedPreferences;

  @override
  Future<UserModel> getUser() async {
    var json = await _customSharedPreferences.getJson(key: 'user');
    return UserModel.fromMap(json);
  }
}
