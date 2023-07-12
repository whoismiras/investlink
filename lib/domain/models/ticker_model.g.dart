// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TickerModel _$TickerModelFromJson(Map<String, dynamic> json) => TickerModel(
      name: json['T'] as String?,
      price: (json['c'] as num?)?.toDouble(),
      high: (json['h'] as num?)?.toDouble(),
      low: (json['l'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TickerModelToJson(TickerModel instance) =>
    <String, dynamic>{
      'T': instance.name,
      'c': instance.price,
      'h': instance.high,
      'l': instance.low,
    };
