abstract class LoginError implements Exception {
  final String message;

  LoginError({this.message = ''});
}

class LoginDatasourceError extends LoginError {
  LoginDatasourceError({String message = ''}) : super(message: message);
}

class LoginNotFoundError extends LoginError {
  LoginNotFoundError({String message = ''}) : super(message: message);
}

class LoginNotAuthorizedError extends LoginError {
  LoginNotAuthorizedError({String message = ''}) : super(message: message);
}

class LoginRepositoryError extends LoginError {
  LoginRepositoryError({String message = ''}) : super(message: message);
}

class LoginTimeoutError extends LoginError {
  LoginTimeoutError({String message = ''}) : super(message: message);
}
