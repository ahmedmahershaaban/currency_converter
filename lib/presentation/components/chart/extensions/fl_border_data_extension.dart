import 'package:currency_converter/presentation/components/chart/base/base_chart/base_chart_data.dart';
import 'package:flutter/widgets.dart';

extension FlBorderDataExtension on FlBorderData {
  EdgeInsets get allSidesPadding {
    return EdgeInsets.only(
      left: show ? border.left.width : 0.0,
      top: show ? border.top.width : 0.0,
      right: show ? border.right.width : 0.0,
      bottom: show ? border.bottom.width : 0.0,
    );
  }
}
