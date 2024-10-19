import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SalesBarChart extends ConsumerWidget {
  const SalesBarChart({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Summary> summary = ref.watch(fetchSummaryProvider);
    return Container(
      child: switch (summary) {
        AsyncData(:final value) => (BarChart(
            BarChartData(
                gridData: const FlGridData(drawVerticalLine: false),
                titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false)),
                    leftTitles: const AxisTitles(
                        axisNameWidget: Text("Monthly Sales"),
                        axisNameSize: 30,
                        sideTitles:
                            SideTitles(showTitles: true, reservedSize: 100)),
                    bottomTitles: AxisTitles(
                        axisNameWidget: const Text("Months"),
                        axisNameSize: 30,
                        sideTitles: SideTitles(
                          showTitles: true,
                          reservedSize: 33,
                          getTitlesWidget: (double value, meta) {
                            return switch (value) {
                              0 => const Text("Jan"),
                              1 => const Text("Feb"),
                              2 => const Text("Mar"),
                              3 => const Text("Apr"),
                              4 => const Text("May"),
                              5 => const Text("Jun"),
                              6 => const Text("Jul"),
                              7 => const Text("Aug"),
                              8 => const Text("Sep"),
                              9 => const Text("Oct"),
                              10 => const Text("Nov"),
                              11 => const Text("Dec"),
                              _ => const Text("")
                            };
                          },
                        ))),
                barGroups: [
                  for (Map chartData in value.chartData)
                    BarChartGroupData(
                        x: chartData["monthIndex"] as int,
                        barRods: [
                          BarChartRodData(
                              toY: (chartData["total_sales"] as num).toDouble())
                        ]),
                ]
                // read about it in the BarChartData section
                ),
            // Optional
          )),
        AsyncError() =>
          const Text("An error occured while fetching chart data"),
        _ => const CircularProgressIndicator()
      },
    );
  }
}
