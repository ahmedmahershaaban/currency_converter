import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:currency_converter/presentation/components/snackbar/snackbar.dart';
import 'package:currency_converter/presentation/core/app_config.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/routes/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 400)).then((_) {
      context.router.replaceAll([const HomeRoute()]);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final appConfig = AppConfig.of(context);
    return BlocListener<UserFlowBloc, UserFlowState>(
      listener: (_, state) {
        if (state.countryNamesWithFlagsModels.isSome()) {
        } else {
          state.userFlowFailureOrSuccessOption.fold(() {}, (either) {
            either.fold((l) {
              IconSnackBar.show(
                context: context,
                snackBarType: SnackBarType.fail,
                label: getUserFlowFailureString(l),
              );
            }, (r) {
              r.fold(() {}, (message) {
                IconSnackBar.show(
                  context: context,
                  snackBarType: SnackBarType.save,
                  label: message,
                );
              });
            });
          });
        }
      },
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  appConfig.iconAssets,
                  width: 50.w,
                  height: 50.h,
                ),
                24.verticalSpace,
                Text(
                  appConfig.appTitle,
                  style: context.font16w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
