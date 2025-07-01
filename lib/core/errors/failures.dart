abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailures extends Failure {
  ServerFailures(super.message);
}
class NetworkFailures extends Failure {
  NetworkFailures(super.message);
}