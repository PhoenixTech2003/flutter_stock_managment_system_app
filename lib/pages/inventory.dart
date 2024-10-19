import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_stock_managment_system_app/widgets/inventory_item_card.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InventoryPage extends ConsumerWidget {
  const InventoryPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<InventoryGet> inventory =
        ref.watch(inventoryItemsProvider);
    return Container(
        child: switch (inventory) {
      AsyncData(:final value) => Column(
          children: [
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Inventory",
                    style: Theme.of(context).textTheme.headlineSmall,
                  )),
            ),
            Expanded(
              flex: 9,
              child: ListView.builder(
                padding: const EdgeInsets.all(9),
                itemCount: value.inventoryItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return InventoryItemCard(
                    value: value,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      AsyncError() => const Text("Failed to fetch Inventory data"),
      _ => const CircularProgressIndicator()
    });
  }
}
