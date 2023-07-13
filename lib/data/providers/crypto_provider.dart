import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'package:polygon_crypto/core/utils/http_client.dart';

import 'package:polygon_crypto/core/utils/service_locator.dart';

class CryptoProvider {
  final HttpClient _httpClient;
  CryptoProvider() : _httpClient = sl();
  final String today = DateFormat('y-MM-dd')
      .format(DateTime.now().subtract(const Duration(days: 1)));

  Future<Response> getCryptoData() async {
    return await _httpClient.get(
      '/grouped/locale/global/market/crypto/$today',
    );
  }

  Future<Response> getCurrencyData(String cryptoTicker, [int days = 1]) async {
    final String dateRange = DateFormat('y-MM-dd')
        .format(DateTime.now().subtract(Duration(days: days)));

    return await _httpClient
        .get('/ticker/$cryptoTicker/range/1/day/$dateRange/$today');
  }
}
