// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversion_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ConversionHistoryModel {
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
  KtMap<DuoDate, ValidatedDouble> get fromToConversionHistory =>
      throw _privateConstructorUsedError;

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
  KtMap<DuoDate, ValidatedDouble> get toFromConversionHistory =>
      throw _privateConstructorUsedError;

  /// Create a copy of ConversionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversionHistoryModelCopyWith<ConversionHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversionHistoryModelCopyWith<$Res> {
  factory $ConversionHistoryModelCopyWith(ConversionHistoryModel value,
          $Res Function(ConversionHistoryModel) then) =
      _$ConversionHistoryModelCopyWithImpl<$Res, ConversionHistoryModel>;
  @useResult
  $Res call(
      {KtMap<DuoDate, ValidatedDouble> fromToConversionHistory,
      KtMap<DuoDate, ValidatedDouble> toFromConversionHistory});
}

/// @nodoc
class _$ConversionHistoryModelCopyWithImpl<$Res,
        $Val extends ConversionHistoryModel>
    implements $ConversionHistoryModelCopyWith<$Res> {
  _$ConversionHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversionHistoryModel
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
              as KtMap<DuoDate, ValidatedDouble>,
      toFromConversionHistory: null == toFromConversionHistory
          ? _value.toFromConversionHistory
          : toFromConversionHistory // ignore: cast_nullable_to_non_nullable
              as KtMap<DuoDate, ValidatedDouble>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$conversionHistoryModelImplCopyWith<$Res>
    implements $ConversionHistoryModelCopyWith<$Res> {
  factory _$$conversionHistoryModelImplCopyWith(
          _$conversionHistoryModelImpl value,
          $Res Function(_$conversionHistoryModelImpl) then) =
      __$$conversionHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {KtMap<DuoDate, ValidatedDouble> fromToConversionHistory,
      KtMap<DuoDate, ValidatedDouble> toFromConversionHistory});
}

/// @nodoc
class __$$conversionHistoryModelImplCopyWithImpl<$Res>
    extends _$ConversionHistoryModelCopyWithImpl<$Res,
        _$conversionHistoryModelImpl>
    implements _$$conversionHistoryModelImplCopyWith<$Res> {
  __$$conversionHistoryModelImplCopyWithImpl(
      _$conversionHistoryModelImpl _value,
      $Res Function(_$conversionHistoryModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fromToConversionHistory = null,
    Object? toFromConversionHistory = null,
  }) {
    return _then(_$conversionHistoryModelImpl(
      fromToConversionHistory: null == fromToConversionHistory
          ? _value.fromToConversionHistory
          : fromToConversionHistory // ignore: cast_nullable_to_non_nullable
              as KtMap<DuoDate, ValidatedDouble>,
      toFromConversionHistory: null == toFromConversionHistory
          ? _value.toFromConversionHistory
          : toFromConversionHistory // ignore: cast_nullable_to_non_nullable
              as KtMap<DuoDate, ValidatedDouble>,
    ));
  }
}

/// @nodoc

class _$conversionHistoryModelImpl extends _conversionHistoryModel {
  const _$conversionHistoryModelImpl(
      {required this.fromToConversionHistory,
      required this.toFromConversionHistory})
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
  /// 1- the [toStringFormatForConversionHistory] function is called while the value inside the [DuoDate] is [ValueFailure].
  @override
  final KtMap<DuoDate, ValidatedDouble> fromToConversionHistory;

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
  @override
  final KtMap<DuoDate, ValidatedDouble> toFromConversionHistory;

  @override
  String toString() {
    return 'ConversionHistoryModel(fromToConversionHistory: $fromToConversionHistory, toFromConversionHistory: $toFromConversionHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$conversionHistoryModelImpl &&
            (identical(
                    other.fromToConversionHistory, fromToConversionHistory) ||
                other.fromToConversionHistory == fromToConversionHistory) &&
            (identical(
                    other.toFromConversionHistory, toFromConversionHistory) ||
                other.toFromConversionHistory == toFromConversionHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, fromToConversionHistory, toFromConversionHistory);

  /// Create a copy of ConversionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$conversionHistoryModelImplCopyWith<_$conversionHistoryModelImpl>
      get copyWith => __$$conversionHistoryModelImplCopyWithImpl<
          _$conversionHistoryModelImpl>(this, _$identity);
}

abstract class _conversionHistoryModel extends ConversionHistoryModel {
  const factory _conversionHistoryModel(
      {required final KtMap<DuoDate, ValidatedDouble> fromToConversionHistory,
      required final KtMap<DuoDate, ValidatedDouble>
          toFromConversionHistory}) = _$conversionHistoryModelImpl;
  const _conversionHistoryModel._() : super._();

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
  @override
  KtMap<DuoDate, ValidatedDouble> get fromToConversionHistory;

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
  @override
  KtMap<DuoDate, ValidatedDouble> get toFromConversionHistory;

  /// Create a copy of ConversionHistoryModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$conversionHistoryModelImplCopyWith<_$conversionHistoryModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
