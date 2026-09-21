import 'exceptions.dart';
import 'failures.dart';

class ErrorHandler {
  static Failures handleException(dynamic e) {
    if (e is ServerException) {
      return ServerFailure(message: e.errorModel.errorMessage, errorModel: e.errorModel);
    }
    if (e is UnauthorizedException) {
      return ServerFailure(message: e.errorModel.errorMessage, errorModel: e.errorModel);
    }
    if (e is BadRequestException) {
      return ServerFailure(message: e.errorModel.errorMessage, errorModel: e.errorModel);
    }
    if (e is NoInternetException) {
      return NetworkFailure(message: e.message);
    }
    if (e is ConnectionTimeoutException) {
      return NetworkFailure(message: e.message);
    }
    if (e is CacheException) {
      return CacheFailure(message: e.errorMessage);
    }
    if (e is EmptyCacheException) {
      return CacheFailure(message: e.message);
    }

    return ServerFailure(message: "An unexpected error occurred");
  }
}