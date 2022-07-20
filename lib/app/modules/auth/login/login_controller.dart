import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_cipher_app/app/core/model/user_model.dart';
import 'package:the_cipher_app/app/modules/auth/auth_repositories/auth_repositories.dart';

part 'login_state.dart';

class LoginController extends Cubit<LoginState> {
  final AuthRepositorie _authRepositorie;
  LoginController({required AuthRepositorie authRepositorie})
      : _authRepositorie = authRepositorie,
        super(const LoginState.initial());

  FutureOr<void> login({required String email, required String password}) async {
    emit(state.copyWith(loading: true));
    var response = await _authRepositorie.login(email: email, password: password);
    await response.fold(
        (l) async => emit(state.copyWith(
              loading: false,
              error: l.errorMessage,
            )),
        (r) async => emit(state.copyWith(
              loading: false,
              user: UserModel(jwt: r),
            )));
  }
}
