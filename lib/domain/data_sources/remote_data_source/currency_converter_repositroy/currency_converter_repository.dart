import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/currency_conversion_model_dto/currency_conversion_model_dto.dart';
import 'package:dartz/dartz.dart';

/// This is the abstract class for the CurrencyConverterRepository.
/// This class will contain all the methods that will be used to get the data from the remote data source.
abstract class CurrencyConverterRepository {
  /// This method will get all the countries and their currencies
  /// and will return the data in the form of [CountryNamesWithFlagsModelDto]
  /// or will return an error message in case of failure.
  ///
  /// [CountryNamesWithFlagsModelDto] is a model that contains the country name, currency name, and currency code.
  ///
  /// [String] is the error message that will be returned in case of failure.
  Future<Either<String, List<CountryNamesWithFlagsModelDto>>> getAllCountriesAndCurrencies();

  /// This method will get the currency conversion for the given currencies
  /// and will return the data in the form of [CurrencyConversionModelDto]
  /// or will return an error message in case of failure.
  ///
  /// [CurrencyConversionModelDto] is a model that contains the currency conversion rate.
  ///
  /// [String] is the error message that will be returned in case of failure.
  Future<Either<String, CurrencyConversionModelDto>> getCurrencyConversionNow({
    required String fromAndToMultipleCurrencies,
  });

  /// This method will get the currency conversion history for the given currencies
  /// and will return the data in the form of [ConversionHistoryModelDto]
  /// or will return an error message in case of failure.
  ///
  /// [ConversionHistoryModelDto] is a model that contains the currency conversion history.
  ///
  /// [String] is the error message that will be returned in case of failure.
  Future<Either<String, ConversionHistoryModelDto>> getCurrencyConversionHistory({
    required String fromAndToMultipleCurrencies,
    required String startDate,
    required String endDate,
  });
}
