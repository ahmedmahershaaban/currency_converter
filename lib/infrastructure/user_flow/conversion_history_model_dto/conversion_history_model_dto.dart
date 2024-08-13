import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';

part 'conversion_history_model_dto.freezed.dart';
part 'conversion_history_model_dto.g.dart';

@freezed
abstract class ConversionHistoryModelDto implements _$ConversionHistoryModelDto {
  const ConversionHistoryModelDto._();

  const factory ConversionHistoryModelDto({
    /// Country full name.
    required Map<String, double> fromToConversionHistory,

    /// Country short name in (ISO 3166 country code) format.
    required Map<String, double> toFromConversionHistory,
  }) = _conversionHistoryModelDto;

  /// Responsible to generate [ConversionHistoryModelDto] from [ConversionHistoryModel].
  factory ConversionHistoryModelDto.fromDomain(ConversionHistoryModel conversionHistoryModel) {
    return ConversionHistoryModelDto(
      fromToConversionHistory: conversionHistoryModel.fromToConversionHistory
          .mapKeys((record) => record.key.toStringFormatForConversionHistory())
          .mapValues((record) => record.value.toDouble())
          .asMap(),
      toFromConversionHistory: conversionHistoryModel.toFromConversionHistory
          .mapKeys((record) => record.key.toStringFormatForConversionHistory())
          .mapValues((record) => record.value.toDouble())
          .asMap(),
    );
  }

  /// Responsible to generate [ConversionHistoryModel] from [ConversionHistoryModelDto].
  ConversionHistoryModel toDomain() {
    return ConversionHistoryModel(
      fromToConversionHistory: fromToConversionHistory
          .toImmutableMap()
          .mapKeys((record) => DuoDate.fromStringDateOfConversionHistory(record.key))
          .mapValues((record) => ValidatedDouble(record.value.toString())),
      toFromConversionHistory: toFromConversionHistory
          .toImmutableMap()
          .mapKeys((record) => DuoDate.fromStringDateOfConversionHistory(record.key))
          .mapValues((record) => ValidatedDouble(record.value.toString())),
    );
  }

  /// Responsible to generate `Json` format from [ConversionHistoryModelDto].
  factory ConversionHistoryModelDto.fromJson(Map<String, dynamic> json) => _$ConversionHistoryModelDtoFromJson(json);
}
