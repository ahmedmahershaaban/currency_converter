import 'package:currency_converter/domain/shared/internet_connection_repository.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

@LazySingleton(as: InternetConnectionRepository)
class InternetConnectionRepositoryImpl implements InternetConnectionRepository {
  final InternetConnection internetConnection;

  InternetConnectionRepositoryImpl(this.internetConnection);

  @override
  Future<bool> get hasInternetAccess => internetConnection.hasInternetAccess;
}
