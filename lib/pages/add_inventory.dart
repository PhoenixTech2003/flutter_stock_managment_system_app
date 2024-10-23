import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_stock_managment_system_app/widgets/add_item_form.dart';

class AddInventoryPage extends ConsumerWidget {
  const AddInventoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List fields = [
      "Product Name",
      "Cost Price",
      "Selling Price",
      "Reorder Level",
      "Quantity"
    ];
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Column(
        children: [
           Align(alignment: Alignment.centerLeft,child: Expanded(child: Text("Add Items", style: Theme.of(context).textTheme.headlineMedium,))),
          Expanded(flex: 10, child: AddItemForm(fields: fields))
        ],
      ),
    );
  }
}
