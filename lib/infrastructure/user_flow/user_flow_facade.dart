import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:currency_converter/infrastructure/data_sources/local_data_source/country_names_with_flags_model_drift/country_names_with_flags_model_drift.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/currency_converter_services/currency_converter_service.dart';
import 'package:currency_converter/infrastructure/data_sources/remote_data_source/flag_cdn_services/flag_cdn_service.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IUserFlowFacade)
class UserFlowFacade implements IUserFlowFacade {
  final FlagCdnService _flagCdnService;
  final CurrencyConverterService _currencyConverterService;
  final CountryNamesWithFlagsModelDriftDao _countryNamesWithFlagsModelDriftDao;
  final InternetConnection _internetConnection;
  UserFlowFacade(this._flagCdnService, this._currencyConverterService, this._countryNamesWithFlagsModelDriftDao, this._internetConnection);

  @override
  Future<Either<UserFlowFailure, KtList<CountryNamesWithFlagsModel>>> getAllCountriesNamesAndFlags() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }

      final allCountriesWithFlagsModelDrift = await _countryNamesWithFlagsModelDriftDao.getAllCountriesWithFlags();
      final allCountriesWithFlagsModel =
          allCountriesWithFlagsModelDrift.map((element) => CountryNamesWithFlagsModelDto.fromDrift(element).toDomain()).toImmutableList();
      // if there is no saved data found . call the API's and get the data and store it.
      if (allCountriesWithFlagsModel.isEmpty()) {
        final responseOfCurrencyConverter = await _currencyConverterService.getAllCountriesAndCurrencies();
        if (responseOfCurrencyConverter.isSuccessful) {
          final countryNamesWithFlagsModelDrift = responseOfCurrencyConverter.body;
          if (countryNamesWithFlagsModelDrift == null) {
            debugPrint('Error happened in [getAllCountriesNamesAndFlags] for [Null Value] message: countryNamesWithFlagsModelDrift == null');
            return left(const UserFlowFailure.serverError());
          } else {
            if (countryNamesWithFlagsModelDrift.isEmpty) {
              debugPrint('Error happened in [getAllCountriesNamesAndFlags] for [Null Value] message: countryNamesWithFlagsModelDrift == null');
              return left(const UserFlowFailure.serverError());
            }
            // if we got the the correct response from the currencyConverterService
            // we will move to the next level which is getting the data the flags
            // then will insert the combined data into our local DB and return it to the user
            List<CountryNamesWithFlagsModel> countryNamesWIthFlagsModeList = [];
            countryNamesWithFlagsModelDrift.forEach((countryElementModel) async {
              final responseOfFlagCdn = await _flagCdnService.getCountryFlag(
                countryCode: countryElementModel.countryShortName!.toLowerCase(),
              );
              final String? flagValue = responseOfFlagCdn.body;
              final updatedCountryElementModel = countryElementModel.copyWith(
                currencyFlagSvg: flagValue,
              );
              _countryNamesWithFlagsModelDriftDao.insertCountryWithFlags(updatedCountryElementModel.toDrift());
              countryNamesWIthFlagsModeList.add(updatedCountryElementModel.toDomain());
            });
            return right(countryNamesWIthFlagsModeList.toImmutableList());
          }
        } else {
          final responseError = responseOfCurrencyConverter.error;

          debugPrint('Error happened in [getAllCountriesNamesAndFlags] for [CHOPPER Unsuccessful Request] message: $responseError');

          if (responseError == 'Invalid API Key') {
            return left(const UserFlowFailure.invalidApiKey());
          } else if (responseError == 'Invalid date. Format is yyyy-mm-dd') {
            return left(const UserFlowFailure.invalidDateInputFormat());
          }
          return left(const UserFlowFailure.serverError());
        }
      } else {
        // return the saved data.
        return right(allCountriesWithFlagsModel);
      }
    } catch (e) {
      debugPrint('Error happened in [getAllCountriesNamesAndFlags] for [Generic Catch] message: $e');
      return left(const UserFlowFailure.serverError());
    }
  }

  @override
  Future<Either<UserFlowFailure, ConversionHistoryModel>> getCurrencyConversionHistory({
    required ValidatedNormalString fromCurrency,
    required ValidatedNormalString toCurrency,
    required DuoDate startDate,
    required DuoDate endDate,
  }) async {
    final fromCurrencyStr = fromCurrency.getOrCrash();
    final toCurrencyStr = toCurrency.getOrCrash();
    final startDateStr = startDate.toStringFormatForConversionHistory();
    final endDateStr = endDate.toStringFormatForConversionHistory();
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }
      final response = await _currencyConverterService.getCurrencyConversionHistory(
        fromAndToMultipleCurrencies: '${fromCurrencyStr}_$toCurrencyStr,${toCurrencyStr}_$fromCurrencyStr',
        startDate: startDateStr,
        endDate: endDateStr,
      );
      if (response.isSuccessful) {
        final conversionHistoryModelDto = response.body;
        if (conversionHistoryModelDto == null) {
          debugPrint('Error happened in [getCurrencyConversionHistory] for [Null Value] message: currencyConversionModelDto == null');
          return left(const UserFlowFailure.serverError());
        } else {
          return right(conversionHistoryModelDto.toDomain());
        }
      } else {
        final responseError = response.error;

        debugPrint('Error happened in [getCurrencyConversionHistory] for [CHOPPER Unsuccessful Request] message: $responseError');

        if (responseError == 'Invalid API Key') {
          return left(const UserFlowFailure.invalidApiKey());
        } else if (responseError == 'Invalid date. Format is yyyy-mm-dd') {
          return left(const UserFlowFailure.invalidDateInputFormat());
        }
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint('Error happened in [getCurrencyConversionHistory] for [Generic Catch] message: $e');
      return left(const UserFlowFailure.serverError());
    }
  }

  @override
  Future<Either<UserFlowFailure, CurrencyConversionModel>> getCurrencyConversionNow({
    required ValidatedNormalString fromCurrency,
    required ValidatedNormalString toCurrency,
  }) async {
    final fromCurrencyStr = fromCurrency.getOrCrash();
    final toCurrencyStr = toCurrency.getOrCrash();
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }

      final response = await _currencyConverterService.getCurrencyConversionNow(
        fromAndToMultipleCurrencies: '${fromCurrencyStr}_$toCurrencyStr,${toCurrencyStr}_$fromCurrencyStr',
      );
      if (response.isSuccessful) {
        final currencyConversionModelDto = response.body;
        if (currencyConversionModelDto == null) {
          debugPrint('Error happened in [getCurrencyConversionNow] for [Null Value] message: currencyConversionModelDto == null');
          return left(const UserFlowFailure.serverError());
        } else {
          return right(currencyConversionModelDto.toDomain());
        }
      } else {
        final responseError = response.error;

        debugPrint('Error happened in [getCurrencyConversionNow] for [CHOPPER Unsuccessful Request] message: $responseError');

        if (responseError == 'Invalid API Key') {
          return left(const UserFlowFailure.invalidApiKey());
        } else if (responseError == 'Invalid date. Format is yyyy-mm-dd') {
          return left(const UserFlowFailure.invalidDateInputFormat());
        }
        return left(const UserFlowFailure.serverError());
      }
    } catch (e) {
      debugPrint('Error happened in [getCurrencyConversionNow] for [Generic Catch] message: $e');
      return left(const UserFlowFailure.serverError());
    }
  }
}
