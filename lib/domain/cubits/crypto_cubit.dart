import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:polygon_crypto/core/const.dart';
import 'package:polygon_crypto/core/utils/service_locator.dart';
import 'package:polygon_crypto/data/repositories/crypto_repository.dart';
import 'package:polygon_crypto/domain/models/crypto/crypto_model.dart';
import 'package:polygon_crypto/domain/models/ticker/ticker_model.dart';

part 'crypto_state.dart';

class CryptoCubit extends Cubit<CryptoState> {
  CryptoCubit()
      : _cryptoRepository = sl(),
        super(const CryptoState());

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
      state.copyWith(
        cryptoCurrencies: result,
        sortStatus: Status.price,
      ),
    );
  }

  void sortByChange() async {
    final result = state.cryptoCurrencies
      ..sort((a, b) => a.high!.compareTo(b.high!));
    emit(
      state.copyWith(
        cryptoCurrencies: result,
        sortStatus: Status.change,
      ),
    );
  }

  void getCurrencyData(String cryptoTicker,
      {CryptoDateFilter days = CryptoDateFilter.oneD}) async {
    final data = await _cryptoRepository.getCurrencyData(
      cryptoTicker,
      days: getSelectedFilter(days),
    );
    emit(
      state.copyWith(
        currency: data,
        isLoading: false,
        days: getSelectedFilter(days),
        selectedFilter: days,
      ),
    );
  }

  int getSelectedFilter(CryptoDateFilter cryptoDateFilter) {
    switch (cryptoDateFilter) {
      case CryptoDateFilter.oneD:
        return 1;

      case CryptoDateFilter.fiveD:
        return 4;

      case CryptoDateFilter.oneW:
        return 6;

      case CryptoDateFilter.oneM:
        return 29;

      case CryptoDateFilter.threeM:
        return 90;
    }
  }
}
