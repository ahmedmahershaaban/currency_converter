import 'package:currency_converter/application/core/theme/theme_bloc.dart';
import 'package:currency_converter/application/core/theme/theme_state.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/infrastructure/core/injection/injection.dart';
import 'package:currency_converter/presentation/core/app_config.dart';
import 'package:currency_converter/presentation/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// This File will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
class AppWidget extends StatelessWidget {
  AppWidget({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    final config = AppConfig.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider<ThemeBloc>(create: (_) => getIt<ThemeBloc>()),
        BlocProvider<UserFlowBloc>(create: (_) => getIt<UserFlowBloc>()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 703),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return MaterialApp.router(
              routeInformationParser: _appRouter.defaultRouteParser(),
              routerDelegate: _appRouter.delegate(),
              title: config.appTitle,
              debugShowCheckedModeBanner: false,
              theme: state.themeData,
            );
          },
        ),
        child: null,
      ),
    );
  }
}
