import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:polygon_crypto/core/utils/http_client.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';

class CryptoProvider {
  HttpClient httpClient = sl.get<HttpClient>();

  CryptoProvider(this.httpClient);

  Future<Response> getCryptoData() async {
    final String formattedDate = DateFormat('y-MMMM-d')
        .format(DateTime.now().subtract(Duration(days: 1)));
    return await httpClient.get(
      '/aggs/grouped/locale/global/market/crypto/$formattedDate',
    );
  }
}
