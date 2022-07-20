import 'package:the_cipher_app/app/core/error/base_error.dart';

class UserNotFoundError extends BaseError {
  final String message;
  final Object? ex;
  final StackTrace? stack;
  UserNotFoundError({this.message = 'User Not Found', this.ex, this.stack})
      : super(
          errorMessage: message,
          exception: ex,
          stackTrace: stack,
        );
}
