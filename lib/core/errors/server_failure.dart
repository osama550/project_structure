import 'package:dio/dio.dart';

import 'failure.dart';

class ServerError extends Failure {
  ServerError(super.errorMessage);
  factory ServerError.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerError('Connection request timeout');
      case DioExceptionType.sendTimeout:
        return ServerError('Send timeout in connection with API server');
      case DioExceptionType.receiveTimeout:
        return ServerError('Receive timeout in connection with API server');
      case DioExceptionType.badCertificate:
        return ServerError('can’t verify the SSL certificate');
      case DioExceptionType.badResponse:
        return ServerError.fromStatusCode(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioExceptionType.cancel:
        return ServerError('Request to Server was canceld');
      case DioExceptionType.connectionError:
        return ServerError('Connection request Error');
      case DioExceptionType.unknown:
        return ServerError('Opps There was an Error, Please try again');
    }
  }
  factory ServerError.fromStatusCode(int statusCode, dynamic response) {
    switch (statusCode) {
      case 401:
        return ServerError('You are not authorized');
      case 400 || 401 || 403:
        return ServerError(response["message"]);
      case 404:
        return ServerError('Not Found');
      case 500:
        return ServerError('Internal Server Error');
      case 429:
        return ServerError('Too many requests');
    }
    return ServerError('Unexpected error occurred');
  }
}
