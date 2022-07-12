import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/core/services/user_service/user_preferences_service.dart';

part 'splash_state.dart';

class SplashController extends Cubit<SplashState> {
  final UserPreferencesService _userServicePreferences;
  SplashController({required UserPreferencesService userServicePreferences})
      : _userServicePreferences = userServicePreferences,
        super(SplashState.initial());

  Future<void> getUser() async {
    emit(state.copyWith(loading: true));
    try {
      final user = await _userServicePreferences.getUser();
      if (user.email.isNotEmpty) {
        emit(state.copyWith(user: user, loading: false));
      } else {
        emit(state.copyWith(loading: false));
      }
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
