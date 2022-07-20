import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:the_cipher_app/app/modules/auth/auth_repositories/auth_repositories.dart';

import '../../../core/model/user_model.dart';

part 'register_state.dart';

class RegisterController extends Cubit<RegisterState> {
  final AuthRepositorie _authRepositorie;
  RegisterController({required AuthRepositorie authRepositorie})
      : _authRepositorie = authRepositorie,
        super(const RegisterState.initial());

  FutureOr<void> register({required String email, required String password, required String name}) async {
    emit(state.copyWith(loading: true, error: '', user: const UserModel()));
    var response = await _authRepositorie.register(email: email, password: password, name: name);
    response.fold(
        (l) => emit(state.copyWith(
              loading: false,
              error: l.errorMessage,
            )),
        (r) => emit(state.copyWith(
              loading: false,
              user: r,
            )));
  }
}
