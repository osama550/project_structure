import 'package:equatable/equatable.dart';

/// Typed failure returned across the domain boundary.
abstract class Failure extends Equatable {
  final String errorMessage;
  const Failure({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({required super.errorMessage, this.statusCode});

  @override
  List<Object?> get props => [errorMessage, statusCode];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.errorMessage});
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure({required super.errorMessage});
}
