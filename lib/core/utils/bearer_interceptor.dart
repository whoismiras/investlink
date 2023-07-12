import 'package:dio/dio.dart';
import 'package:polygon_crypto/core/const.dart';
import 'package:polygon_crypto/core/utils/http_client.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';

class BearerTokenInterceptor extends InterceptorsWrapper {
  HttpClient httpClient = sl.get<HttpClient>();

  BearerTokenInterceptor(this.httpClient);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers["Authorization"] = "Bearer $bearerToken";

    super.onRequest(options, handler);
  }
}
