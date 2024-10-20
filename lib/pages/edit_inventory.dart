import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_stock_managment_system_app/widgets/edit_inventory_form.dart';

class EditInventoryPage extends ConsumerWidget {
  const EditInventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String productId =
        GoRouterState.of(context).pathParameters["productId"].toString();

    return FutureBuilder<AsyncValue<InventoryGet>>(
      future: ref
          .read(inventoryItemsProvider.notifier)
          .getInventoryItemById(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return const Text(
              "An error occured while trying to fetch the product details");
        } else if (snapshot.hasData) {
          final item = snapshot.data!;
          return switch (item) {
            AsyncData(:final value) => Column(
              children: [
                 
                 Expanded(child: Text("Edit ${value.inventoryItems[0]["product_name"]}",style: Theme.of(context).textTheme.headlineSmall,)),
                Expanded(
                  flex: 15,
                  child: Padding(
                    padding: const EdgeInsets.all(60.0),
                    child: EditForm(fields: value.inventoryItems),
                  ),
                ),
              ],
            ),
            AsyncError() => const Text(
                "An error occured while trying to fetch the product details"),
            _ => const CircularProgressIndicator()
          };
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
