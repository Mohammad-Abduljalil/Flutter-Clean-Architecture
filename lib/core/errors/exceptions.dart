import 'error_model.dart';

  //Server
class ServerException implements Exception {
  final ErrorModel errorModel;
  ServerException({required this.errorModel});
}

class NoInternetException implements Exception {
  final String message = "No Internet Connection";
}

class ConnectionTimeoutException implements Exception {
  final String message = "Connection Timeout";
}

class UnauthorizedException implements Exception {
  final ErrorModel errorModel;
  UnauthorizedException({required this.errorModel});
}

class BadRequestException implements Exception {
  final ErrorModel errorModel;
  BadRequestException({required this.errorModel});
}


  //Cache
class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}

class EmptyCacheException implements Exception {
  final String message = "No data found in cache";
}

class ExpiredCacheException implements Exception {
  final String message = "Cache data has expired";
}