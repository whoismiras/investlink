import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';
import 'package:polygon_crypto/data/repositories/crypto_repository.dart';
import 'package:polygon_crypto/domain/models/ticker_model.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit()
      : _cryptoRepository = sl(),
        super(const CryptoState());

  final CryptoRepository _cryptoRepository;

  void getCryptoData() async {
    final data = await _cryptoRepository.getCryptoData();
    emit(state);
    print('asd');
  }
}
