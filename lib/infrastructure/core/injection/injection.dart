import 'package:currency_converter/infrastructure/core/injection/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

/// Initializing [GetIt] for dependency injection.
@injectableInit
Future<void> configureInjection(String env) async {
  await getIt.init(environment: env);
}
