import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ReportCard extends StatelessWidget {
  final Icon icon;
  final String cardName;
  final String url;
  const ReportCard(
      {required this.cardName,
      required this.icon,
      required this.url,
      super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go(url),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Row(
            
              children: [icon,const SizedBox(width: 20,), Text(cardName)],
            ),
          ),
        ),
      ),
    );
  }
}
