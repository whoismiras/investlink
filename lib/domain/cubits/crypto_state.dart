part of 'crypto_cubit.dart';

enum Status { initial, name, price, change }

class CryptoState extends Equatable {
  final List<TickerModel> cryptoCurrencies;
  final Status sortStatus;
  final bool isLoading;

  CryptoState({
    this.cryptoCurrencies = const [],
    this.sortStatus = Status.initial,
    this.isLoading = true,
  });

  CryptoState copyWith({
    List<TickerModel>? cryptoCurrencies,
    Status? sortStatus,
    bool? isLoading,
  }) {
    return CryptoState(
      cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
      sortStatus: sortStatus ?? this.sortStatus,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        cryptoCurrencies,
        isLoading,
      ];
}
