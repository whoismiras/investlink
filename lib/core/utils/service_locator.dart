import 'package:get_it/get_it.dart';
import 'package:polygon_crypto/core/utils/http_client.dart';
import 'package:polygon_crypto/data/providers/crypto_provider.dart';
import 'package:polygon_crypto/data/repositories/crypto_repository.dart';

final GetIt sl = GetIt.instance;

void setupServiceLocator() {
  sl
    ..registerLazySingleton<HttpClient>(
      () => HttpClient(baseUrl: 'https://api.polygon.io/v2'),
    )
    ..registerLazySingleton<CryptoRepository>(() => CryptoRepository())
    ..registerLazySingleton<CryptoProvider>(() => CryptoProvider());
}
