import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';

/// Interface where all the user flow actions will be defined
abstract class IUserFlowFacade {
  /// Get the currency conversion for two currencies at real time.
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, CurrencyConversionModel>> getCurrencyConversionNow({
    required ValidatedNormalString fromCurrency,
    required ValidatedNormalString toCurrency,
  });

  /// Get currency conversion history between two currencies
  /// also you could manage the history by providing [startDate] and [endDate].
  ///
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, ConversionHistoryModel>> getCurrencyConversionHistory({
    required ValidatedNormalString fromCurrency,
    required ValidatedNormalString toCurrency,
    required DuoDate startDate,
    required DuoDate endDate,
  });

  /// Get all countries with flags with currencies it will have all the necessary info
  /// for the app.
  ///
  /// A [UserFlowFailure] maybe returned with the following failures:
  /// [UserFlowFailure.noInternetConnection].
  /// [UserFlowFailure.insufficientPermission].
  /// [UserFlowFailure.serverError].
  Future<Either<UserFlowFailure, KtList<CountryNamesWithFlagsModel>>> getAllCountriesNamesAndFlags();
}
