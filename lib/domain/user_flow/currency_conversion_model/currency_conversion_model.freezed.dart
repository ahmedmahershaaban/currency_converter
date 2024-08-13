// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_conversion_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CurrencyConversionModel {
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
  ValidatedDouble get fromToConversion => throw _privateConstructorUsedError;

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
  ValidatedDouble get toFromConversion => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyConversionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyConversionModelCopyWith<CurrencyConversionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConversionModelCopyWith<$Res> {
  factory $CurrencyConversionModelCopyWith(CurrencyConversionModel value,
          $Res Function(CurrencyConversionModel) then) =
      _$CurrencyConversionModelCopyWithImpl<$Res, CurrencyConversionModel>;
  @useResult
  $Res call(
      {ValidatedDouble fromToConversion, ValidatedDouble toFromConversion});
}

/// @nodoc
class _$CurrencyConversionModelCopyWithImpl<$Res,
        $Val extends CurrencyConversionModel>
    implements $CurrencyConversionModelCopyWith<$Res> {
  _$CurrencyConversionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyConversionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversion = null,
    Object? toFromConversion = null,
  }) {
    return _then(_value.copyWith(
      fromToConversion: null == fromToConversion
          ? _value.fromToConversion
          : fromToConversion // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      toFromConversion: null == toFromConversion
          ? _value.toFromConversion
          : toFromConversion // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$currencyConversionModelImplCopyWith<$Res>
    implements $CurrencyConversionModelCopyWith<$Res> {
  factory _$$currencyConversionModelImplCopyWith(
          _$currencyConversionModelImpl value,
          $Res Function(_$currencyConversionModelImpl) then) =
      __$$currencyConversionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValidatedDouble fromToConversion, ValidatedDouble toFromConversion});
}

/// @nodoc
class __$$currencyConversionModelImplCopyWithImpl<$Res>
    extends _$CurrencyConversionModelCopyWithImpl<$Res,
        _$currencyConversionModelImpl>
    implements _$$currencyConversionModelImplCopyWith<$Res> {
  __$$currencyConversionModelImplCopyWithImpl(
      _$currencyConversionModelImpl _value,
      $Res Function(_$currencyConversionModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyConversionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversion = null,
    Object? toFromConversion = null,
  }) {
    return _then(_$currencyConversionModelImpl(
      fromToConversion: null == fromToConversion
          ? _value.fromToConversion
          : fromToConversion // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      toFromConversion: null == toFromConversion
          ? _value.toFromConversion
          : toFromConversion // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
    ));
  }
}

/// @nodoc

class _$currencyConversionModelImpl extends _currencyConversionModel {
  const _$currencyConversionModelImpl(
      {required this.fromToConversion, required this.toFromConversion})
      : super._();

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
  @override
  final ValidatedDouble fromToConversion;

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
  @override
  final ValidatedDouble toFromConversion;

  @override
  String toString() {
    return 'CurrencyConversionModel(fromToConversion: $fromToConversion, toFromConversion: $toFromConversion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$currencyConversionModelImpl &&
            (identical(other.fromToConversion, fromToConversion) ||
                other.fromToConversion == fromToConversion) &&
            (identical(other.toFromConversion, toFromConversion) ||
                other.toFromConversion == toFromConversion));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, fromToConversion, toFromConversion);

  /// Create a copy of CurrencyConversionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$currencyConversionModelImplCopyWith<_$currencyConversionModelImpl>
      get copyWith => __$$currencyConversionModelImplCopyWithImpl<
          _$currencyConversionModelImpl>(this, _$identity);
}

abstract class _currencyConversionModel extends CurrencyConversionModel {
  const factory _currencyConversionModel(
          {required final ValidatedDouble fromToConversion,
          required final ValidatedDouble toFromConversion}) =
      _$currencyConversionModelImpl;
  const _currencyConversionModel._() : super._();

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
  @override
  ValidatedDouble get fromToConversion;

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
  @override
  ValidatedDouble get toFromConversion;

  /// Create a copy of CurrencyConversionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$currencyConversionModelImplCopyWith<_$currencyConversionModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
