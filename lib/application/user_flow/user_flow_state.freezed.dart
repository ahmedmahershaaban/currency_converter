// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_flow_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserFlowState {
  bool get isLoadingForCountriesAndFlags => throw _privateConstructorUsedError;
  bool get isLoadingForCurrencyConversion => throw _privateConstructorUsedError;
  bool get isLoadingForConversionHistory => throw _privateConstructorUsedError;

  /// when the theme of the app is changed the bloc will receive [UserFlowEvent.ThemeModeChanged] that will change this
  /// value to update the `BlocBuilder` across the app.
  bool get placeHolderForThemeChange => throw _privateConstructorUsedError;
  Option<KtList<CountryNamesWithFlagsModel>> get countryNamesWithFlagsModels =>
      throw _privateConstructorUsedError;
  Option<CurrencyConversionModel> get currencyConversionModel =>
      throw _privateConstructorUsedError;
  Option<ConversionHistoryModel> get conversionHistoryModel =>
      throw _privateConstructorUsedError;
  ValidatedDouble get fromCurrencyValue => throw _privateConstructorUsedError;
  ValidatedDouble get toCurrencyValue => throw _privateConstructorUsedError;
  CustomTextEditingController get fromCurrencyTextEditingController =>
      throw _privateConstructorUsedError;
  CustomTextEditingController get toCurrencyTextEditingController =>
      throw _privateConstructorUsedError;
  Option<CountryNamesWithFlagsModel> get fromCountrySelected =>
      throw _privateConstructorUsedError;
  Option<CountryNamesWithFlagsModel> get toCountrySelected =>
      throw _privateConstructorUsedError;
  bool get isCurrencyFlipped => throw _privateConstructorUsedError;
  ValidatedInt get numberOfWeeksForHistory =>
      throw _privateConstructorUsedError;
  Option<Either<UserFlowFailure, Option<String>>>
      get userFlowFailureOrSuccessOption => throw _privateConstructorUsedError;

  /// Create a copy of UserFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserFlowStateCopyWith<UserFlowState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserFlowStateCopyWith<$Res> {
  factory $UserFlowStateCopyWith(
          UserFlowState value, $Res Function(UserFlowState) then) =
      _$UserFlowStateCopyWithImpl<$Res, UserFlowState>;
  @useResult
  $Res call(
      {bool isLoadingForCountriesAndFlags,
      bool isLoadingForCurrencyConversion,
      bool isLoadingForConversionHistory,
      bool placeHolderForThemeChange,
      Option<KtList<CountryNamesWithFlagsModel>> countryNamesWithFlagsModels,
      Option<CurrencyConversionModel> currencyConversionModel,
      Option<ConversionHistoryModel> conversionHistoryModel,
      ValidatedDouble fromCurrencyValue,
      ValidatedDouble toCurrencyValue,
      CustomTextEditingController fromCurrencyTextEditingController,
      CustomTextEditingController toCurrencyTextEditingController,
      Option<CountryNamesWithFlagsModel> fromCountrySelected,
      Option<CountryNamesWithFlagsModel> toCountrySelected,
      bool isCurrencyFlipped,
      ValidatedInt numberOfWeeksForHistory,
      Option<Either<UserFlowFailure, Option<String>>>
          userFlowFailureOrSuccessOption});
}

