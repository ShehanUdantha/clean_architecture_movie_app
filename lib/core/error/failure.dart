abstract class Failure {
  final String errorMessage;

  const Failure({required this.errorMessage});
}

class ServerFailure extends Failure {
  const ServerFailure({required super.errorMessage});
}

class LocalDBFailure extends Failure {
  const LocalDBFailure({required super.errorMessage});
}
