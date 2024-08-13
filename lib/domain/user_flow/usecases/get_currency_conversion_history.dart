import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/conversion_history_model/conversion_history_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCurrencyConversionHistory implements UseCase<ConversionHistoryModel, ParamsForGetCurrencyConversionHistory> {
  final IUserFlowFacade repository;

  GetCurrencyConversionHistory(this.repository);

  @override
  Future<Either<UserFlowFailure, ConversionHistoryModel>> call(ParamsForGetCurrencyConversionHistory params) {
    return repository.getCurrencyConversionHistory(
      fromCurrency: params.fromCurrency,
      toCurrency: params.toCurrency,
      startDate: params.startDate,
      endDate: params.endDate,
    );
  }
}

class ParamsForGetCurrencyConversionHistory extends Equatable {
  final ValidatedNormalString fromCurrency;
  final ValidatedNormalString toCurrency;
  final DuoDate startDate;
  final DuoDate endDate;

  const ParamsForGetCurrencyConversionHistory({
    required this.fromCurrency,
    required this.toCurrency,
    required this.startDate,
    required this.endDate,
  });

  @override
  List<Object> get props => [
        fromCurrency,
        toCurrency,
        startDate,
        endDate,
      ];
}
