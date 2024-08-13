import 'package:currency_converter/domain/core/failures.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'country_names_with_flags_model.freezed.dart';

@freezed
abstract class CountryNamesWithFlagsModel implements _$CountryNamesWithFlagsModel {
  const CountryNamesWithFlagsModel._();

  const factory CountryNamesWithFlagsModel({
    /// Country full name.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString countryFullName,

    /// Country short name in (ISO 3166 country code) format.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString countryShortName,

    /// Country flag in form of svg.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedFlagSvg currencyFlagSvg,

    /// Country short name in (alpha3) format.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString countryAlpha3,

    /// Currency full name.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString currencyFullName,

    /// Currency ID == currency short name.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString currencyId,

    /// Currency symbol.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.multiline].
    required ValidatedNormalString currencySymbol,
  }) = _CountryNamesWithFlagsModel;

  /// Return [CountryNamesWithFlagsModel].
  ///
  /// Easy creation for [CountryNamesWithFlagsModel] with only passing
  /// [countryFullName] and [countryShortName] and [currencyFlagSvg] and [countryAlpha3] and [currencyFullName] and [currencyId] and [currencySymbol].
  factory CountryNamesWithFlagsModel.create({
    required ValidatedNormalString countryFullName,
    required ValidatedNormalString countryShortName,
    required ValidatedFlagSvg currencyFlagSvg,
    required ValidatedNormalString countryAlpha3,
    required ValidatedNormalString currencyFullName,
    required ValidatedNormalString currencyId,
    required ValidatedNormalString currencySymbol,
  }) =>
      CountryNamesWithFlagsModel(
        countryFullName: countryFullName,
        countryShortName: countryShortName,
        currencyFlagSvg: currencyFlagSvg,
        countryAlpha3: countryAlpha3,
        currencyFullName: currencyFullName,
        currencyId: currencyId,
        currencySymbol: currencySymbol,
      );

  /// Validate the data inside the [CountryNamesWithFlagsModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return countryFullName.failureOrUnit
        .andThen(countryShortName.failureOrUnit)
        .andThen(currencyFlagSvg.failureOrUnit)
        .andThen(countryAlpha3.failureOrUnit)
        .andThen(currencyFullName.failureOrUnit)
        .andThen(currencyId.failureOrUnit)
        .andThen(currencySymbol.failureOrUnit)
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
