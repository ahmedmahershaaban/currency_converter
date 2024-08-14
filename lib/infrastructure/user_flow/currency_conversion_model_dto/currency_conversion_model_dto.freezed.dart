// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'currency_conversion_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CurrencyConversionModelDto _$CurrencyConversionModelDtoFromJson(
    Map<String, dynamic> json) {
  return _currencyConversionModelDto.fromJson(json);
}

/// @nodoc
mixin _$CurrencyConversionModelDto {
  /// Country full name.
  double get fromToConversion => throw _privateConstructorUsedError;

  /// Country short name in (ISO 3166 country code) format.
  double get toFromConversion => throw _privateConstructorUsedError;

  /// Serializes this CurrencyConversionModelDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CurrencyConversionModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CurrencyConversionModelDtoCopyWith<CurrencyConversionModelDto>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CurrencyConversionModelDtoCopyWith<$Res> {
  factory $CurrencyConversionModelDtoCopyWith(CurrencyConversionModelDto value,
          $Res Function(CurrencyConversionModelDto) then) =
      _$CurrencyConversionModelDtoCopyWithImpl<$Res,
          CurrencyConversionModelDto>;
  @useResult
  $Res call({double fromToConversion, double toFromConversion});
}

/// @nodoc
class _$CurrencyConversionModelDtoCopyWithImpl<$Res,
        $Val extends CurrencyConversionModelDto>
    implements $CurrencyConversionModelDtoCopyWith<$Res> {
  _$CurrencyConversionModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CurrencyConversionModelDto
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
              as double,
      toFromConversion: null == toFromConversion
          ? _value.toFromConversion
          : toFromConversion // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$currencyConversionModelDtoImplCopyWith<$Res>
    implements $CurrencyConversionModelDtoCopyWith<$Res> {
  factory _$$currencyConversionModelDtoImplCopyWith(
          _$currencyConversionModelDtoImpl value,
          $Res Function(_$currencyConversionModelDtoImpl) then) =
      __$$currencyConversionModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double fromToConversion, double toFromConversion});
}

/// @nodoc
class __$$currencyConversionModelDtoImplCopyWithImpl<$Res>
    extends _$CurrencyConversionModelDtoCopyWithImpl<$Res,
        _$currencyConversionModelDtoImpl>
    implements _$$currencyConversionModelDtoImplCopyWith<$Res> {
  __$$currencyConversionModelDtoImplCopyWithImpl(
      _$currencyConversionModelDtoImpl _value,
      $Res Function(_$currencyConversionModelDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of CurrencyConversionModelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversion = null,
    Object? toFromConversion = null,
  }) {
    return _then(_$currencyConversionModelDtoImpl(
      fromToConversion: null == fromToConversion
          ? _value.fromToConversion
          : fromToConversion // ignore: cast_nullable_to_non_nullable
              as double,
      toFromConversion: null == toFromConversion
          ? _value.toFromConversion
          : toFromConversion // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$currencyConversionModelDtoImpl extends _currencyConversionModelDto {
  const _$currencyConversionModelDtoImpl(
      {required this.fromToConversion, required this.toFromConversion})
      : super._();

  factory _$currencyConversionModelDtoImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$currencyConversionModelDtoImplFromJson(json);

  /// Country full name.
  @override
  final double fromToConversion;

  /// Country short name in (ISO 3166 country code) format.
  @override
  final double toFromConversion;

  @override
  String toString() {
    return 'CurrencyConversionModelDto(fromToConversion: $fromToConversion, toFromConversion: $toFromConversion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$currencyConversionModelDtoImpl &&
            (identical(other.fromToConversion, fromToConversion) ||
                other.fromToConversion == fromToConversion) &&
            (identical(other.toFromConversion, toFromConversion) ||
                other.toFromConversion == toFromConversion));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, fromToConversion, toFromConversion);

  /// Create a copy of CurrencyConversionModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$currencyConversionModelDtoImplCopyWith<_$currencyConversionModelDtoImpl>
      get copyWith => __$$currencyConversionModelDtoImplCopyWithImpl<
          _$currencyConversionModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$currencyConversionModelDtoImplToJson(
      this,
    );
  }
}

abstract class _currencyConversionModelDto extends CurrencyConversionModelDto {
  const factory _currencyConversionModelDto(
          {required final double fromToConversion,
          required final double toFromConversion}) =
      _$currencyConversionModelDtoImpl;
  const _currencyConversionModelDto._() : super._();

  factory _currencyConversionModelDto.fromJson(Map<String, dynamic> json) =
      _$currencyConversionModelDtoImpl.fromJson;

  /// Country full name.
  @override
  double get fromToConversion;

  /// Country short name in (ISO 3166 country code) format.
  @override
  double get toFromConversion;

  /// Create a copy of CurrencyConversionModelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$currencyConversionModelDtoImplCopyWith<_$currencyConversionModelDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
