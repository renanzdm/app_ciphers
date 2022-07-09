import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';

abstract class UserServicePreferences {
  Future<UserModel> getUser();
}

class UserServicePreferencesImpl implements UserServicePreferences {
  final CustomSharedPreferences _sharedPreferences;
  UserServicePreferencesImpl(this._sharedPreferences);

  @override
  Future<UserModel> getUser() async {
    var json = await _sharedPreferences.getJson(key: 'user');
    return UserModel.fromMap(json);
  }
}
