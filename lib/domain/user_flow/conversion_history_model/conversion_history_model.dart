import 'package:currency_converter/domain/core/errors.dart';
import 'package:currency_converter/domain/core/failures.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

part 'conversion_history_model.freezed.dart';

@freezed
abstract class ConversionHistoryModel implements _$ConversionHistoryModel {
  const ConversionHistoryModel._();

  const factory ConversionHistoryModel({
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
    /// 1- the [toStringFormatForConversionHistory] function is called while the value inside the [DuoDate] is [ValueFailure].
    required KtMap<DuoDate, ValidatedDouble> fromToConversionHistory,

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
    /// 1- the [toStringFormatForConversionHistory] function is called while the value inside the [DuoDate] is [ValueFailure].
    required KtMap<DuoDate, ValidatedDouble> toFromConversionHistory,
  }) = _conversionHistoryModel;

  /// Return [ConversionHistoryModel].
  ///
  /// Easy creation for [ConversionHistoryModel] with only passing [fromToConversionHistory] and [toFromConversionHistory].
  factory ConversionHistoryModel.create({
    required KtMap<DuoDate, ValidatedDouble> fromToConversionHistory,
    required KtMap<DuoDate, ValidatedDouble> toFromConversionHistory,
  }) =>
      ConversionHistoryModel(
        fromToConversionHistory: fromToConversionHistory,
        toFromConversionHistory: toFromConversionHistory,
      );

  /// Validate the data inside the [ConversionHistoryModel].
  ///
  /// return `none()` for valid data, and return `ValueFailure<T>` if the data is not valid!
  Option<ValueFailure<dynamic>> get failureOption {
    return fromToConversionHistory
        // Getting the failureOption from the ScheduleModel ENTITY - NOT a failureOrUnit from a VALUE OBJECT
        .map((fromToConversion) {
          if (fromToConversion.key.isValid()) {
            return optionOf(fromToConversion.key.value.fold((f) => f, (r) => null));
          }
          if (fromToConversion.value.isValid()) {
            return optionOf(fromToConversion.value.value.fold((f) => f, (r) => null));
          }
          return none();
        })
        .filter((o) => o.isSome())
        // If we can't get the 0th element, the list is empty. In such a case, it's valid.
        .getOrElse(0, (_) => none())
        .fold(() => right(unit), (f) => left(f))
        .andThen(toFromConversionHistory
            // Getting the failureOption from the ScheduleModel ENTITY - NOT a failureOrUnit from a VALUE OBJECT
            .map((toFromConversion) {
              if (toFromConversion.key.isValid()) {
                return optionOf(toFromConversion.key.value.fold((f) => f, (r) => null));
              }
              if (toFromConversion.value.isValid()) {
                return optionOf(toFromConversion.value.value.fold((f) => f, (r) => null));
              }
              return none();
            })
            .filter((o) => o.isSome())
            // If we can't get the 0th element, the list is empty. In such a case, it's valid.
            .getOrElse(0, (_) => none())
            .fold(() => right(unit), (f) => left(f)))
        .fold(
          (f) => some(f),
          (_) => none(),
        );
  }
}
