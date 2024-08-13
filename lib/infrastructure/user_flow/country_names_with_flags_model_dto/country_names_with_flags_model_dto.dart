import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/value_objects.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_names_with_flags_model_dto.freezed.dart';
part 'country_names_with_flags_model_dto.g.dart';

@freezed
abstract class CountryNamesWithFlagsModelDto implements _$CountryNamesWithFlagsModelDto {
  const CountryNamesWithFlagsModelDto._();

  const factory CountryNamesWithFlagsModelDto({
    /// Country full name.
    required String? countryFullName,

    /// Country short name in (ISO 3166 country code) format.
    required String? countryShortName,

    /// Country flag in form of svg.
    required String? currencyFlagSvg,

    /// Country short name in (alpha3) format.
    required String? countryAlpha3,

    /// Currency full name.
    required String? currencyFullName,

    /// Currency ID == currency short name.
    required String? currencyId,

    /// Currency symbol.
    required String? currencySymbol,
  }) = _countryNamesWithFlagsModelDto;

  /// Responsible to generate [CountryNamesWithFlagsModelDto] from [CountryNamesWithFlagsModel].
  factory CountryNamesWithFlagsModelDto.fromDomain(CountryNamesWithFlagsModel countryNamesWithFlagsModel) {
    return CountryNamesWithFlagsModelDto(
      countryFullName: countryNamesWithFlagsModel.countryFullName.getOrCrash(),
      countryShortName: countryNamesWithFlagsModel.countryShortName.getOrCrash(),
      currencyFlagSvg: countryNamesWithFlagsModel.currencyFlagSvg.getOrCrash(),
      countryAlpha3: countryNamesWithFlagsModel.countryAlpha3.getOrCrash(),
      currencyFullName: countryNamesWithFlagsModel.currencyFullName.getOrCrash(),
      currencyId: countryNamesWithFlagsModel.currencyId.getOrCrash(),
      currencySymbol: countryNamesWithFlagsModel.currencySymbol.getOrCrash(),
    );
  }

  /// Responsible to generate [CountryNamesWithFlagsModel] from [CountryNamesWithFlagsModelDto].
  CountryNamesWithFlagsModel toDomain() {
    return CountryNamesWithFlagsModel(
      countryFullName: ValidatedNormalString(countryFullName),
      countryShortName: ValidatedNormalString(countryShortName),
      currencyFlagSvg: ValidatedFlagSvg(currencyFlagSvg),
      countryAlpha3: ValidatedNormalString(countryAlpha3),
      currencyFullName: ValidatedNormalString(currencyFullName),
      currencyId: ValidatedNormalString(currencyId),
      currencySymbol: ValidatedNormalString(currencySymbol),
    );
  }

  /// Responsible to generate [CountryNamesWithFlagsModelDto] from [CountryNamesWithFlagsModelDrift].
  factory CountryNamesWithFlagsModelDto.fromDrift(CountryNamesWithFlagsModelDrift countryNamesWithFlagsModelDrift) {
    return CountryNamesWithFlagsModelDto(
      countryFullName: countryNamesWithFlagsModelDrift.countryFullName,
      countryShortName: countryNamesWithFlagsModelDrift.countryShortName,
      currencyFlagSvg: countryNamesWithFlagsModelDrift.currencyFlagSvg,
      countryAlpha3: countryNamesWithFlagsModelDrift.countryAlpha3,
      currencyFullName: countryNamesWithFlagsModelDrift.currencyFullName,
      currencyId: countryNamesWithFlagsModelDrift.currencyId,
      currencySymbol: countryNamesWithFlagsModelDrift.currencySymbol,
    );
  }

  /// Responsible to generate [CountryNamesWithFlagsModelDrift] from [CountryNamesWithFlagsModelDto].
  CountryNamesWithFlagsModelDrift toDrift() {
    return CountryNamesWithFlagsModelDrift(
      countryFullName: countryFullName!,
      countryShortName: countryShortName!,
      currencyFlagSvg: currencyFlagSvg!,
      countryAlpha3: countryAlpha3!,
      currencyFullName: currencyFullName!,
      currencyId: currencyId!,
      currencySymbol: currencySymbol!,
    );
  }

  /// Responsible to generate `Json` format from [CountryNamesWithFlagsModelDto].
  factory CountryNamesWithFlagsModelDto.fromJson(Map<String, dynamic> json) => _$CountryNamesWithFlagsModelDtoFromJson(json);
}
