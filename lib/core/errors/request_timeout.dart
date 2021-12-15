class RequestTimeoutError implements Exception {
  final String message;

  RequestTimeoutError({this.message = ''});
}
