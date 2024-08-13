// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'country_names_with_flags_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CountryNamesWithFlagsModel {
  /// Country full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get countryFullName =>
      throw _privateConstructorUsedError;

  /// Country short name in (ISO 3166 country code) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get countryShortName =>
      throw _privateConstructorUsedError;

  /// Country flag in form of svg.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedFlagSvg get currencyFlagSvg => throw _privateConstructorUsedError;

  /// Country short name in (alpha3) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get countryAlpha3 => throw _privateConstructorUsedError;

  /// Currency full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get currencyFullName =>
      throw _privateConstructorUsedError;

  /// Currency ID == currency short name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get currencyId => throw _privateConstructorUsedError;

  /// Currency symbol.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  ValidatedNormalString get currencySymbol =>
      throw _privateConstructorUsedError;

  /// Create a copy of CountryNamesWithFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CountryNamesWithFlagsModelCopyWith<CountryNamesWithFlagsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CountryNamesWithFlagsModelCopyWith<$Res> {
  factory $CountryNamesWithFlagsModelCopyWith(CountryNamesWithFlagsModel value,
          $Res Function(CountryNamesWithFlagsModel) then) =
      _$CountryNamesWithFlagsModelCopyWithImpl<$Res,
          CountryNamesWithFlagsModel>;
  @useResult
  $Res call(
      {ValidatedNormalString countryFullName,
      ValidatedNormalString countryShortName,
      ValidatedFlagSvg currencyFlagSvg,
      ValidatedNormalString countryAlpha3,
      ValidatedNormalString currencyFullName,
      ValidatedNormalString currencyId,
      ValidatedNormalString currencySymbol});
}

