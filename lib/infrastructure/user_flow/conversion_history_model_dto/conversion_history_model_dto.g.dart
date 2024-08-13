// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion_history_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$conversionHistoryModelDtoImpl _$$conversionHistoryModelDtoImplFromJson(
        Map json) =>
    _$conversionHistoryModelDtoImpl(
      fromToConversionHistory: (json['fromToConversionHistory'] as Map).map(
        (k, e) => MapEntry(k as String, (e as num).toDouble()),
      ),
      toFromConversionHistory: (json['toFromConversionHistory'] as Map).map(
        (k, e) => MapEntry(k as String, (e as num).toDouble()),
      ),
    );

Map<String, dynamic> _$$conversionHistoryModelDtoImplToJson(
        _$conversionHistoryModelDtoImpl instance) =>
    <String, dynamic>{
      'fromToConversionHistory': instance.fromToConversionHistory,
      'toFromConversionHistory': instance.toFromConversionHistory,
    };
