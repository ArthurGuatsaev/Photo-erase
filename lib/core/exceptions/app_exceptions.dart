abstract class AppException implements Exception {
  final String message;
  final String? code;

  AppException(this.message, {this.code});

  @override
  String toString() =>
      'AppException: $message ${code != null ? '($code)' : ''}';
}

class NetworkException extends AppException {
  NetworkException(super.message, {super.code});
}

class PermissionException extends AppException {
  PermissionException(super.message, {super.code});
}

class EraseChangeBgException extends AppException {
  EraseChangeBgException(super.message, {super.code});
}
