import 'package:flutter/material.dart';

class InventoryItemCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  final int index;

  const InventoryItemCard(
      {super.key, required this.snapshot, required this.index});
  @override
  Widget build(BuildContext context) {
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
                "${snapshot.data!.inventoryItems[index]["product_name"].substring(0, 1)}",
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
                    "${snapshot.data!.inventoryItems[index]["product_name"]}",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Text(
                      "Selling Price: K ${snapshot.data!.inventoryItems[index]["selling_price"]}"),
                  Text(
                      "Remaining: ${snapshot.data!.inventoryItems[index]["product_qty"]}"),
                ],
              ),
            ),
            Flexible(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text(
                          "Do you want to delete ${snapshot.data!.inventoryItems[index]["product_name"]}"),
                      content: Text(
                          "This action will permanently delete ${snapshot.data!.inventoryItems[index]["product_name"]} "),
                      actions: [
                        FilledButton(
                            onPressed: () => print("hello"),
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: const Text("Delete")),
                        OutlinedButton(
                            onPressed: () => print("hello there"),
                          
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
                const SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.edit,
                  size: 40,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                )
              ],
            ))
          ],
        ),
      ),
    );
  }
}
