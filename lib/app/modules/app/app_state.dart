part of 'app_controller.dart';

class AppState extends Equatable {
  final bool loading;
  const AppState({required this.loading});
  const AppState.initial() : loading = false;

  AppState copyWith({
    bool? loading,
  }) {
    return AppState(
      loading: loading ?? this.loading,
    );
  }

  @override
  List<Object?> get props => [loading];
}
