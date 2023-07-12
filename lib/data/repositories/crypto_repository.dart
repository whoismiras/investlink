import 'package:dio/dio.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';
import 'package:polygon_crypto/data/providers/crypto_provider.dart';
import 'package:polygon_crypto/domain/models/ticker_model.dart';

class CryptoRepository {
  final CryptoProvider _provider = sl();

  Future<List<TickerModel>> getCryptoData() async {
    final Response response = await _provider.getCryptoData();
    return (response.data as List<dynamic>?)
            ?.map((e) => TickerModel.fromJson(e as Map<String, dynamic>))
            .toList() ??
        const [];
  }
}
