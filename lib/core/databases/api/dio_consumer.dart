import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_structure/core/config/env.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/databases/cache/app_secure_storage.dart';
import 'package:project_structure/core/errors/error_model.dart';
import 'package:project_structure/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  final Dio _dio;

  DioConsumer(AppSecureStorage secureStorage)
      : _dio = Dio(
          BaseOptions(
            baseUrl: Env.baseUrl,
            receiveDataWhenStatusError: true,
            connectTimeout: const Duration(seconds: 30),
            sendTimeout: const Duration(seconds: 30),
            receiveTimeout: const Duration(seconds: 30),
            headers: {
              'Content-Type': 'application/json',
              'Accept': 'application/json',
            },
          ),
        ) {
    // Token is read inside the request pipeline so a storage failure is
    // reported as a DioException and mapped like any other request error.
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          try {
            final token = await secureStorage.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
            handler.next(options);
          } catch (e) {
            handler.reject(
              DioException(requestOptions: options, error: e),
              true,
            );
          }
        },
      ),
    );

    // Debug only. Request headers are excluded: they carry the bearer token.
    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(requestBody: true, responseBody: true),
      );
    }
  }

  /// Generic request handler for all HTTP methods
  Future<Response> _request(
    ApiRequestMethods method, {
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      switch (method) {
        case ApiRequestMethods.get:
          return await _dio.get(
            endPoint,
            queryParameters: queryParameters,
            data: data,
          );
        case ApiRequestMethods.post:
          return await _dio.post(
            endPoint,
            data: data,
            queryParameters: queryParameters,
          );
        case ApiRequestMethods.put:
          return await _dio.put(
            endPoint,
            data: data,
            queryParameters: queryParameters,
          );
        case ApiRequestMethods.patch:
          return await _dio.patch(
            endPoint,
            data: data,
            queryParameters: queryParameters,
          );
        case ApiRequestMethods.delete:
          return await _dio.delete(
            endPoint,
            data: data,
            queryParameters: queryParameters,
          );
      }
    } on DioException catch (e) {
      throw handleDioException(e);
    } catch (e) {
      throw ServerException(
          ErrorModel(errorMessage: e.toString(), status: 500));
    }
  }

  @override
  Future<Response> get({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        ApiRequestMethods.get,
        endPoint: endPoint,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Response> post({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        ApiRequestMethods.post,
        endPoint: endPoint,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Response> put({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        ApiRequestMethods.put,
        endPoint: endPoint,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Response> patch({
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        ApiRequestMethods.patch,
        endPoint: endPoint,
        data: data,
        queryParameters: queryParameters,
      );

  @override
  Future<Response> delete({
    required String endPoint,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _request(
        ApiRequestMethods.delete,
        endPoint: endPoint,
        data: data,
        queryParameters: queryParameters,
      );
}
