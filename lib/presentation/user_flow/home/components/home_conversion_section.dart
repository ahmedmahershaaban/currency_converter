import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_event.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/core/errors.dart';
import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/domain/user_flow/country_names_with_flags_model/country_names_with_flags_model.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/shimmer_loading.dart';
import 'package:currency_converter/presentation/user_flow/home/components/switch_button.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt_dart/kt.dart';

class HomeConversionSection extends StatelessWidget {
  const HomeConversionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        return ShimmerLoading(
          isLoading: state.isLoadingForCountriesAndFlags,
          child: state.isLoadingForCountriesAndFlags
              ? Container(
                  width: double.infinity,
                  height: 270.h,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(2, 2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                )
              : Container(
                  padding: EdgeInsets.all(20.w),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        offset: Offset(2, 2),
                        spreadRadius: 1,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amount',
                        style: context.font15w400.copyWith(color: const Color(0xFF989898)),
                      ),
                      14.verticalSpace,
                      Row(
                        children: [
                          state.fromCountrySelected.getOrElse(() => throw UnexpectedNullValueError()).currencyFlagSvg.toSvgPictureWidget(),
                          13.horizontalSpace,
                          DropdownButton<CountryNamesWithFlagsModel>(
                              value: state.fromCountrySelected.fold(() => null, id),
                              items: state.countryNamesWithFlagsModels
                                  .getOrElse(() => KtList.empty())
                                  .map((country) => DropdownMenuItem<CountryNamesWithFlagsModel>(
                                        value: country,
                                        child: Text(country.currencyId.getOrCrash()),
                                      ))
                                  .asList(),
                              onChanged: (country) {
                                if (country != null) {
                                  context.read<UserFlowBloc>().add(UserFlowEvent.updateFromCountrySelectedEvent(countryNamesWithFlagsModel: country));
                                }
                              }),
                          16.horizontalSpace,
                          Expanded(
                            child: TextFormField(
                              controller: state.fromCurrencyTextEditingController,
                              autovalidateMode: AutovalidateMode.always,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.right,
                              style: context.font20w600.copyWith(
                                color: const Color(0xFF3C3C3C),
                              ),
                              onChanged: (v) =>
                                  context.read<UserFlowBloc>().add(UserFlowEvent.updateFromCurrencyValueEvent(number: ValidatedDouble(v))),
                              validator: (v) {
                                if (v != null && v.isNotEmpty) {
                                  return state.fromCurrencyValue.failureOrUnit.fold((_) => 'Invalid Number', (_) => null);
                                }

                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: '0.0',
                              ),
                            ),
                          ),
                        ],
                      ),
                      14.verticalSpace,
                      SizedBox(
                        height: 44.h,
                        child: Stack(children: [
                          const Center(
                            child: Divider(
                              color: Color(0xFFE7E7EE),
                            ),
                          ),
                          Center(
                            child: SwitchButton(
                              onPressed: () {
                                context.read<UserFlowBloc>().add(const UserFlowEvent.updateIsCurrencyFlippedEvent());
                              },
                              isFlipped: state.isCurrencyFlipped,
                            ),
                          ),
                        ]),
                      ),
                      14.verticalSpace,
                      Text(
                        'Converted Amount',
                        style: context.font15w400.copyWith(color: const Color(0xFF989898)),
                      ),
                      14.verticalSpace,
                      Row(
                        children: [
                          state.toCountrySelected.getOrElse(() => throw UnexpectedNullValueError()).currencyFlagSvg.toSvgPictureWidget(),
                          13.horizontalSpace,
                          DropdownButton<CountryNamesWithFlagsModel>(
                              value: state.toCountrySelected.fold(() => null, id),
                              items: state.countryNamesWithFlagsModels
                                  .getOrElse(() => KtList.empty())
                                  .map((country) => DropdownMenuItem<CountryNamesWithFlagsModel>(
                                        value: country,
                                        child: Text(country.currencyId.getOrCrash()),
                                      ))
                                  .asList(),
                              onChanged: (country) {
                                if (country != null) {
                                  context.read<UserFlowBloc>().add(UserFlowEvent.updateToCountrySelectedEvent(countryNamesWithFlagsModel: country));
                                }
                              }),
                          16.horizontalSpace,
                          Expanded(
                            child: ShimmerLoading(
                              isLoading: state.isLoadingForCurrencyConversion,
                              child: TextFormField(
                                controller: state.toCurrencyTextEditingController,
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.right,
                                enabled: false,
                                style: context.font20w600.copyWith(
                                  color: const Color(0xFF3C3C3C),
                                ),
                                decoration: const InputDecoration(
                                  hintText: '0.0',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
