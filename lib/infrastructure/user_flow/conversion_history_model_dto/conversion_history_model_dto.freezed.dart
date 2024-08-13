// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_history_model_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversionHistoryModelDto _$ConversionHistoryModelDtoFromJson(
    Map<String, dynamic> json) {
  return _conversionHistoryModelDto.fromJson(json);
}

/// @nodoc
mixin _$ConversionHistoryModelDto {
  /// Country full name.
  Map<String, double> get fromToConversionHistory =>
      throw _privateConstructorUsedError;

  /// Country short name in (ISO 3166 country code) format.
  Map<String, double> get toFromConversionHistory =>
      throw _privateConstructorUsedError;

  /// Serializes this ConversionHistoryModelDto to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversionHistoryModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionHistoryModelDtoCopyWith<ConversionHistoryModelDto> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionHistoryModelDtoCopyWith<$Res> {
  factory $ConversionHistoryModelDtoCopyWith(ConversionHistoryModelDto value,
          $Res Function(ConversionHistoryModelDto) then) =
      _$ConversionHistoryModelDtoCopyWithImpl<$Res, ConversionHistoryModelDto>;
  @useResult
  $Res call(
      {Map<String, double> fromToConversionHistory,
      Map<String, double> toFromConversionHistory});
}

/// @nodoc
class _$ConversionHistoryModelDtoCopyWithImpl<$Res,
        $Val extends ConversionHistoryModelDto>
    implements $ConversionHistoryModelDtoCopyWith<$Res> {
  _$ConversionHistoryModelDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionHistoryModelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversionHistory = null,
    Object? toFromConversionHistory = null,
  }) {
    return _then(_value.copyWith(
      fromToConversionHistory: null == fromToConversionHistory
          ? _value.fromToConversionHistory
          : fromToConversionHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      toFromConversionHistory: null == toFromConversionHistory
          ? _value.toFromConversionHistory
          : toFromConversionHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$conversionHistoryModelDtoImplCopyWith<$Res>
    implements $ConversionHistoryModelDtoCopyWith<$Res> {
  factory _$$conversionHistoryModelDtoImplCopyWith(
          _$conversionHistoryModelDtoImpl value,
          $Res Function(_$conversionHistoryModelDtoImpl) then) =
      __$$conversionHistoryModelDtoImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Map<String, double> fromToConversionHistory,
      Map<String, double> toFromConversionHistory});
}

/// @nodoc
class __$$conversionHistoryModelDtoImplCopyWithImpl<$Res>
    extends _$ConversionHistoryModelDtoCopyWithImpl<$Res,
        _$conversionHistoryModelDtoImpl>
    implements _$$conversionHistoryModelDtoImplCopyWith<$Res> {
  __$$conversionHistoryModelDtoImplCopyWithImpl(
      _$conversionHistoryModelDtoImpl _value,
      $Res Function(_$conversionHistoryModelDtoImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversionHistoryModelDto
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversionHistory = null,
    Object? toFromConversionHistory = null,
  }) {
    return _then(_$conversionHistoryModelDtoImpl(
      fromToConversionHistory: null == fromToConversionHistory
          ? _value._fromToConversionHistory
          : fromToConversionHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      toFromConversionHistory: null == toFromConversionHistory
          ? _value._toFromConversionHistory
          : toFromConversionHistory // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$conversionHistoryModelDtoImpl extends _conversionHistoryModelDto {
  const _$conversionHistoryModelDtoImpl(
      {required final Map<String, double> fromToConversionHistory,
      required final Map<String, double> toFromConversionHistory})
      : _fromToConversionHistory = fromToConversionHistory,
        _toFromConversionHistory = toFromConversionHistory,
        super._();

  factory _$conversionHistoryModelDtoImpl.fromJson(Map<String, dynamic> json) =>
      _$$conversionHistoryModelDtoImplFromJson(json);

  /// Country full name.
  final Map<String, double> _fromToConversionHistory;

  /// Country full name.
  @override
  Map<String, double> get fromToConversionHistory {
    if (_fromToConversionHistory is EqualUnmodifiableMapView)
      return _fromToConversionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_fromToConversionHistory);
  }

  /// Country short name in (ISO 3166 country code) format.
  final Map<String, double> _toFromConversionHistory;

  /// Country short name in (ISO 3166 country code) format.
  @override
  Map<String, double> get toFromConversionHistory {
    if (_toFromConversionHistory is EqualUnmodifiableMapView)
      return _toFromConversionHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_toFromConversionHistory);
  }

  @override
  String toString() {
    return 'ConversionHistoryModelDto(fromToConversionHistory: $fromToConversionHistory, toFromConversionHistory: $toFromConversionHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$conversionHistoryModelDtoImpl &&
            const DeepCollectionEquality().equals(
                other._fromToConversionHistory, _fromToConversionHistory) &&
            const DeepCollectionEquality().equals(
                other._toFromConversionHistory, _toFromConversionHistory));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_fromToConversionHistory),
      const DeepCollectionEquality().hash(_toFromConversionHistory));

  /// Create a copy of ConversionHistoryModelDto
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$conversionHistoryModelDtoImplCopyWith<_$conversionHistoryModelDtoImpl>
      get copyWith => __$$conversionHistoryModelDtoImplCopyWithImpl<
          _$conversionHistoryModelDtoImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$conversionHistoryModelDtoImplToJson(
      this,
    );
  }
}

abstract class _conversionHistoryModelDto extends ConversionHistoryModelDto {
  const factory _conversionHistoryModelDto(
          {required final Map<String, double> fromToConversionHistory,
          required final Map<String, double> toFromConversionHistory}) =
      _$conversionHistoryModelDtoImpl;
  const _conversionHistoryModelDto._() : super._();

  factory _conversionHistoryModelDto.fromJson(Map<String, dynamic> json) =
      _$conversionHistoryModelDtoImpl.fromJson;

  /// Country full name.
  @override
  Map<String, double> get fromToConversionHistory;

  /// Country short name in (ISO 3166 country code) format.
  @override
  Map<String, double> get toFromConversionHistory;

  /// Create a copy of ConversionHistoryModelDto
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$conversionHistoryModelDtoImplCopyWith<_$conversionHistoryModelDtoImpl>
      get copyWith => throw _privateConstructorUsedError;
}
