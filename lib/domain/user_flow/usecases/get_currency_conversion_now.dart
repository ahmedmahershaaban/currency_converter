import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/currency_conversion_model/currency_conversion_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class GetCurrencyConversionNow implements UseCase<CurrencyConversionModel, ParamsForGetCurrencyConversionNow> {
  final IUserFlowFacade repository;

  const GetCurrencyConversionNow(this.repository);

  @override
  Future<Either<UserFlowFailure, CurrencyConversionModel>> call(params) {
    return repository.getCurrencyConversionNow(
      fromCurrency: params.fromCurrency,
      toCurrency: params.toCurrency,
    );
  }
}

class ParamsForGetCurrencyConversionNow extends Equatable {
  final ValidatedNormalString fromCurrency;
  final ValidatedNormalString toCurrency;

  const ParamsForGetCurrencyConversionNow({
    required this.fromCurrency,
    required this.toCurrency,
  });

  @override
  List<Object?> get props => [
        fromCurrency,
        toCurrency,
      ];
}
