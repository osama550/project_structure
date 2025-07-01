import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> patch({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  });

  Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  });
}

// Enum for HTTP request methods
enum ApiRequestMethods { get, post, put, patch, delete }
