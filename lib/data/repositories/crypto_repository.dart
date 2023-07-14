import 'package:dio/dio.dart';
import 'package:polygon_crypto/data/providers/crypto_provider.dart';
import 'package:polygon_crypto/domain/models/crypto/crypto_model.dart';
import 'package:polygon_crypto/domain/models/ticker/ticker_model.dart';

class CryptoRepository {
  final CryptoProvider _provider;
  CryptoRepository() : _provider = CryptoProvider();

  Future<List<TickerModel>> getCryptoData() async {
    final Response response = await _provider.getCryptoData();
    return (response.data['results'] as List<dynamic>?)
            ?.map((e) => TickerModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [];
  }

  Future<List<CryptoModel>> getCurrencyData(String cryptoTicker,
      {int days = 1}) async {
    final Response response =
        await _provider.getCurrencyData(cryptoTicker, days);
    return (response.data['results'] as List<dynamic>?)
            ?.map((e) => CryptoModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [];
  }
}
