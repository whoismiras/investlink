import 'package:dio/dio.dart';
import 'package:polygon_crypto/core/utils/bearer_interceptor.dart';

class HttpClient {
  HttpClient({required baseUrl}) {
    initHttp(baseUrl);
  }

  Future<Dio> initHttp(baseUrl) async {
    final BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
    );
    _dio = Dio(options);
    _dio.options.connectTimeout = Duration(seconds: 50);
    _dio.options.receiveTimeout = Duration(seconds: 30);
    _dio.interceptors.add(BearerTokenInterceptor());
    return _dio;
  }

  late Dio _dio;

  static const String refreshPath = '/auth/refresh';
  static const String accessTokenKey = 'access';
  static const String refreshTokenKey = 'refresh';

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
      options: options,
    );
  }

  Future post(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.post(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future put(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.put(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future patch(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.patch(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }

  Future delete(
    String path, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) {
    return _dio.delete(
      path,
      data: data,
      options: options,
      cancelToken: cancelToken,
    );
  }
}

Future<Dio> initHttp(baseUrl) async {
  late final Dio _dio;
  final BaseOptions options = BaseOptions(
    baseUrl: baseUrl,
  );

  _dio = Dio(options);
  _dio.options.connectTimeout = Duration(seconds: 50);
  _dio.options.receiveTimeout = Duration(seconds: 30);
  _dio.interceptors.add(BearerTokenInterceptor());
  return _dio;
}
