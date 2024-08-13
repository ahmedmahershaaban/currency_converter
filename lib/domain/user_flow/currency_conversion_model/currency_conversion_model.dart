import 'package:currency_converter/domain/core/failures.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'currency_conversion_model.freezed.dart';

@freezed
abstract class CurrencyConversionModel implements _$CurrencyConversionModel {
  const CurrencyConversionModel._();

  const factory CurrencyConversionModel({
    /// having the conversion rate between [fromCurrency] and [toCurrency] respectively.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.invalidNumber].
    ///
    /// An [UnexpectedValueError] maybe thrown for the following seniors:
    /// 1- the [toInt] function is called while the value inside the [ValidatedInt] is [ValueFailure].
    required ValidatedDouble fromToConversion,

    /// having the conversion rate between [toCurrency] and [fromCurrency] respectively.
    ///
    /// Contains `Either<ValueFailure<String> , String>`.
    ///
    ///
    /// A [ValueFailure] maybe returned with the following failures:
    /// [ValueFailure.nullValue].
    /// [ValueFailure.empty].
    /// [ValueFailure.invalidNumber].
    ///
    /// An [UnexpectedValueError] maybe thrown for the following seniors:
    /// 1- the [toInt] function is called while the value inside the [ValidatedInt] is [ValueFailure].
    required ValidatedDouble toFromConversion,
  }) = _currencyConversionModel;

  /// Return [CurrencyConversionModel].
  ///
  /// Easy creation for [CurrencyConversionModel] with only passing [fromToConversion] and [toFromConversion].
  factory CurrencyConversionModel.create({
    required ValidatedDouble fromToConversion,
    required ValidatedDouble toFromConversion,
  }) =>
      CurrencyConversionModel(
        fromToConversion: fromToConversion,
        toFromConversion: toFromConversion,
      );

  /// Validate the data inside the [CurrencyConversionModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return fromToConversion.failureOrUnit.andThen(toFromConversion.failureOrUnit).fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
