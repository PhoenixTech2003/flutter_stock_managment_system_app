import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';
import 'package:flutter_stock_managment_system_app/widgets/inventory_item_card.dart';

class InventoryPage extends StatefulWidget {
  const InventoryPage({super.key});

  @override
  State<InventoryPage> createState() => _InventoryPageState();
}

class _InventoryPageState extends State<InventoryPage> {
  late Future<InventoryGet> futureInventoryGet;

  @override
  void initState() {
    super.initState();
    futureInventoryGet = fetchInventory();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureInventoryGet,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
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
                    itemCount: snapshot.data!.inventoryItems.length,
                    itemBuilder: (BuildContext context, int index) {
                     return InventoryItemCard(snapshot: snapshot, index: index);
                    },
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }

          return const CircularProgressIndicator();
        });
  }
}
