import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker_model.g.dart';

@JsonSerializable()
class TickerModel extends Equatable {
  const TickerModel({
    this.name,
    this.price,
    this.high,
    this.low,
  });

  factory TickerModel.fromJson(Map<String, dynamic> json) =>
      _$TickerModelFromJson(json);

  Map<String, dynamic> toJson() => _$TickerModelToJson(this);

  @JsonKey(name: 'T')
  final String? name;

  @JsonKey(name: 'c')
  final double? price;

  @JsonKey(name: 'h')
  final double? high;

  @JsonKey(name: 'l')
  final double? low;

  @override
  List<Object?> get props => [
        name,
        price,
        high,
        low,
      ];
}
