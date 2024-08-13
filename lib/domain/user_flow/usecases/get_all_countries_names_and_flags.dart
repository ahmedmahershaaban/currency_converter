import 'package:currency_converter/domain/core/usecase.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/domain/user_flow/i_user_flow_facade.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

@LazySingleton()
class GetAllCountriesNamesAndFlags implements UseCase<KtList<CountryNamesWithFlagsModel>, NoParams> {
  final IUserFlowFacade repository;

  GetAllCountriesNamesAndFlags(this.repository);

  @override
  Future<Either<UserFlowFailure, KtList<CountryNamesWithFlagsModel>>> call(NoParams params) {
    return repository.getAllCountriesNamesAndFlags();
  }
}
