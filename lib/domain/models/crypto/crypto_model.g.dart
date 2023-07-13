// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoModel _$CryptoModelFromJson(Map<String, dynamic> json) => CryptoModel(
      close: (json['c'] as num?)?.toDouble(),
      open: (json['o'] as num?)?.toDouble(),
      high: (json['h'] as num?)?.toDouble(),
      low: (json['l'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CryptoModelToJson(CryptoModel instance) =>
    <String, dynamic>{
      'c': instance.close,
      'o': instance.open,
      'h': instance.high,
      'l': instance.low,
    };
