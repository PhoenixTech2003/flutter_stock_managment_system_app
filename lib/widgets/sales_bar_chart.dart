import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class SalesBarChart extends StatelessWidget {
  const SalesBarChart({super.key});
  @override
  Widget build(BuildContext context) {
    return (BarChart(
      BarChartData(
        gridData: const FlGridData(
          drawVerticalLine: false
        ),
          titlesData: FlTitlesData(
              rightTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles:
                  const AxisTitles(sideTitles: SideTitles(showTitles: false)),
              leftTitles: const AxisTitles(
                  axisNameWidget: Text("Monthly Sales"),
                  axisNameSize: 30,
                  sideTitles: SideTitles(showTitles: true, reservedSize: 33)),
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
            BarChartGroupData(x: 0, barRods: [BarChartRodData(toY: 10)]),
            BarChartGroupData(x: 1, barRods: [BarChartRodData(toY: 5)])
          ]
          // read about it in the BarChartData section
          ),
      // Optional
    ));
  }
}
