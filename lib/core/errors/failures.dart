import 'error_model.dart';

abstract class Failures {
  final String message;
  Failures({required this.message});
}

class ServerFailure extends Failures {
  final ErrorModel? errorModel;
  ServerFailure({required String message, this.errorModel}) : super(message: message);
}

class CacheFailure extends Failures {
  CacheFailure({required String message}) : super(message: message);
}

class NetworkFailure extends Failures {
  NetworkFailure({required String message}) : super(message: message);
}