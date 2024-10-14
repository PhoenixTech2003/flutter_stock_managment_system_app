import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  final Icon icon;
  final String cardTag;
  final String data;
  final Color cardColor;
  const CustomCard(this.icon, this.cardTag, this.data, this.cardColor,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return (Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            icon,
            Text(
              cardTag,
            ),
            Text(
              data,
            )
          ],
        ),
      ),
    ));
  }
}
