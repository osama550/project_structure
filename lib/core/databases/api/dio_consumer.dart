import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_structure/core/databases/api/api_consumer.dart';
import 'package:project_structure/core/databases/api/end_points.dart';
import 'package:project_structure/core/databases/cache/app_secure_storage.dart';
import 'package:project_structure/core/di/service_locator.dart';
import 'package:project_structure/core/errors/error_model.dart';
import 'package:project_structure/core/errors/exceptions.dart';

class DioConsumer extends ApiConsumer {
  late final Dio _dio;
  bool _isInitialized = false;

  DioConsumer() {
    _initializeDio();
  }

  /// Initializes Dio with base options and interceptors
  Future<void> _initializeDio() async {
    if (_isInitialized) return;

    _dio = Dio(
      BaseOptions(
        baseUrl: EndPoints.baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );

    _isInitialized = true;
  }

  /// Generic request handler for all HTTP methods
  Future<Response> _request(
    ApiRequestMethods method, {
    required String endPoint,
    dynamic data,
    Map<String, dynamic>? queryParameters,
  }) async {
    final String? token = await getIt.get<AppSecureStorage>().getToken();
    final headers = {
      if (token != null) 'Authorization': 'Bearer $token',
    };

    try {
      final options = Options(headers: headers);

      switch (method) {
        case ApiRequestMethods.get:
          return await _dio.get(
            endPoint,
            queryParameters: queryParameters,
            data: data,
            options: options,
          );
        case ApiRequestMethods.post:
          return await _dio.post(
            endPoint,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case ApiRequestMethods.put:
          return await _dio.put(
            endPoint,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case ApiRequestMethods.patch:
          return await _dio.patch(
            endPoint,
            data: data,
            queryParameters: queryParameters,
            options: options,
          );
        case ApiRequestMethods.delete:
          return await _dio.delete(
            endPoint,
            data: data,
            queryParameters: queryParameters,
            options: options,
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
    bool useToken = true,
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
