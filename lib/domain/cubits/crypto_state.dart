part of 'crypto_cubit.dart';

class CryptoState extends Equatable {
  final List<TickerModel> cryptoCurrencies;
  final List<CryptoModel>? currency;
  final Status sortStatus;
  final bool isLoading;
  final List<CryptoDateFilter> currentDateFilter;
  final int? days;
  final CryptoDateFilter selectedFilter;

  const CryptoState({
    this.cryptoCurrencies = const [],
    this.currency,
    this.sortStatus = Status.initial,
    this.isLoading = true,
    this.currentDateFilter = CryptoDateFilter.values,
    this.days,
    this.selectedFilter = CryptoDateFilter.oneD,
  });

  CryptoState copyWith({
    List<TickerModel>? cryptoCurrencies,
    List<CryptoModel>? currency,
    Status? sortStatus,
    bool? isLoading,
    List<CryptoDateFilter>? currentDateFilter,
    int? days,
    CryptoDateFilter? selectedFilter,
  }) {
    return CryptoState(
      cryptoCurrencies: cryptoCurrencies ?? this.cryptoCurrencies,
      currency: currency ?? this.currency,
      sortStatus: sortStatus ?? this.sortStatus,
      isLoading: isLoading ?? this.isLoading,
      currentDateFilter: currentDateFilter ?? this.currentDateFilter,
      days: days ?? days,
      selectedFilter: selectedFilter ?? this.selectedFilter,
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
        selectedFilter,
      ];
}
