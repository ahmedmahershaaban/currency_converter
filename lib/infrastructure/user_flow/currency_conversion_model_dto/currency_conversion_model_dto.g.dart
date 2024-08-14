// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_conversion_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$currencyConversionModelDtoImpl _$$currencyConversionModelDtoImplFromJson(
        Map json) =>
    _$currencyConversionModelDtoImpl(
      fromToConversion: (json['fromToConversion'] as num).toDouble(),
      toFromConversion: (json['toFromConversion'] as num).toDouble(),
    );

Map<String, dynamic> _$$currencyConversionModelDtoImplToJson(
        _$currencyConversionModelDtoImpl instance) =>
    <String, dynamic>{
      'fromToConversion': instance.fromToConversion,
      'toFromConversion': instance.toFromConversion,
    };
