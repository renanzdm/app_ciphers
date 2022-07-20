import 'package:the_cipher_app/app/core/error/base_error.dart';

class RegisterError extends BaseError {
  final String message;
  final Object? ex;
  final StackTrace? stack;
  RegisterError({this.message = 'Nao foi possivel se registrar', this.ex, this.stack})
      : super(
          errorMessage: message,
          exception: ex,
          stackTrace: stack,
        );
}

class LoginError extends BaseError {
  final String message;
  final Object? ex;
  final StackTrace? stack;
  LoginError({this.message = 'Nao foi possivel se registrar', this.ex, this.stack})
      : super(
          errorMessage: message,
          exception: ex,
          stackTrace: stack,
        );
}
