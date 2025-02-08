class ServerException implements Exception {
  final String errorMessage;
  final StackTrace? stackTrace;

  ServerException({
    required this.errorMessage,
    required this.stackTrace,
  });
}

class LocalException implements Exception {
  final String errorMessage;
  final StackTrace? stackTrace;

  LocalException({
    required this.errorMessage,
    required this.stackTrace,
  });
}
