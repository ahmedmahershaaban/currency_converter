import 'package:currency_converter/domain/data_sources/remote_data_source/currency_converter_repositroy/currency_converter_repository.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/user_flow/conversion_history_model_dto/conversion_history_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:currency_converter/infrastructure/user_flow/currency_conversion_model_dto/currency_conversion_model_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

/// This class is the implementation of the [CurrencyConverterRepository] abstract class.
@LazySingleton(as: CurrencyConverterRepository)
class CurrencyConverterRepositoryImpl implements CurrencyConverterRepository {
  final CurrencyConverterService currencyConverterService;

  CurrencyConverterRepositoryImpl({required this.currencyConverterService});

  /// This method is used to get all the countries and their currencies.
  /// It returns a list of [CountryNamesWithFlagsModelDto] if the call is successful.
  /// It returns a [String] if the call is unsuccessful.
  /// It takes no parameters.
  /// It returns a [Future] of [Either] [String] or [List] [CountryNamesWithFlagsModelDto].
  /// It calls the [getAllCountriesAndCurrencies] method from the [CurrencyConverterService] class.
  @override
  Future<Either<String, List<CountryNamesWithFlagsModelDto>>> getAllCountriesAndCurrencies() {
    return currencyConverterService.getAllCountriesAndCurrencies().then(
      (value) {
        if (value.isSuccessful) {
          return Right(value.body!);
        } else {
          return Left(value.error.toString());
        }
      },
    );
  }

  /// This method is used to get the currency conversion history.
  /// It returns a [ConversionHistoryModelDto] if the call is successful.
  /// It returns a [String] if the call is unsuccessful.
  /// It takes the following parameters:
  ///[fromAndToMultipleCurrencies] of type [String] which represents the currencies for which the history is to be fetched.
  /// [startDate] of type [String] which represents the start date of the history.
  /// [endDate] of type [String] which represents the end date of the history.
  /// It returns a [Future] of [Either] [String] or [ConversionHistoryModelDto].
  /// It calls the [getCurrencyConversionHistory] method from the [CurrencyConverterService] class.  @override
  @override
  Future<Either<String, ConversionHistoryModelDto>> getCurrencyConversionHistory(
      {required String fromAndToMultipleCurrencies, required String startDate, required String endDate}) {
    return currencyConverterService
        .getCurrencyConversionHistory(fromAndToMultipleCurrencies: fromAndToMultipleCurrencies, startDate: startDate, endDate: endDate)
        .then(
      (value) {
        if (value.isSuccessful) {
          return Right(value.body!);
        } else {
          return Left(value.error.toString());
        }
      },
    );
  }

  /// This method is used to get the current currency conversion.
  /// It returns a [CurrencyConversionModelDto] if the call is successful.
  /// It returns a [String] if the call is unsuccessful.
  /// It takes the following parameters:
  /// [fromAndToMultipleCurrencies] of type [String] which represents the currencies for which the conversion is to be fetched.
  /// It returns a [Future] of [Either] [String] or [CurrencyConversionModelDto].
  /// It calls the [getCurrencyConversionNow] method from the [CurrencyConverterService] class.
  @override
  Future<Either<String, CurrencyConversionModelDto>> getCurrencyConversionNow({required String fromAndToMultipleCurrencies}) {
    return currencyConverterService.getCurrencyConversionNow(fromAndToMultipleCurrencies: fromAndToMultipleCurrencies).then(
      (value) {
        if (value.isSuccessful) {
          return Right(value.body!);
        } else {
          return Left(value.error.toString());
        }
      },
    );
  }
}
