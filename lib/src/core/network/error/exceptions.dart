/// Exception occur when server failure
class ServerException implements Exception {
  final String message;
  final int? statusCode;

  ServerException(this.message, this.statusCode);
}

/// Exception occur when call api over on time
class CancelTokenException implements Exception {
  final String message;
  final int? statusCode;

  CancelTokenException(this.message, this.statusCode);
}
