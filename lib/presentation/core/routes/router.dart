import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/presentation/user_flow//splash/splash_page.dart';
import 'package:currency_converter/presentation/user_flow/currency_history/currency_history_page.dart';
import 'package:currency_converter/presentation/user_flow/home/home_page.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: SplashRoute.page, initial: true),
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: CurrencyHistoryRoute.page),
      ];
}
