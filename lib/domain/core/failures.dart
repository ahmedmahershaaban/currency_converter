import 'package:freezed_annotation/freezed_annotation.dart';

part 'failures.freezed.dart';

/// A generic class which provides ValueFailure in a friendly format
/// to users.
///
/// ```dart
/// final name = Name('');
/// // [name.value] will be [ValueFailure.empty]
/// ```
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  /// This failure will occur when the input length of [ValueObject] is more than [max] number.
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int max,
  }) = ExceedingLength<T>;

  /// This failure will occur when the input value of [ValueObject] is empty.
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;

  /// This failure will occur when the input value of [ValueObject] is equal to `null`.
  const factory ValueFailure.nullValue() = NullValue;

  /// This failure will occur when the input type of [ValueObject] can not be converted with the needed type for [ValueObject].
  const factory ValueFailure.unexpectedConversionError() = UnexpectedConversionError;

  /// This failure will occur when the input type of [ValueObject] is not matching what is needing.
  const factory ValueFailure.unexpectedValue({
    required T failedValue,
  }) = UnexpectedValue;

  /// This failure will occur when the input type of [ValueObject] is not `num`.
  const factory ValueFailure.invalidNumber({
    required T failedValue,
  }) = InvalidNumber<T>;

  /// This failure will occur when the input type of [ValueObject] is not `num`.
  const factory ValueFailure.negativeNumber({
    required T failedValue,
  }) = NegativeNumber<T>;

  /// This failure will occur when the input value of [ValueObject] is more than 1 line.
  const factory ValueFailure.multiline({
    required T failedValue,
  }) = Multiline<T>;

  /// This failure will occur when the input list length of [ValueObject] is more than the `max` length assigned
  /// in the [ValueObject].
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;

  /// This failure will occur when the input value of [ValueObject] should be email and it's not.
  const factory ValueFailure.invalidEmail({
    required T failedValue,
  }) = InvalidEmail<T>;

  /// This failure will occur when the input value of [ValueObject] is not the type `Option<String>`.
  const factory ValueFailure.invalidOptionString({
    required T failedValue,
  }) = InvalidOptionString<T>;

  /// This failure will occur when the input value of [ValueObject] should be URL and it's not.
  const factory ValueFailure.invalidUrl({
    required T failedValue,
  }) = InvalidUrl<T>;

  /// This failure will occur when the input value of [ValueObject] should be phone number format
  /// and it's not.
  const factory ValueFailure.invalidPhoneNumber({
    required T failedValue,
  }) = InvalidPhoneNumber<T>;

  /// This failure will occur when the input value of [ValueObject] should be a password that will
  /// need some validation and it did not pass the predefined password rules.
  const factory ValueFailure.invalidPassword({
    required T failedValue,
  }) = InvalidPassword<T>;

  /// This failure will occur when the input value of [ValueObject] should be a invalid color integer.
  const factory ValueFailure.invalidColorLength({
    required T failedValue,
  }) = InvalidColorLength<T>;

  /// This failure will occur when the input value of [ValueObject] should be a invalid Date Time.
  const factory ValueFailure.invalidDateTime() = InvalidDateTime;
}
