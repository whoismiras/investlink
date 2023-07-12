part of 'crypto_cubit.dart';

class CryptoState extends Equatable {
  const CryptoState({
    this.data,
  });
  final TickerModel? data;

  @override
  List<Object?> get props => [data];
}