/// @nodoc
class _$UserFlowStateCopyWithImpl<$Res, $Val extends UserFlowState>
    implements $UserFlowStateCopyWith<$Res> {
  _$UserFlowStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingForCountriesAndFlags = null,
    Object? isLoadingForCurrencyConversion = null,
    Object? isLoadingForConversionHistory = null,
    Object? placeHolderForThemeChange = null,
    Object? countryNamesWithFlagsModels = null,
    Object? currencyConversionModel = null,
    Object? conversionHistoryModel = null,
    Object? fromCurrencyValue = null,
    Object? toCurrencyValue = null,
    Object? fromCurrencyTextEditingController = null,
    Object? toCurrencyTextEditingController = null,
    Object? fromCountrySelected = null,
    Object? toCountrySelected = null,
    Object? isCurrencyFlipped = null,
    Object? numberOfWeeksForHistory = null,
    Object? userFlowFailureOrSuccessOption = null,
  }) {
    return _then(_value.copyWith(
      isLoadingForCountriesAndFlags: null == isLoadingForCountriesAndFlags
          ? _value.isLoadingForCountriesAndFlags
          : isLoadingForCountriesAndFlags // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForCurrencyConversion: null == isLoadingForCurrencyConversion
          ? _value.isLoadingForCurrencyConversion
          : isLoadingForCurrencyConversion // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForConversionHistory: null == isLoadingForConversionHistory
          ? _value.isLoadingForConversionHistory
          : isLoadingForConversionHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      placeHolderForThemeChange: null == placeHolderForThemeChange
          ? _value.placeHolderForThemeChange
          : placeHolderForThemeChange // ignore: cast_nullable_to_non_nullable
              as bool,
      countryNamesWithFlagsModels: null == countryNamesWithFlagsModels
          ? _value.countryNamesWithFlagsModels
          : countryNamesWithFlagsModels // ignore: cast_nullable_to_non_nullable
              as Option<KtList<CountryNamesWithFlagsModel>>,
      currencyConversionModel: null == currencyConversionModel
          ? _value.currencyConversionModel
          : currencyConversionModel // ignore: cast_nullable_to_non_nullable
              as Option<CurrencyConversionModel>,
      conversionHistoryModel: null == conversionHistoryModel
          ? _value.conversionHistoryModel
          : conversionHistoryModel // ignore: cast_nullable_to_non_nullable
              as Option<ConversionHistoryModel>,
      fromCurrencyValue: null == fromCurrencyValue
          ? _value.fromCurrencyValue
          : fromCurrencyValue // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      toCurrencyValue: null == toCurrencyValue
          ? _value.toCurrencyValue
          : toCurrencyValue // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      fromCurrencyTextEditingController: null ==
              fromCurrencyTextEditingController
          ? _value.fromCurrencyTextEditingController
          : fromCurrencyTextEditingController // ignore: cast_nullable_to_non_nullable
              as CustomTextEditingController,
      toCurrencyTextEditingController: null == toCurrencyTextEditingController
          ? _value.toCurrencyTextEditingController
          : toCurrencyTextEditingController // ignore: cast_nullable_to_non_nullable
              as CustomTextEditingController,
      fromCountrySelected: null == fromCountrySelected
          ? _value.fromCountrySelected
          : fromCountrySelected // ignore: cast_nullable_to_non_nullable
              as Option<CountryNamesWithFlagsModel>,
      toCountrySelected: null == toCountrySelected
          ? _value.toCountrySelected
          : toCountrySelected // ignore: cast_nullable_to_non_nullable
              as Option<CountryNamesWithFlagsModel>,
      isCurrencyFlipped: null == isCurrencyFlipped
          ? _value.isCurrencyFlipped
          : isCurrencyFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfWeeksForHistory: null == numberOfWeeksForHistory
          ? _value.numberOfWeeksForHistory
          : numberOfWeeksForHistory // ignore: cast_nullable_to_non_nullable
              as ValidatedInt,
      userFlowFailureOrSuccessOption: null == userFlowFailureOrSuccessOption
          ? _value.userFlowFailureOrSuccessOption
          : userFlowFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFlowFailure, Option<String>>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$userFlowStateImplCopyWith<$Res>
    implements $UserFlowStateCopyWith<$Res> {
  factory _$$userFlowStateImplCopyWith(
          _$userFlowStateImpl value, $Res Function(_$userFlowStateImpl) then) =
      __$$userFlowStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoadingForCountriesAndFlags,
      bool isLoadingForCurrencyConversion,
      bool isLoadingForConversionHistory,
      bool placeHolderForThemeChange,
      Option<KtList<CountryNamesWithFlagsModel>> countryNamesWithFlagsModels,
      Option<CurrencyConversionModel> currencyConversionModel,
      Option<ConversionHistoryModel> conversionHistoryModel,
      ValidatedDouble fromCurrencyValue,
      ValidatedDouble toCurrencyValue,
      CustomTextEditingController fromCurrencyTextEditingController,
      CustomTextEditingController toCurrencyTextEditingController,
      Option<CountryNamesWithFlagsModel> fromCountrySelected,
      Option<CountryNamesWithFlagsModel> toCountrySelected,
      bool isCurrencyFlipped,
      ValidatedInt numberOfWeeksForHistory,
      Option<Either<UserFlowFailure, Option<String>>>
          userFlowFailureOrSuccessOption});
}

/// @nodoc
class __$$userFlowStateImplCopyWithImpl<$Res>
    extends _$UserFlowStateCopyWithImpl<$Res, _$userFlowStateImpl>
    implements _$$userFlowStateImplCopyWith<$Res> {
  __$$userFlowStateImplCopyWithImpl(
      _$userFlowStateImpl _value, $Res Function(_$userFlowStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserFlowState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoadingForCountriesAndFlags = null,
    Object? isLoadingForCurrencyConversion = null,
    Object? isLoadingForConversionHistory = null,
    Object? placeHolderForThemeChange = null,
    Object? countryNamesWithFlagsModels = null,
    Object? currencyConversionModel = null,
    Object? conversionHistoryModel = null,
    Object? fromCurrencyValue = null,
    Object? toCurrencyValue = null,
    Object? fromCurrencyTextEditingController = null,
    Object? toCurrencyTextEditingController = null,
    Object? fromCountrySelected = null,
    Object? toCountrySelected = null,
    Object? isCurrencyFlipped = null,
    Object? numberOfWeeksForHistory = null,
    Object? userFlowFailureOrSuccessOption = null,
  }) {
    return _then(_$userFlowStateImpl(
      isLoadingForCountriesAndFlags: null == isLoadingForCountriesAndFlags
          ? _value.isLoadingForCountriesAndFlags
          : isLoadingForCountriesAndFlags // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForCurrencyConversion: null == isLoadingForCurrencyConversion
          ? _value.isLoadingForCurrencyConversion
          : isLoadingForCurrencyConversion // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingForConversionHistory: null == isLoadingForConversionHistory
          ? _value.isLoadingForConversionHistory
          : isLoadingForConversionHistory // ignore: cast_nullable_to_non_nullable
              as bool,
      placeHolderForThemeChange: null == placeHolderForThemeChange
          ? _value.placeHolderForThemeChange
          : placeHolderForThemeChange // ignore: cast_nullable_to_non_nullable
              as bool,
      countryNamesWithFlagsModels: null == countryNamesWithFlagsModels
          ? _value.countryNamesWithFlagsModels
          : countryNamesWithFlagsModels // ignore: cast_nullable_to_non_nullable
              as Option<KtList<CountryNamesWithFlagsModel>>,
      currencyConversionModel: null == currencyConversionModel
          ? _value.currencyConversionModel
          : currencyConversionModel // ignore: cast_nullable_to_non_nullable
              as Option<CurrencyConversionModel>,
      conversionHistoryModel: null == conversionHistoryModel
          ? _value.conversionHistoryModel
          : conversionHistoryModel // ignore: cast_nullable_to_non_nullable
              as Option<ConversionHistoryModel>,
      fromCurrencyValue: null == fromCurrencyValue
          ? _value.fromCurrencyValue
          : fromCurrencyValue // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      toCurrencyValue: null == toCurrencyValue
          ? _value.toCurrencyValue
          : toCurrencyValue // ignore: cast_nullable_to_non_nullable
              as ValidatedDouble,
      fromCurrencyTextEditingController: null ==
              fromCurrencyTextEditingController
          ? _value.fromCurrencyTextEditingController
          : fromCurrencyTextEditingController // ignore: cast_nullable_to_non_nullable
              as CustomTextEditingController,
      toCurrencyTextEditingController: null == toCurrencyTextEditingController
          ? _value.toCurrencyTextEditingController
          : toCurrencyTextEditingController // ignore: cast_nullable_to_non_nullable
              as CustomTextEditingController,
      fromCountrySelected: null == fromCountrySelected
          ? _value.fromCountrySelected
          : fromCountrySelected // ignore: cast_nullable_to_non_nullable
              as Option<CountryNamesWithFlagsModel>,
      toCountrySelected: null == toCountrySelected
          ? _value.toCountrySelected
          : toCountrySelected // ignore: cast_nullable_to_non_nullable
              as Option<CountryNamesWithFlagsModel>,
      isCurrencyFlipped: null == isCurrencyFlipped
          ? _value.isCurrencyFlipped
          : isCurrencyFlipped // ignore: cast_nullable_to_non_nullable
              as bool,
      numberOfWeeksForHistory: null == numberOfWeeksForHistory
          ? _value.numberOfWeeksForHistory
          : numberOfWeeksForHistory // ignore: cast_nullable_to_non_nullable
              as ValidatedInt,
      userFlowFailureOrSuccessOption: null == userFlowFailureOrSuccessOption
          ? _value.userFlowFailureOrSuccessOption
          : userFlowFailureOrSuccessOption // ignore: cast_nullable_to_non_nullable
              as Option<Either<UserFlowFailure, Option<String>>>,
    ));
  }
}

/// @nodoc

class _$userFlowStateImpl implements _userFlowState {
  const _$userFlowStateImpl(
      {required this.isLoadingForCountriesAndFlags,
      required this.isLoadingForCurrencyConversion,
      required this.isLoadingForConversionHistory,
      required this.placeHolderForThemeChange,
      required this.countryNamesWithFlagsModels,
      required this.currencyConversionModel,
      required this.conversionHistoryModel,
      required this.fromCurrencyValue,
      required this.toCurrencyValue,
      required this.fromCurrencyTextEditingController,
      required this.toCurrencyTextEditingController,
      required this.fromCountrySelected,
      required this.toCountrySelected,
      required this.isCurrencyFlipped,
      required this.numberOfWeeksForHistory,
      required this.userFlowFailureOrSuccessOption});

  @override
  final bool isLoadingForCountriesAndFlags;
  @override
  final bool isLoadingForCurrencyConversion;
  @override
  final bool isLoadingForConversionHistory;

  /// when the theme of the app is changed the bloc will receive [UserFlowEvent.ThemeModeChanged] that will change this
  /// value to update the `BlocBuilder` across the app.
  @override
  final bool placeHolderForThemeChange;
  @override
  final Option<KtList<CountryNamesWithFlagsModel>> countryNamesWithFlagsModels;
  @override
  final Option<CurrencyConversionModel> currencyConversionModel;
  @override
  final Option<ConversionHistoryModel> conversionHistoryModel;
  @override
  final ValidatedDouble fromCurrencyValue;
  @override
  final ValidatedDouble toCurrencyValue;
  @override
  final CustomTextEditingController fromCurrencyTextEditingController;
  @override
  final CustomTextEditingController toCurrencyTextEditingController;
  @override
  final Option<CountryNamesWithFlagsModel> fromCountrySelected;
  @override
  final Option<CountryNamesWithFlagsModel> toCountrySelected;
  @override
  final bool isCurrencyFlipped;
  @override
  final ValidatedInt numberOfWeeksForHistory;
  @override
  final Option<Either<UserFlowFailure, Option<String>>>
      userFlowFailureOrSuccessOption;

  @override
  String toString() {
    return 'UserFlowState(isLoadingForCountriesAndFlags: $isLoadingForCountriesAndFlags, isLoadingForCurrencyConversion: $isLoadingForCurrencyConversion, isLoadingForConversionHistory: $isLoadingForConversionHistory, placeHolderForThemeChange: $placeHolderForThemeChange, countryNamesWithFlagsModels: $countryNamesWithFlagsModels, currencyConversionModel: $currencyConversionModel, conversionHistoryModel: $conversionHistoryModel, fromCurrencyValue: $fromCurrencyValue, toCurrencyValue: $toCurrencyValue, fromCurrencyTextEditingController: $fromCurrencyTextEditingController, toCurrencyTextEditingController: $toCurrencyTextEditingController, fromCountrySelected: $fromCountrySelected, toCountrySelected: $toCountrySelected, isCurrencyFlipped: $isCurrencyFlipped, numberOfWeeksForHistory: $numberOfWeeksForHistory, userFlowFailureOrSuccessOption: $userFlowFailureOrSuccessOption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$userFlowStateImpl &&
            (identical(other.isLoadingForCountriesAndFlags, isLoadingForCountriesAndFlags) ||
                other.isLoadingForCountriesAndFlags ==
                    isLoadingForCountriesAndFlags) &&
            (identical(other.isLoadingForCurrencyConversion, isLoadingForCurrencyConversion) ||
                other.isLoadingForCurrencyConversion ==
                    isLoadingForCurrencyConversion) &&
            (identical(other.isLoadingForConversionHistory, isLoadingForConversionHistory) ||
                other.isLoadingForConversionHistory ==
                    isLoadingForConversionHistory) &&
            (identical(other.placeHolderForThemeChange, placeHolderForThemeChange) ||
                other.placeHolderForThemeChange == placeHolderForThemeChange) &&
            (identical(other.countryNamesWithFlagsModels, countryNamesWithFlagsModels) ||
                other.countryNamesWithFlagsModels ==
                    countryNamesWithFlagsModels) &&
            (identical(other.currencyConversionModel, currencyConversionModel) ||
                other.currencyConversionModel == currencyConversionModel) &&
            (identical(other.conversionHistoryModel, conversionHistoryModel) ||
                other.conversionHistoryModel == conversionHistoryModel) &&
            (identical(other.fromCurrencyValue, fromCurrencyValue) ||
                other.fromCurrencyValue == fromCurrencyValue) &&
            (identical(other.toCurrencyValue, toCurrencyValue) ||
                other.toCurrencyValue == toCurrencyValue) &&
            (identical(other.fromCurrencyTextEditingController, fromCurrencyTextEditingController) ||
                other.fromCurrencyTextEditingController ==
                    fromCurrencyTextEditingController) &&
            (identical(other.toCurrencyTextEditingController, toCurrencyTextEditingController) ||
                other.toCurrencyTextEditingController ==
                    toCurrencyTextEditingController) &&
            (identical(other.fromCountrySelected, fromCountrySelected) ||
                other.fromCountrySelected == fromCountrySelected) &&
            (identical(other.toCountrySelected, toCountrySelected) ||
                other.toCountrySelected == toCountrySelected) &&
            (identical(other.isCurrencyFlipped, isCurrencyFlipped) ||
                other.isCurrencyFlipped == isCurrencyFlipped) &&
            (identical(other.numberOfWeeksForHistory, numberOfWeeksForHistory) ||
                other.numberOfWeeksForHistory == numberOfWeeksForHistory) &&
            (identical(other.userFlowFailureOrSuccessOption, userFlowFailureOrSuccessOption) ||
                other.userFlowFailureOrSuccessOption == userFlowFailureOrSuccessOption));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      isLoadingForCountriesAndFlags,
      isLoadingForCurrencyConversion,
      isLoadingForConversionHistory,
      placeHolderForThemeChange,
      countryNamesWithFlagsModels,
      currencyConversionModel,
      conversionHistoryModel,
      fromCurrencyValue,
      toCurrencyValue,
      fromCurrencyTextEditingController,
      toCurrencyTextEditingController,
      fromCountrySelected,
      toCountrySelected,
      isCurrencyFlipped,
      numberOfWeeksForHistory,
      userFlowFailureOrSuccessOption);

  /// Create a copy of UserFlowState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$userFlowStateImplCopyWith<_$userFlowStateImpl> get copyWith =>
      __$$userFlowStateImplCopyWithImpl<_$userFlowStateImpl>(this, _$identity);
}

