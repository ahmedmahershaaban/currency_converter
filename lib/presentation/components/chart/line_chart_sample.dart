import 'package:currency_converter/presentation/components/chart/base/axis_chart/axis_chart_data.dart';
import 'package:currency_converter/presentation/components/chart/base/axis_chart/axis_chart_widgets.dart';
import 'package:currency_converter/presentation/components/chart/base/base_chart/base_chart_data.dart';
import 'package:currency_converter/presentation/components/chart/line_chart/line_chart.dart';
import 'package:currency_converter/presentation/components/chart/line_chart/line_chart_data.dart';
import 'package:currency_converter/presentation/core/extensions/text_theme_extensions.dart';
import 'package:currency_converter/presentation/core/themes/app_themes.dart';
import 'package:flutter/material.dart';

class LineChartSample extends StatelessWidget {
  LineChartSample({super.key, required this.spotsData});
  final List<FlSpot> spotsData;
  final List<Color> gradientColors = [
    kNeutralColors.withOpacity(0.5),
    kNeutralColors,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kNeutralColors[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: AspectRatio(
        aspectRatio: 1.70,
        child: Padding(
          padding: const EdgeInsets.only(
            right: 18,
            left: 12,
            top: 24,
            bottom: 12,
          ),
          child: LineChart(
            mainData(context),
          ),
        ),
      ),
    );
  }

  Widget bottomTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final style = context.font12w400;
    Widget text;
    switch (value.toInt()) {
      case 2:
        text = Text('MAR', style: style);
        break;
      case 5:
        text = Text('JUN', style: style);
        break;
      case 8:
        text = Text('SEP', style: style);
        break;
      default:
        text = Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  Widget leftTitleWidgets(BuildContext context, double value, TitleMeta meta) {
    final style = context.font12w400;

    String text;
    switch (value.toInt()) {
      case 1:
        text = '10K';
        break;
      case 3:
        text = '30k';
        break;
      case 5:
        text = '50k';
        break;
      default:
        return Container();
    }

    return Text(text, style: style, textAlign: TextAlign.left);
  }

  LineChartData mainData(context) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        verticalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return const FlLine(
            color: Colors.white10,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              return bottomTitleWidgets(context, value, meta);
            },
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            getTitlesWidget: (double value, TitleMeta meta) {
              return leftTitleWidgets(context, value, meta);
            },
            reservedSize: 42,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          // spots: spotsData,
          spots: const [
            FlSpot(0, 3),
            FlSpot(0, 3),
            FlSpot(0, 3),
            FlSpot(0, 3),
            FlSpot(0, 3),
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: const FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors.map((color) => color.withOpacity(0.3)).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
