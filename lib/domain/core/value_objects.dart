import 'package:currency_converter/domain/core/errors.dart';
import 'package:currency_converter/domain/core/failures.dart';
import 'package:currency_converter/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// The main interface for all [ValueObject]s that will be build later.
@immutable
abstract class ValueObject<T> {
  const ValueObject();

  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  T getOrCrash() {
    // id = identity - same as writing (right)=> right
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  /// Return `Unit` if there is no error in the [ValueObject]
  /// else return [ValueFailure].
  Either<ValueFailure<dynamic>, Unit> get failureOrUnit {
    return value.fold(
      (f) => left(f),
      (r) => right(unit),
    );
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueObject<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;
  @override
  String toString() => 'Value($value)';
}

/// [ValueObject] that represent the ID .
///
/// should always contains `String` in it's value as it will be generated from
/// a string by [UniqueId.fromUniqueString] or create from automatically by
/// [Uuid] package when calling [UniqueId].
///
/// ```dart
///  final id1 = UniqueId.fromUniqueString('20');
///  final id2 = UniqueId.fromUniqueString('20');
///
///  print(id1 == id2) // true
/// ```
///
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
///
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  /// generate [UniqueId] from any `String`.
  factory UniqueId.fromUniqueString(String input) {
    return UniqueId._(
      validateStringNotEmpty(input).flatMap(validateSingleLine),
    );
  }
  const UniqueId._(this.value);
}

/// [ValueObject] that represent the `int` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateInt]
/// to valid the input type `int`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidNumber].
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [toInt] function is called while the value inside the [ValidatedInt] is [ValueFailure].
class ValidatedInt extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedInt(String? input) {
    return ValidatedInt._(
      validateNullValue<String>(input).flatMap(validateStringNotEmpty).flatMap(validateInt),
    );
  }
  const ValidatedInt._(this.value);

  /// Return the value of [ValueObject] in `int` format
  ///
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  int toInt() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => int.parse(v),
    );
  }

  /// generate [ValidatedInt] from `num` maybe `int` or `double`.
  ///
  /// ``` dart
  ///
  ///  final num1 =  ValidatedInt.fromNumber(1.1);
  ///  final num2 =  ValidatedInt.fromNumber(1);
  ///
  /// ```
  factory ValidatedInt.fromNumber(num number) {
    return ValidatedInt(number.toString());
  }
}

/// [ValueObject] that represent the `double` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateInt]
/// to valid the input type `double`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.invalidNumber].
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [toDouble] function is called while the value inside the [ValidatedDouble] is [ValueFailure].
class ValidatedDouble extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedDouble(String? input) {
    return ValidatedDouble._(
      validateNullValue<String>(input).flatMap(validateStringNotEmpty).flatMap(validateDouble).flatMap(validatePositiveDouble),
    );
  }
  const ValidatedDouble._(this.value);

  /// Return the value of [ValueObject] in `double` format
  ///
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  double toDouble() {
    return value.fold(
      (f) => throw UnexpectedValueError(f),
      (v) => double.parse(v),
    );
  }

  /// generate [ValidatedDouble] from `num` maybe `int` or `double`.
  ///
  /// ``` dart
  ///
  ///  final num1 =  ValidatedDouble.fromNumber(1.1);
  ///  final num2 =  ValidatedDouble.fromNumber(1);
  ///
  /// ```
  factory ValidatedDouble.fromNumber(num number) {
    return ValidatedDouble(number.toString());
  }
}

/// [ValueObject] that represent the `DateTime` in the valid form.
///
/// This value must always be `right()` side.
///
/// An [UnexpectedValueError] maybe thrown for the following seniors:
/// 1- the [hoursWithZeroMinutes] function is called while the value inside the [DuoDate] is [ValueFailure].
class DuoDate extends ValueObject<DateTime> {
  @override
  final Either<ValueFailure<DateTime>, DateTime> value;

  factory DuoDate(DateTime? input) {
    return DuoDate._(
      validateNullValue<DateTime>(input).fold(
        (f) => left(const ValueFailure.invalidDateTime()),
        (r) => right(r),
      ),
    );
  }
  const DuoDate._(this.value);

  factory DuoDate.now() => DuoDate(DateTime.now());

  /// generate [DuoDate] from `String` for the following `yyyy-mm-dd`.
  ///
  /// ``` dart
  ///
  ///  final conversionRateDate = DuoDate.fromStringDataOfConversionHistory('2024-08-06');
  ///  print(conversionRateDate.getOrCrash().runtimeType) // DateTime
  ///
  /// ```
  factory DuoDate.fromStringDateOfConversionHistory(String dateTimeString) {
    try {
      final dateTime = DateTime.parse(dateTimeString);
      return DuoDate(dateTime);
    } catch (e) {
      return DuoDate(null);
    }
  }

  /// Return the value of [ValueObject] in `String` format
  ///
  /// ``` dart
  ///
  ///  final duoDate = DuoDate(DateTime.now());
  ///  print(duoDate.toStringFormatForConversionHistory()) // 2024-08-12
  ///
  /// ```
  /// This function is like [getOrCrash] where it will throw [Error] not [ValueFailure].
  /// Throws [UnexpectedValueFailure] containing the [ValueFailure].
  String toStringFormatForConversionHistory() {
    return DateFormat('yyyy-MM-dd').format(value.fold(
      (f) => throw UnexpectedValueError(f),
      id,
    ));
  }
}

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateSingleLine]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
class ValidatedNormalString extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedNormalString(String? input) {
    return ValidatedNormalString._(
      validateNullValue<String>(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
  const ValidatedNormalString._(this.value);
}
