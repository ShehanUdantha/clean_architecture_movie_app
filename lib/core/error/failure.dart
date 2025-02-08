abstract class Failure {
  final String errorMessage;
  final StackTrace? stackTrace;

  const Failure({
    required this.errorMessage,
    required this.stackTrace,
  });
}

class ServerFailure extends Failure {
  const ServerFailure({
    required super.errorMessage,
    required super.stackTrace,
  });
}

class LocalDBFailure extends Failure {
  const LocalDBFailure({
    required super.errorMessage,
    required super.stackTrace,
  });
}
