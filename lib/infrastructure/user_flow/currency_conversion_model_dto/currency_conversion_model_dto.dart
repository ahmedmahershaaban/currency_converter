import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_conversion_model_dto.freezed.dart';
part 'currency_conversion_model_dto.g.dart';

@freezed
abstract class CurrencyConversionModelDto implements _$CurrencyConversionModelDto {
  const CurrencyConversionModelDto._();

  const factory CurrencyConversionModelDto({
    /// Country full name.
    required double fromToConversion,

    /// Country short name in (ISO 3166 country code) format.
    required double toFromConversion,
  }) = _currencyConversionModelDto;

  /// Responsible to generate [CurrencyConversionModelDto] from [CurrencyConversionModel].
  factory CurrencyConversionModelDto.fromDomain(CurrencyConversionModel currencyConversionModel) {
    return CurrencyConversionModelDto(
      fromToConversion: currencyConversionModel.fromToConversion.toDouble(),
      toFromConversion: currencyConversionModel.toFromConversion.toDouble(),
    );
  }

  /// Responsible to generate [CurrencyConversionModel] from [CurrencyConversionModelDto].
  CurrencyConversionModel toDomain() {
    return CurrencyConversionModel(
      fromToConversion: ValidatedDouble.fromNumber(fromToConversion),
      toFromConversion: ValidatedDouble.fromNumber(toFromConversion),
    );
  }

  /// Responsible to generate `Json` format from [CurrencyConversionModelDto].
  factory CurrencyConversionModelDto.fromJson(Map<String, dynamic> json) => _$CurrencyConversionModelDtoFromJson(json);
}
