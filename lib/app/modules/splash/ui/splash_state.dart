// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'splash_controller.dart';

class SplashState extends Equatable {
  final bool loading;
  final UserModel user;
  final String error;
  const SplashState({required this.loading, required this.error, required this.user});

  SplashState.initial()
      : error = '',
        loading = false,
        user = UserModel();

  @override
  List<Object?> get props => [loading, error, user];

  SplashState copyWith({
    bool? loading,
    UserModel? user,
    String? error,
  }) {
    return SplashState(
      loading: loading ?? this.loading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}
