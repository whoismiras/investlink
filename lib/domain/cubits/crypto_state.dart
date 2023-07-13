part of 'crypto_cubit.dart';

enum Status { initial, name, price, change }

enum CryptoDateFilter { oneDay, fiveDays, oneWeek, oneMonth, threeMonths }

class CryptoState extends Equatable {
  final List<TickerModel> cryptoCurrencies;
  final CryptoModel? currency;
  final Status sortStatus;
  final bool isLoading;
  final List<CryptoDateFilter> currentDateFilter;
  final int? days;

  CryptoState({
    this.cryptoCurrencies = const [],
    this.currency,
    this.sortStatus = Status.initial,
    this.isLoading = true,
    this.currentDateFilter = CryptoDateFilter.values,
    this.days,
  });

  CryptoState copyWith({
    List<TickerModel>? cryptoCurrencies,
    CryptoModel? currency,
    Status? sortStatus,
    bool? isLoading,
    List<CryptoDateFilter>? currentDateFilter,
    int? days,
  }) {
    return CryptoState(
      cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
      currency: currency ?? this.currency,
      sortStatus: sortStatus ?? this.sortStatus,
      isLoading: isLoading ?? this.isLoading,
      currentDateFilter: currentDateFilter ?? this.currentDateFilter,
      days: days ?? days,
    );
  }

  @override
  List<Object?> get props => [
        cryptoCurrencies,
        currency,
        sortStatus,
        isLoading,
        currentDateFilter,
        days,
      ];
}
