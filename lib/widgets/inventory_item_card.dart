import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:go_router/go_router.dart';

class InventoryItemCard extends ConsumerWidget {
  final InventoryGet value;
  final int index;

  const InventoryItemCard(
      {super.key, required this.value, required this.index});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: Theme.of(context).colorScheme.surface,
              child: Text(
                "${value.inventoryItems[index]["product_name"].substring(0, 1)}",
                style: const TextStyle(fontSize: 40),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${value.inventoryItems[index]["product_name"]}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                      "Selling Price: K ${value.inventoryItems[index]["selling_price"]}"),
                  Text(
                      "Remaining: ${value.inventoryItems[index]["product_qty"]}"),
                ],
              ),
            ),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  flex: 8,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(
                              "Do you want to delete ${value.inventoryItems[index]["product_name"]}"),
                          content: Text(
                              "This action will permanently delete ${value.inventoryItems[index]["product_name"]} "),
                          actions: [
                            FilledButton(
                                onPressed: () {
                                  ref
                                      .read(inventoryItemsProvider.notifier)
                                      .deleteInventoryItem(value
                                          .inventoryItems[index]["product_id"]);
                                  context.go("/inventory");
                                  Navigator.of(context).pop();
                                },
                                style: FilledButton.styleFrom(
                                    backgroundColor: Colors.red),
                                child: const Text("Delete")),
                            OutlinedButton(
                                onPressed: () => {
                                      context.go("/inventory"),
                                      Navigator.of(context).pop()
                                    },
                                child: const Text("Cancel"))
                          ],
                        ),
                      ),
                      child: Icon(
                        Icons.delete,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                ),
                
                Expanded(
                  flex: 4,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => context.go(
                          "/inventory/${value.inventoryItems[index]["product_id"]}"),
                      child: Icon(
                        Icons.edit,
                        size: 40,
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                    ),
                  ),
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
