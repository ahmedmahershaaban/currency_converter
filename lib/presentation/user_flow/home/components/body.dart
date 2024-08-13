import 'package:auto_route/auto_route.dart';
import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/routes/router.dart';
import 'package:currency_converter/presentation/user_flow/home/components/home_conversion_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  50.verticalSpace,
                  Text('Currency Converter', style: context.font25W700),
                  10.verticalSpace,
                  Text(
                    'Check live rates, set rate alerts, receive notifications and more.',
                    style: context.font16w400.copyWith(color: const Color(0xFF808080)),
                    textAlign: TextAlign.center,
                  ),
                  40.verticalSpace,
                  HomeConversionSection(),
                  30.verticalSpace,
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Indicative Exchange Rate',
                          style: context.font16w400.copyWith(color: const Color(0xFF808080)),
                        ),
                        13.verticalSpace,
                        state.isLoadingForCurrencyConversion
                            ? const LinearProgressIndicator()
                            : state.currencyConversionModel.fold(
                                () => const LinearProgressIndicator(),
                                (currencyConversion) => Text(
                                  state.fromCountrySelected.fold(
                                    () => 'Opps! Something went wrong!',
                                    (fromCountry) => state.toCountrySelected.fold(
                                      () => 'Opps! Something went wrong!',
                                      (toCountry) => state.isLoadingForCurrencyConversion
                                          ? '0 ${fromCountry.currencyId.getOrCrash()} = 0 ${toCountry.currencyId.getOrCrash()}'
                                          : '1 ${fromCountry.currencyId.getOrCrash()} = ${state.isCurrencyFlipped ? currencyConversion.toFromConversion.getOrCrash() : currencyConversion.fromToConversion.getOrCrash()} ${toCountry.currencyId.getOrCrash()}',
                                    ),
                                  ),
                                  style: context.font18w500.copyWith(color: Colors.black),
                                ),
                              ),
                      ],
                    ),
                  ),
                  30.verticalSpace,
                  ElevatedButton(
                    onPressed: state.currencyConversionModel.isNone() || state.fromCountrySelected.isNone() || state.toCountrySelected.isNone()
                        ? null
                        : () {
                            context.read<UserFlowBloc>().add(const UserFlowEvent.getCurrencyConversionHistoryEvent());
                            context.router.push(const CurrencyHistoryRoute());
                          },
                    child: Text(
                      'Currency History',
                      style: context.font16w700.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
