import 'package:currency_converter/domain/core/failures.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/core/value_validators.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// [ValueObject] that represent the `String` in the valid form.
///
/// Uses [validateNullValue] and [validateStringNotEmpty] and [validateSingleLine]
/// to valid the input type `String`.
///
/// A [ValueFailure] maybe returned with the following failures:
/// [ValueFailure.nullValue].
/// [ValueFailure.empty].
/// [ValueFailure.multiline].
class ValidatedFlagSvg extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ValidatedFlagSvg(String? input) {
    return ValidatedFlagSvg._(
      validateNullValue<String>(input).flatMap(validateStringNotEmpty).flatMap(
            validateSingleLine,
          ),
    );
  }
  const ValidatedFlagSvg._(this.value);

  /// Return `Widget` of type [Container] or [SvgPicture] for UI access.
  Widget toSvgPictureWidget([double size = 25]) {
    return value.fold(
      (f) => Container(
        width: size.w,
        height: size.w,
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      (v) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: SvgPicture.string(
          v,
          width: size.w,
          height: size.w,
        ),
      ),
    );
  }
}
