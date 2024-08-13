import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/user_flow/user_flow_failures/user_flow_failure.dart';
import 'package:currency_converter/presentation/components/snackbar/snackbar.dart';
import 'package:currency_converter/presentation/core/shimmer_loading.dart';
import 'package:currency_converter/presentation/user_flow/home/components/body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// This Page and it's Components will be documented in the next steps, covering both the `Presentation Layer` and `Application Layer`.
/// The `Domain Layer` and `Infrastructure Layer` have already been documented.
@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserFlowBloc, UserFlowState>(
        listener: (_, state) {
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
        },
        child: const Scaffold(
          body: Shimmer(
            linearGradient: shimmerGradient,
            child: Body(),
          ),
        ));
  }
}
