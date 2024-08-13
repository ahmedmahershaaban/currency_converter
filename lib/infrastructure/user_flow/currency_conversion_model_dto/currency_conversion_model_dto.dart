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
    required String? fromToConversion,

    /// Country short name in (ISO 3166 country code) format.
    required String? toFromConversion,
  }) = _currencyConversionModelDto;

  /// Responsible to generate [CurrencyConversionModelDto] from [CurrencyConversionModel].
  factory CurrencyConversionModelDto.fromDomain(CurrencyConversionModel currencyConversionModel) {
    return CurrencyConversionModelDto(
      fromToConversion: currencyConversionModel.fromToConversion.getOrCrash(),
      toFromConversion: currencyConversionModel.toFromConversion.getOrCrash(),
    );
  }

  /// Responsible to generate [CurrencyConversionModel] from [CurrencyConversionModelDto].
  CurrencyConversionModel toDomain() {
    return CurrencyConversionModel(
      fromToConversion: ValidatedDouble(fromToConversion),
      toFromConversion: ValidatedDouble(toFromConversion),
    );
  }

  /// Responsible to generate `Json` format from [CurrencyConversionModelDto].
  factory CurrencyConversionModelDto.fromJson(Map<String, dynamic> json) => _$CurrencyConversionModelDtoFromJson(json);
}
