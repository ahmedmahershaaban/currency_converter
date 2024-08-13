import 'dart:ui';

import 'package:currency_converter/domain/core/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/kt.dart';

/// Validate if length of input `String` is not exceeding [maxLength].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.exceedingLength].
Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.exceedingLength(failedValue: input, max: maxLength),
    );
  }
}

/// Validate if input `String` is not empty.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.empty].
Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

/// Validate if input `String?` is not `null`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
Either<ValueFailure<T>, T> validateNullValue<T>(dynamic input) {
  if (input != null) {
    return right(input);
  } else {
    return left(const ValueFailure.nullValue());
  }
}

/// Validate if input `String` is `int` type.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidNumber].
Either<ValueFailure<String>, String> validateInt(String input) {
  try {
    int.parse(input);
    return right(input);
  } catch (e) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  }
}

/// Validate if input `String` is `double` type.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidNumber].
Either<ValueFailure<String>, String> validateDouble(String input) {
  try {
    double.parse(input);
    return right(input);
  } catch (e) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  }
}

/// Validate if input `double` is `positive` type.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidNumber].
Either<ValueFailure<String>, String> validatePositiveDouble(String input) {
  try {
    final number = double.parse(input);
    if (number < 0) {
      return left(ValueFailure.negativeNumber(failedValue: input));
    } else {
      return right(input);
    }
  } catch (e) {
    return left(ValueFailure.invalidNumber(failedValue: input));
  }
}

/// Validate if input `String` is one line and does not contains any breaking lines.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.multiline].
Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else {
    return right(input);
  }
}

/// Validate if input `KtList` length is not exceeding the [maxLength].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.listTooLong].
Either<ValueFailure<KtList<T>>, KtList<T>> validateMaxListLength<T>(
  KtList<T> input,
  int maxLength,
) {
  if (input.size <= maxLength) {
    return right(input);
  } else {
    return left(
      ValueFailure.listTooLong(
        failedValue: input,
        max: maxLength,
      ),
    );
  }
}

/// Validate if input `String` is matching the [emailRegex].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidEmail].
Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex = r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

/// Validate if input `String` is matching the [phoneNumberRegex].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidPhoneNumber].
Either<ValueFailure<String>, String> validatePhoneNumber(String input) {
  String phoneNumberRegex = r'^\+?[0-9\s\-()]{10,15}$';
  if (RegExp(phoneNumberRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input));
  }
}

/// Validate if input `String` is matching the [urlRegex].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidUrl].
Either<ValueFailure<String>, String> validateUrl(String input) {
  String urlRegex = r'^(https?:\/\/)?([\da-z.-]+)\.([a-z.]{2,6})([/\w .-]*)*\/?$';
  if (RegExp(urlRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidUrl(failedValue: input));
  }
}

/// Validate if input `String` is matching the [passwordRegex].
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidPassword].
Either<ValueFailure<String>, String> validatePassword(String input) {
  const passwordRegex = r"""^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$""";
  // const passwordRegex = r"""^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$^\-_\=\+\\|()\[\]\{\}%&*~]).{8,}$""";
  if (RegExp(passwordRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPassword(failedValue: input));
  }
}

/// Validate if input `Color` length is a valid length.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.invalidColorLength].
Either<ValueFailure<Color>, Color> validateColorLength(Color input) {
  if (input.value.toString().length == 10) {
    return right(input);
  } else {
    return left(ValueFailure.invalidColorLength(failedValue: input));
  }
}
