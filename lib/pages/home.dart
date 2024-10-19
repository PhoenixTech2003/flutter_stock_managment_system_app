import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/widgets/custom_card.dart';
import 'package:flutter_stock_managment_system_app/widgets/sales_bar_chart.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<Summary> summary = ref.watch(fetchSummaryProvider);
    return Padding(
        padding: const EdgeInsets.all(15.0),
        child: switch (summary) {
          AsyncData(:final value) => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Summary",
                      style: Theme.of(context).textTheme.headlineSmall,
                    )),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                        child: CustomCard(
                            const Icon(
                              Icons.calendar_month,
                              color: Colors.amber,
                              size: 40,
                            ),
                            "Yearly Sales",
                            "K ${value.yearlySales}",
                            Colors.black))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: CustomCard(
                          const Icon(
                            Icons.calendar_month_outlined,
                            color: Colors.blue,
                            size: 40,
                          ),
                          "Monthly Sales",
                          "K ${value.monthlySales}",
                          const Color(0xFFFCD34D)),
                    ),
                    Expanded(
                        child: CustomCard(
                            const Icon(
                              Icons.trending_up,
                              color: Colors.green,
                              size: 40,
                            ),
                            "${value.productHighestSales["product_name"]}",
                            "K ${value.productHighestSales["total_sales"]}",
                            const Color(0xFF172554)))
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Monthly Sales",
                    style: Theme.of(context).textTheme.bodyLarge),
                const SizedBox(
                  height: 20,
                ),
                const Expanded(child: SalesBarChart())
              ],
            ),
          AsyncError() => const Text("An errror occured"),
          _ => const CircularProgressIndicator()
        });
  }
}
