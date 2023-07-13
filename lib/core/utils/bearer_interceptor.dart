import 'package:dio/dio.dart';
import 'package:polygon_crypto/core/const.dart';

class BearerTokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer $bearerToken";

    super.onRequest(options, handler);
  }
}
