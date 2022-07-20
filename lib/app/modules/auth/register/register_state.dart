part of 'register_controller.dart';

class RegisterState extends Equatable {
  final bool loading;
  final String error;
  final UserModel user;
  const RegisterState({
    required this.loading,
    required this.error,
    required this.user,
  });

  const RegisterState.initial()
      : loading = false,
        error = '',
        user = const UserModel();

  RegisterState copyWith({
    bool? loading,
    String? error,
    UserModel? user,
  }) {
    return RegisterState(
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
