import 'package:dio/dio.dart';
import 'package:project_structure/core/errors/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException(this.errorModel);
}

// Specific Exceptions
class ConnectionTimeoutException extends ServerException {
  ConnectionTimeoutException(super.errorModel);
}

class CacheException implements Exception {
  final String errorMessage;
  CacheException({required this.errorMessage});
}

class SendTimeoutException extends ServerException {
  SendTimeoutException(super.errorModel);
}

class ReceiveTimeoutException extends ServerException {
  ReceiveTimeoutException(super.errorModel);
}

class BadCertificateException extends ServerException {
  BadCertificateException(super.errorModel);
}

class CancelException extends ServerException {
  CancelException(super.errorModel);
}

class UnknownException extends ServerException {
  UnknownException(super.errorModel);
}

class ConnectionErrorException extends ServerException {
  ConnectionErrorException(super.errorModel);
}

// HTTP Status Exceptions
class BadRequestException extends ServerException {
  BadRequestException(super.errorModel);
}

class UnauthorizedException extends ServerException {
  UnauthorizedException(super.errorModel);
}

class ForbiddenException extends ServerException {
  ForbiddenException(super.errorModel);
}

class NotFoundException extends ServerException {
  NotFoundException(super.errorModel);
}

class ConflictException extends ServerException {
  ConflictException(super.errorModel);
}

class GatewayTimeoutException extends ServerException {
  GatewayTimeoutException(super.errorModel);
}

class GenericHttpException extends ServerException {
  GenericHttpException(super.errorModel);
}

dynamic handleDioException(DioException e) {
  final responseData = e.response?.data;

  // Helper to parse ErrorModel safely
  ErrorModel parseError() {
    if (responseData is Map<String, dynamic>) {
      return ErrorModel.fromJson(responseData);
    }
    return ErrorModel(
      status: e.response?.statusCode,
      errorMessage: responseData?.toString() ?? 'Unexpected error occurred',
    );
  }

  switch (e.type) {
    case DioExceptionType.connectionTimeout:
      throw ConnectionTimeoutException(parseError());

    case DioExceptionType.sendTimeout:
      throw SendTimeoutException(parseError());

    case DioExceptionType.receiveTimeout:
      throw ReceiveTimeoutException(parseError());

    case DioExceptionType.badCertificate:
      throw BadCertificateException(parseError());

    case DioExceptionType.cancel:
      throw CancelException(
        ErrorModel(errorMessage: 'Request cancelled', status: 499),
      );

    case DioExceptionType.connectionError:
      throw ConnectionErrorException(
        ErrorModel(errorMessage: 'No Internet Connection', status: 503),
      );

    case DioExceptionType.unknown:
      throw UnknownException(
        ErrorModel(errorMessage: 'Unknown Error Occurred', status: 500),
      );

    case DioExceptionType.badResponse:
      final statusCode = e.response?.statusCode ?? 500;
      final errorModel = parseError();

      switch (statusCode) {
        case 400:
          throw BadRequestException(errorModel);
        case 401:
          throw UnauthorizedException(errorModel);
        case 403:
          throw ForbiddenException(errorModel);
        case 404:
          throw NotFoundException(errorModel);
        case 409:
          throw ConflictException(errorModel);
        case 504:
          throw GatewayTimeoutException(errorModel);
        default:
          throw GenericHttpException(errorModel);
      }
  }
}
