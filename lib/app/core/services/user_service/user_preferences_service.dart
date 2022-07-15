import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/core/services/custom_shared_preferences/custom_shared_preferences.dart';

import '../../error/services_error.dart';
import '../../utils/either.dart';

abstract class UserPreferencesService {
  Future<Either<UserNotFoundError, UserModel>> getUser();
}

class UserPreferencesServiceImpl implements UserPreferencesService {
  final CustomSharedPreferences _customSharedPreferences;
  UserPreferencesServiceImpl({required CustomSharedPreferences customSharedPreferences}) : _customSharedPreferences = customSharedPreferences;

  @override
  Future<Either<UserNotFoundError, UserModel>> getUser() async {
    try {
      var json = await _customSharedPreferences.getJson(key: 'user');
      return Right(UserModel.fromMap(json));
    } catch (e) {
      return Left(UserNotFoundError(ex: e));
    }
  }
}
