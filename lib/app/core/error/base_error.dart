abstract class BaseError {
  final String errorMessage;
  final Object? exception;
  final StackTrace? stackTrace;
  BaseError({
    this.errorMessage = 'Erro desconhecido',
    this.exception,
    this.stackTrace,
  });
}