abstract class _userFlowState implements UserFlowState {
  const factory _userFlowState(
      {required final bool isLoadingForCountriesAndFlags,
      required final bool isLoadingForCurrencyConversion,
      required final bool isLoadingForConversionHistory,
      required final bool placeHolderForThemeChange,
      required final Option<KtList<CountryNamesWithFlagsModel>>
          countryNamesWithFlagsModels,
      required final Option<CurrencyConversionModel> currencyConversionModel,
      required final Option<ConversionHistoryModel> conversionHistoryModel,
      required final ValidatedDouble fromCurrencyValue,
      required final ValidatedDouble toCurrencyValue,
      required final CustomTextEditingController
          fromCurrencyTextEditingController,
      required final CustomTextEditingController
          toCurrencyTextEditingController,
      required final Option<CountryNamesWithFlagsModel> fromCountrySelected,
      required final Option<CountryNamesWithFlagsModel> toCountrySelected,
      required final bool isCurrencyFlipped,
      required final ValidatedInt numberOfWeeksForHistory,
      required final Option<Either<UserFlowFailure, Option<String>>>
          userFlowFailureOrSuccessOption}) = _$userFlowStateImpl;

  @override
  bool get isLoadingForCountriesAndFlags;
  @override
  bool get isLoadingForCurrencyConversion;
  @override
  bool get isLoadingForConversionHistory;

  /// when the theme of the app is changed the bloc will receive [UserFlowEvent.ThemeModeChanged] that will change this
  /// value to update the `BlocBuilder` across the app.
  @override
  bool get placeHolderForThemeChange;
  @override
  Option<KtList<CountryNamesWithFlagsModel>> get countryNamesWithFlagsModels;
  @override
  Option<CurrencyConversionModel> get currencyConversionModel;
  @override
  Option<ConversionHistoryModel> get conversionHistoryModel;
  @override
  ValidatedDouble get fromCurrencyValue;
  @override
  ValidatedDouble get toCurrencyValue;
  @override
  CustomTextEditingController get fromCurrencyTextEditingController;
  @override
  CustomTextEditingController get toCurrencyTextEditingController;
  @override
  Option<CountryNamesWithFlagsModel> get fromCountrySelected;
  @override
  Option<CountryNamesWithFlagsModel> get toCountrySelected;
  @override
  bool get isCurrencyFlipped;
  @override
  ValidatedInt get numberOfWeeksForHistory;
  @override
  Option<Either<UserFlowFailure, Option<String>>>
      get userFlowFailureOrSuccessOption;

  /// Create a copy of UserFlowState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$userFlowStateImplCopyWith<_$userFlowStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
