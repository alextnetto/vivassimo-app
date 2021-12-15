abstract class RegisterError implements Exception {
  final String message;

  RegisterError({this.message = ''});
}

class RegisterTimeoutError extends RegisterError {
  RegisterTimeoutError({String message = ''}) : super(message: message);
}

class RegisterDatasourceError extends RegisterError {
  RegisterDatasourceError({String message = ''}) : super(message: message);
}
