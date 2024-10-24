import 'package:flutter/material.dart';

class SalesCard extends StatelessWidget {
  final Map fields;
  const SalesCard({super.key, required this.fields});

  @override
  Widget build(BuildContext context) {
    final List<dynamic> cardFields = fields.keys.toList();
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              for (var field in cardFields) Text("$field : ${fields[field]}")
            ])
          ],
        ),
      ),
    );
  }
}
