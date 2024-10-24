import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_stock_managment_system_app/widgets/sales_card.dart';

class DailySales extends ConsumerWidget {
  const DailySales({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AsyncValue<DailySalesGet> sales = ref.watch(dailySalesProvider);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
          child: switch (sales) {
        AsyncData(:final value) => Column(
            children: [
              Align(alignment: Alignment.centerLeft,child: Text("Daily Sales Report", style: Theme.of(context).textTheme.headlineSmall,)),
              const SizedBox(height: 15,),
              Expanded(
                child: ListView.builder(
                    itemCount: value.dailySales.length,
                    itemBuilder: (BuildContext context, int index) {
                      return SalesCard(fields: value.dailySales[index]);
                    }),
              )
            ],
          ),
        AsyncError() => const Text("Failed to fetch daily sales data"),
        _ => const CircularProgressIndicator()
      }),
    );
  }
}
