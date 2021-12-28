abstract class IOtpError implements Exception {
  final String message;

  IOtpError({this.message = ''});
}

class OtpError extends IOtpError {
  OtpError({String message = ''}) : super(message: message);
}
