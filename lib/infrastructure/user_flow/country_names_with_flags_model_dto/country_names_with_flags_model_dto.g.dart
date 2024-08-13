// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_names_with_flags_model_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$countryNamesWithFlagsModelDtoImpl
    _$$countryNamesWithFlagsModelDtoImplFromJson(Map json) =>
        _$countryNamesWithFlagsModelDtoImpl(
          countryFullName: json['countryFullName'] as String?,
          countryShortName: json['countryShortName'] as String?,
          currencyFlagSvg: json['currencyFlagSvg'] as String?,
          countryAlpha3: json['countryAlpha3'] as String?,
          currencyFullName: json['currencyFullName'] as String?,
          currencyId: json['currencyId'] as String?,
          currencySymbol: json['currencySymbol'] as String?,
        );

Map<String, dynamic> _$$countryNamesWithFlagsModelDtoImplToJson(
        _$countryNamesWithFlagsModelDtoImpl instance) =>
    <String, dynamic>{
      'countryFullName': instance.countryFullName,
      'countryShortName': instance.countryShortName,
      'currencyFlagSvg': instance.currencyFlagSvg,
      'countryAlpha3': instance.countryAlpha3,
      'currencyFullName': instance.currencyFullName,
      'currencyId': instance.currencyId,
      'currencySymbol': instance.currencySymbol,
    };
