import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_flow_event.freezed.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@freezed
abstract class UserFlowEvent with _$UserFlowEvent {
  // General Events
  const factory UserFlowEvent.themeModeChangedEvent() = ThemeModeChangedEvent;
  const factory UserFlowEvent.loadAllNeededDataForUserFlowEvent() = LoadAllNeededDataForUserFlowEvent;

  // User Flow Actions
  const factory UserFlowEvent.getAllCountriesNamesAndFlagsEvent() = GetAllCountriesNamesAndFlagsEvent;

  const factory UserFlowEvent.getCurrencyConversionHistoryEvent() = GetCurrencyConversionHistoryEvent;

  const factory UserFlowEvent.getCurrencyConversionNowEvent({
    required ValidatedNormalString fromCurrency,
    required ValidatedNormalString toCurrency,
  }) = GetCurrencyConversionNowEvent;

  const factory UserFlowEvent.updateFromCountrySelectedEvent({
    required CountryNamesWithFlagsModel countryNamesWithFlagsModel,
  }) = UpdateFromCountrySelectedEvent;

  const factory UserFlowEvent.updateToCountrySelectedEvent({
    required CountryNamesWithFlagsModel countryNamesWithFlagsModel,
  }) = UpdateToCountrySelectedEvent;

  const factory UserFlowEvent.updateNumberOfWeeksForHistoryEvent({
    required ValidatedInt number,
  }) = UpdateNumberOfWeeksForHistoryEvent;

  const factory UserFlowEvent.updateFromCurrencyValueEvent({
    required ValidatedDouble number,
  }) = UpdateFromCurrencyValueEvent;

  const factory UserFlowEvent.updateIsCurrencyFlippedEvent() = UpdateIsCurrencyFlippedEvent;
}
