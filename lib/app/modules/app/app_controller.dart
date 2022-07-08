import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'app_state.dart';

class AppController extends Cubit<AppState> {
  AppController() : super(const AppState.initial());
}
