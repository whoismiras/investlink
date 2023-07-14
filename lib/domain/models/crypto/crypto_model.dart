import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'crypto_model.g.dart';

@JsonSerializable()
class CryptoModel extends Equatable {
  const CryptoModel({
    this.close,
    this.open,
    this.high,
    this.low,
  });

  factory CryptoModel.fromJson(Map<String, dynamic> json) =>
      _$CryptoModelFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoModelToJson(this);

  @JsonKey(name: 'c')
  final double? close;

  @JsonKey(name: 'o')
  final double? open;

  @JsonKey(name: 'h')
  final double? high;

  @JsonKey(name: 'l')
  final double? low;

  @override
  List<Object?> get props => [
        close,
        open,
        high,
        low,
      ];
}
