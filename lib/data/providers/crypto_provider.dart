import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:polygon_crypto/core/utils/http_client.dart';

import 'package:polygon_crypto/core/utils/service_locator.dart';

class CryptoProvider {
  final HttpClient _httpClient;
  CryptoProvider() : _httpClient = sl();

  Future<Response> getCryptoData() async {
    final String formattedDate = DateFormat('y-MM-dd')
        .format(DateTime.now().subtract(const Duration(days: 1)));
    return await _httpClient.get(
      '/aggs/grouped/locale/global/market/crypto/$formattedDate',
    );
  }
}
