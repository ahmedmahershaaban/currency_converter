import 'package:currency_converter/domain/core/value_objects.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/shimmer_loading.dart';
import 'package:currency_converter/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kt_dart/collection.dart';

class CurrencyHistoryCardListSection extends StatelessWidget {
  final KtList<KtPair<DuoDate, ValidatedDouble>> historyList;
  final String fromCurrency;
  final String toCurrency;
  final bool isLoading;
  const CurrencyHistoryCardListSection({
    super.key,
    required this.historyList,
    required this.fromCurrency,
    required this.toCurrency,
    required this.isLoading,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: isLoading ? const NeverScrollableScrollPhysics() : null,
        itemCount: isLoading ? 40 : historyList.size,
        itemBuilder: (context, index) {
          return ShimmerLoading(
            isLoading: isLoading,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 5.h),
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              decoration: BoxDecoration(
                color: kNeutralColors[200],
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: isLoading
                  ? SizedBox(
                      height: 20.h,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          historyList[index].first.toStringFormatForConversionHistory(),
                          style: context.font12w400,
                        ),
                        Text(
                          ' -> ',
                          style: context.font12w400,
                        ),
                        Text(
                          historyList[index].second.getOrCrash(),
                          style: context.font12w400,
                        ),
                      ],
                    ),
            ),
          );
        });
  }
}
