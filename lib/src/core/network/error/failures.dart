import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String errorMessage;

  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

/// General failures
class ServerFailure extends Failure {
  final int? statusCode;

  const ServerFailure(String errorMessage, this.statusCode)
      : super(
          errorMessage,
        );
}

/// Cancel token failure
class CancelTokenFailure extends Failure {
  final int? statusCode;

  const CancelTokenFailure(String errorMessage, this.statusCode)
      : super(
          errorMessage,
        );
}
