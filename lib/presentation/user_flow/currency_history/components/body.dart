import 'package:currency_converter/application/user_flow/user_flow_bloc.dart';
import 'package:currency_converter/application/user_flow/user_flow_state.dart';
import 'package:currency_converter/domain/core/errors.dart';
import 'package:currency_converter/presentation/components/chart/line_chart_sample.dart';
import 'package:currency_converter/presentation/core/shimmer_loading.dart';
import 'package:currency_converter/presentation/user_flow/currency_history/components/currency_history_card_list_section.dart';
import 'package:currency_converter/presentation/user_flow/currency_history/components/currency_history_header_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt_dart/kt.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserFlowBloc, UserFlowState>(
      builder: (context, state) {
        // final List<FlSpot> spotsData = [];
        // double index = 0.0;
        // state.conversionHistoryModel.getOrElse((() => throw UnexpectedNullValueError())).fromToConversionHistory.map((entry) {
        //   spotsData.add(FlSpot(index, entry.value.toDouble()));
        //   index++;
        // });
        return SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                20.verticalSpace,
                CurrencyHistoryHeaderSection(),
                20.verticalSpace,
                ShimmerLoading(
                  isLoading: state.isLoadingForConversionHistory,
                  child: LineChartSample(spotsData: []),
                ),
                20.verticalSpace,
                Expanded(
                  child: CurrencyHistoryCardListSection(
                    isLoading: state.isLoadingForConversionHistory,
                    historyList: state.conversionHistoryModel.fold(
                        () => const KtList.empty(),
                        (conversionHistoryModel) => (state.isCurrencyFlipped
                                ? conversionHistoryModel.toFromConversionHistory
                                : conversionHistoryModel.fromToConversionHistory)
                            .map((entry) => KtPair(entry.key, entry.value))),
                    fromCurrency: state.fromCountrySelected.getOrElse(() => throw UnexpectedNullValueError()).currencyId.getOrCrash(),
                    toCurrency: state.toCountrySelected.getOrElse(() => throw UnexpectedNullValueError()).currencyId.getOrCrash(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
