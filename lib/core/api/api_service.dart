import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:project_structure/core/cache/app_secure_storage.dart';
import 'package:project_structure/core/constant/end_points.dart';

class ApiService {
  late Dio _dio;

  ApiService() {
    _initializeDio().then((value) => _dio = value);
  }

  Future<Dio> _initializeDio() async {
    Dio dio = Dio(
      BaseOptions(
        receiveDataWhenStatusError: true,
        baseUrl: AppEndPoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
      ),
    );
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
      ),
    );
    return dio;
  }

  Future<Response> _request(ApiRequstMethods method,
      {required String endPoint,
      dynamic data,
      Map<String, dynamic>? queryParameters,
      bool useToken = false}) async {
    // String? locale = await getIt.get<CacheHelper>().getCachedLanguageCode();
    final String? token = await AppSecureStorage.instance.getToken();
    Map<String, String> headers = {
      // 'locale': locale,
      "Content-Type": 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token ?? ""}'
      // if (useToken) 'Authorization': 'Bearer $token',
    };
    switch (method) {
      case ApiRequstMethods.get:
        return _dio.get(endPoint,
            queryParameters: queryParameters,
            options: Options(headers: headers));
      case ApiRequstMethods.post:
        return _dio.post(endPoint,
            data: data, options: Options(headers: headers));
      case ApiRequstMethods.put:
        return _dio.put(endPoint,
            data: data, options: Options(headers: headers));
      case ApiRequstMethods.patch:
        return _dio.patch(endPoint,
            data: data, options: Options(headers: headers));
      case ApiRequstMethods.delete:
        return _dio.delete(endPoint, options: Options(headers: headers));
      default:
        throw ArgumentError('Invalid HTTP method.');
    }
  }

  Future<Response> get({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    bool useToken = false,
  }) async =>
      _request(ApiRequstMethods.get,
          endPoint: endPoint,
          queryParameters: queryParameters,
          useToken: useToken);

  Future<Response> post({
    required String endPoint,
    dynamic data,
    bool useToken = false,
  }) async =>
      _request(ApiRequstMethods.post,
          endPoint: endPoint, data: data, useToken: useToken);

  Future<Response> put({
    required String endPoint,
    dynamic data,
  }) async =>
      _request(ApiRequstMethods.put,
          endPoint: endPoint, data: data, useToken: true);

  Future<Response> patch({
    required String endPoint,
    dynamic data,
  }) async =>
      _request(ApiRequstMethods.patch,
          endPoint: endPoint, data: data, useToken: true);

  Future<Response> delete({
    required String endPoint,
  }) async =>
      _request(ApiRequstMethods.delete, endPoint: endPoint, useToken: true);
}

enum ApiRequstMethods { get, post, put, patch, delete }