/// @nodoc
class _$CountryNamesWithFlagsModelCopyWithImpl<$Res,
        $Val extends CountryNamesWithFlagsModel>
    implements $CountryNamesWithFlagsModelCopyWith<$Res> {
  _$CountryNamesWithFlagsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CountryNamesWithFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryFullName = null,
    Object? countryShortName = null,
    Object? currencyFlagSvg = null,
    Object? countryAlpha3 = null,
    Object? currencyFullName = null,
    Object? currencyId = null,
    Object? currencySymbol = null,
  }) {
    return _then(_value.copyWith(
      countryFullName: null == countryFullName
          ? _value.countryFullName
          : countryFullName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      countryShortName: null == countryShortName
          ? _value.countryShortName
          : countryShortName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyFlagSvg: null == currencyFlagSvg
          ? _value.currencyFlagSvg
          : currencyFlagSvg // ignore: cast_nullable_to_non_nullable
              as ValidatedFlagSvg,
      countryAlpha3: null == countryAlpha3
          ? _value.countryAlpha3
          : countryAlpha3 // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyFullName: null == currencyFullName
          ? _value.currencyFullName
          : currencyFullName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CountryNamesWithFlagsModelImplCopyWith<$Res>
    implements $CountryNamesWithFlagsModelCopyWith<$Res> {
  factory _$$CountryNamesWithFlagsModelImplCopyWith(
          _$CountryNamesWithFlagsModelImpl value,
          $Res Function(_$CountryNamesWithFlagsModelImpl) then) =
      __$$CountryNamesWithFlagsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ValidatedNormalString countryFullName,
      ValidatedNormalString countryShortName,
      ValidatedFlagSvg currencyFlagSvg,
      ValidatedNormalString countryAlpha3,
      ValidatedNormalString currencyFullName,
      ValidatedNormalString currencyId,
      ValidatedNormalString currencySymbol});
}

/// @nodoc
class __$$CountryNamesWithFlagsModelImplCopyWithImpl<$Res>
    extends _$CountryNamesWithFlagsModelCopyWithImpl<$Res,
        _$CountryNamesWithFlagsModelImpl>
    implements _$$CountryNamesWithFlagsModelImplCopyWith<$Res> {
  __$$CountryNamesWithFlagsModelImplCopyWithImpl(
      _$CountryNamesWithFlagsModelImpl _value,
      $Res Function(_$CountryNamesWithFlagsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CountryNamesWithFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? countryFullName = null,
    Object? countryShortName = null,
    Object? currencyFlagSvg = null,
    Object? countryAlpha3 = null,
    Object? currencyFullName = null,
    Object? currencyId = null,
    Object? currencySymbol = null,
  }) {
    return _then(_$CountryNamesWithFlagsModelImpl(
      countryFullName: null == countryFullName
          ? _value.countryFullName
          : countryFullName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      countryShortName: null == countryShortName
          ? _value.countryShortName
          : countryShortName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyFlagSvg: null == currencyFlagSvg
          ? _value.currencyFlagSvg
          : currencyFlagSvg // ignore: cast_nullable_to_non_nullable
              as ValidatedFlagSvg,
      countryAlpha3: null == countryAlpha3
          ? _value.countryAlpha3
          : countryAlpha3 // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyFullName: null == currencyFullName
          ? _value.currencyFullName
          : currencyFullName // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencyId: null == currencyId
          ? _value.currencyId
          : currencyId // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
      currencySymbol: null == currencySymbol
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as ValidatedNormalString,
    ));
  }
}

/// @nodoc

class _$CountryNamesWithFlagsModelImpl extends _CountryNamesWithFlagsModel {
  const _$CountryNamesWithFlagsModelImpl(
      {required this.countryFullName,
      required this.countryShortName,
      required this.currencyFlagSvg,
      required this.countryAlpha3,
      required this.currencyFullName,
      required this.currencyId,
      required this.currencySymbol})
      : super._();

  /// Country full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString countryFullName;

  /// Country short name in (ISO 3166 country code) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString countryShortName;

  /// Country flag in form of svg.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedFlagSvg currencyFlagSvg;

  /// Country short name in (alpha3) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString countryAlpha3;

  /// Currency full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString currencyFullName;

  /// Currency ID == currency short name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString currencyId;

  /// Currency symbol.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  final ValidatedNormalString currencySymbol;

  @override
  String toString() {
    return 'CountryNamesWithFlagsModel(countryFullName: $countryFullName, countryShortName: $countryShortName, currencyFlagSvg: $currencyFlagSvg, countryAlpha3: $countryAlpha3, currencyFullName: $currencyFullName, currencyId: $currencyId, currencySymbol: $currencySymbol)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CountryNamesWithFlagsModelImpl &&
            (identical(other.countryFullName, countryFullName) ||
                other.countryFullName == countryFullName) &&
            (identical(other.countryShortName, countryShortName) ||
                other.countryShortName == countryShortName) &&
            (identical(other.currencyFlagSvg, currencyFlagSvg) ||
                other.currencyFlagSvg == currencyFlagSvg) &&
            (identical(other.countryAlpha3, countryAlpha3) ||
                other.countryAlpha3 == countryAlpha3) &&
            (identical(other.currencyFullName, currencyFullName) ||
                other.currencyFullName == currencyFullName) &&
            (identical(other.currencyId, currencyId) ||
                other.currencyId == currencyId) &&
            (identical(other.currencySymbol, currencySymbol) ||
                other.currencySymbol == currencySymbol));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      countryFullName,
      countryShortName,
      currencyFlagSvg,
      countryAlpha3,
      currencyFullName,
      currencyId,
      currencySymbol);

  /// Create a copy of CountryNamesWithFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CountryNamesWithFlagsModelImplCopyWith<_$CountryNamesWithFlagsModelImpl>
      get copyWith => __$$CountryNamesWithFlagsModelImplCopyWithImpl<
          _$CountryNamesWithFlagsModelImpl>(this, _$identity);
}

abstract class _CountryNamesWithFlagsModel extends CountryNamesWithFlagsModel {
  const factory _CountryNamesWithFlagsModel(
          {required final ValidatedNormalString countryFullName,
          required final ValidatedNormalString countryShortName,
          required final ValidatedFlagSvg currencyFlagSvg,
          required final ValidatedNormalString countryAlpha3,
          required final ValidatedNormalString currencyFullName,
          required final ValidatedNormalString currencyId,
          required final ValidatedNormalString currencySymbol}) =
      _$CountryNamesWithFlagsModelImpl;
  const _CountryNamesWithFlagsModel._() : super._();

  /// Country full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get countryFullName;

  /// Country short name in (ISO 3166 country code) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get countryShortName;

  /// Country flag in form of svg.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedFlagSvg get currencyFlagSvg;

  /// Country short name in (alpha3) format.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get countryAlpha3;

  /// Currency full name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get currencyFullName;

  /// Currency ID == currency short name.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get currencyId;

  /// Currency symbol.
  ///
  /// Contains `Either<ValueFailure<String> , String>`.
  ///
  ///
  /// A [ValueFailure] maybe returned with the following failures:
  /// [ValueFailure.nullValue].
  /// [ValueFailure.empty].
  /// [ValueFailure.multiline].
  @override
  ValidatedNormalString get currencySymbol;

  /// Create a copy of CountryNamesWithFlagsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CountryNamesWithFlagsModelImplCopyWith<_$CountryNamesWithFlagsModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
