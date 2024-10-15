

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';

class SalesBarChart extends StatefulWidget {
  const SalesBarChart({super.key});

  @override
  State<SalesBarChart> createState() => _SalesBarChartState();
}

class _SalesBarChartState extends State<SalesBarChart> {
   late Future<Summary> futureSummary;

  @override
  void initState() {
    super.initState();
    futureSummary = fetchSummary();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<Summary>(
        future: futureSummary,
        builder: (context, snapshot){
          if(snapshot.hasData){
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
                        sideTitles: SideTitles(showTitles: true, reservedSize: 100)),
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
                  for(Map chartData in  snapshot.data!.chartData )
                  BarChartGroupData(x: chartData["monthIndex"] as int, barRods: [BarChartRodData(toY: (chartData["total_sales"] as num).toDouble())]),
                  
                ]
                // read about it in the BarChartData section
                ),
            // Optional
          ));
          }else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
      ),
    );
  }
}
