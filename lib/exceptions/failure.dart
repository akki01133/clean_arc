import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

const String messageConnectionFailure = 'connection failed';

class ServerFailure extends Failure {

  const ServerFailure(super.message);

  @override
  String toString() {
    return 'ServerFailure{errorMessage: $message}';
  }
}

class CacheFailure extends Failure {

  const CacheFailure(super.message);

  @override
  String toString() {
    return 'CacheFailure{errorMessage: $message}';
  }
}

class ConnectionFailure extends Failure {
  const ConnectionFailure(super.message);

  @override
  String toString() {
    return 'ConnectionFailure{errorMessage: $message}';
  }
}

class CommonFailure extends Failure {
  const CommonFailure(String message) : super(message);

  @override
  String toString() {
    return 'CommonFailure{errorMessage: $message}';
  }
}
