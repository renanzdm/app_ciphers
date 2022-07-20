part of 'login_controller.dart';

class LoginState extends Equatable {
  final bool loading;
  final String error;
  final UserModel user;
  const LoginState({
    required this.loading,
    required this.error,
    required this.user,
  });

  const LoginState.initial()
      : loading = false,
        error = '',
        user = const UserModel();

  LoginState copyWith({
    bool? loading,
    String? error,
    UserModel? user,
  }) {
    return LoginState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      user: user ?? this.user,
    );
  }

  @override
  List<Object?> get props => [loading, error, user];
  @override
  bool? get stringify => true;
}
