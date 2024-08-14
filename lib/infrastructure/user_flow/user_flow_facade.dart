import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/data_sources/local_data_source/country_names_with_flags_drift_dao_repository/country_names_with_flags_drift_dao_repository.dart';
import 'package:currency_converter/domain/data_sources/remote_data_source/currency_converter_repositroy/currency_converter_repository.dart';
import 'package:currency_converter/domain/data_sources/remote_data_source/flag_cdn_repository/flag_cdn_repository.dart';
import 'package:currency_converter/domain/shared/internet_connection_repository.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:currency_converter/infrastructure/user_flow/country_names_with_flags_model_dto/country_names_with_flags_model_dto.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton(as: IUserFlowFacade)
class UserFlowFacade implements IUserFlowFacade {
  final FlagCdnRepository _flagCdnRepository;
  final CurrencyConverterRepository _currencyConverterRepository;
  final CountryNamesWithFlagsDriftDaoRepository _countryNamesWithFlagsDriftDaoRepository;
  final InternetConnectionRepository _internetConnection;
  UserFlowFacade(this._flagCdnRepository, this._currencyConverterRepository, this._countryNamesWithFlagsDriftDaoRepository, this._internetConnection);

  @override
  Future<Either<UserFlowFailure, KtList<CountryNamesWithFlagsModel>>> getAllCountriesNamesAndFlags() async {
    try {
      bool result = await _internetConnection.hasInternetAccess;
      if (!result) {
        return left(const UserFlowFailure.noInternetConnection());
      }

      final allCountriesWithFlagsModelDrift = await _countryNamesWithFlagsDriftDaoRepository.getAllCountriesWithFlags();
      final allCountriesWithFlagsModel =
          allCountriesWithFlagsModelDrift.map((element) => CountryNamesWithFlagsModelDto.fromDrift(element).toDomain()).toImmutableList();
      // if there is no saved data found . call the API's and get the data and store it.
      if (allCountriesWithFlagsModel.isEmpty()) {
        final responseOfCurrencyConverter = await _currencyConverterRepository.getAllCountriesAndCurrencies();
        return responseOfCurrencyConverter.fold(
            (responseError) => left(
                  handelResponseErrorMessages(responseError),
                ), (countryNamesWithFlagsModelDriftList) async {
          if (countryNamesWithFlagsModelDriftList.isEmpty) {
            debugPrint('Error happened in [getAllCountriesNamesAndFlags] for [Null Value] message: countryNamesWithFlagsModelDriftList.isEmpty');
            return left(const UserFlowFailure.serverError());
          }
          // if we got the the correct response from the currencyConverterService
          // we will move to the next level which is getting the data the flags
          // then will insert the combined data into our local DB and return it to the user
          List<CountryNamesWithFlagsModel> countryNamesWIthFlagsModeList = [];
          for (int i = 0; i < countryNamesWithFlagsModelDriftList.length; i++) {
            final flagValue = await _flagCdnRepository.getCountryFlag(
              countryCode: countryNamesWithFlagsModelDriftList[i].countryShortName!.toLowerCase(),
            );
            final updatedCountryElementModel = countryNamesWithFlagsModelDriftList[i].copyWith(
              currencyFlagSvg: flagValue,
            );
            await _countryNamesWithFlagsDriftDaoRepository.insertCountryWithFlags(updatedCountryElementModel.toDrift());
            countryNamesWIthFlagsModeList.add(updatedCountryElementModel.toDomain());
          }
          return right(countryNamesWIthFlagsModeList.toImmutableList());
        });
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
      final response = await _currencyConverterRepository.getCurrencyConversionHistory(
        fromAndToMultipleCurrencies: '${fromCurrencyStr}_$toCurrencyStr,${toCurrencyStr}_$fromCurrencyStr',
        startDate: startDateStr,
        endDate: endDateStr,
      );
      return response.fold(
          (responseError) => left(
                handelResponseErrorMessages(responseError),
              ), (conversionHistoryModelDto) {
        return right(conversionHistoryModelDto.toDomain());
      });
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
      final response = await _currencyConverterRepository.getCurrencyConversionNow(
        fromAndToMultipleCurrencies: '${fromCurrencyStr}_$toCurrencyStr,${toCurrencyStr}_$fromCurrencyStr',
      );
      return response.fold(
          (responseError) => left(
                handelResponseErrorMessages(responseError),
              ), (currencyConversionModelDto) {
        return right(currencyConversionModelDto.toDomain());
      });
    } catch (e) {
      debugPrint('Error happened in [getCurrencyConversionNow] for [Generic Catch] message: $e');
      return left(const UserFlowFailure.serverError());
    }
  }

  UserFlowFailure handelResponseErrorMessages(String responseError) {
    debugPrint('Error happened in [UserFlowFacade] for [CHOPPER Unsuccessful Request] message: $responseError');
    if (responseError == 'Invalid API Key') {
      return const UserFlowFailure.invalidApiKey();
    } else if (responseError == 'Invalid date. Format is yyyy-mm-dd') {
      return const UserFlowFailure.invalidDateInputFormat();
    }
    return const UserFlowFailure.serverError();
  }
}
