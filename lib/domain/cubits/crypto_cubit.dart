import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';
import 'package:polygon_crypto/data/repositories/crypto_repository.dart';
import 'package:polygon_crypto/domain/models/crypto/crypto_model.dart';
import 'package:polygon_crypto/domain/models/ticker/ticker_model.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit()
      : _cryptoRepository = sl(),
        super(CryptoState());

  final CryptoRepository _cryptoRepository;

  void getCryptoData() async {
    final data = await _cryptoRepository.getCryptoData();
    emit(
      state.copyWith(
        cryptoCurrencies: data,
        isLoading: false,
      ),
    );
  }

  void sortByName() async {
    final result = state.cryptoCurrencies
      ..sort((a, b) => a.name!.compareTo(b.name!));
    if (state.sortStatus == Status.name) {
      emit(
        state.copyWith(
            cryptoCurrencies: state.cryptoCurrencies,
            sortStatus: Status.initial),
      );
    } else {
      emit(
        state.copyWith(cryptoCurrencies: result, sortStatus: Status.name),
      );
    }
  }

  void sortByPrice() async {
    final result = state.cryptoCurrencies
      ..sort((a, b) => a.price!.compareTo(b.price!));
    emit(
      state.copyWith(cryptoCurrencies: result),
    );
  }

  void sortByChange() async {
    final result = state.cryptoCurrencies
      ..sort((a, b) => a.high!.compareTo(b.high!));
    emit(
      state.copyWith(cryptoCurrencies: result),
    );
  }

  void getCurrencyData(String cryptoTicker, {int days = 1}) async {
    final data =
        await _cryptoRepository.getCurrencyData(cryptoTicker, days: days);
    emit(
      state.copyWith(
        currency: data,
        isLoading: false,
        days: days,
      ),
    );
  }

  void activate() {
    if (state.currentDateFilter == true) {
      //   emit(
      //    // state.copyWith(currentDateFilter: ''),
      //   );
      // } else {
      //   emit(
      //    // state.copyWith(currentDateFilter: ''),
      //   );
    }
  }
}
