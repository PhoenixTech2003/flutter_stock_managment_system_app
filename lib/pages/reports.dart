import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/widgets/report_card.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> cardDetails = [
      {
        "icon": Icon(
          Icons.calendar_month,
          size: 40,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        "cardName": "Daily Sales",
        "url": "/reports/daily_sales"
      },
      {
        "icon": Icon(
          Icons.calendar_month,
          size: 40,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        "cardName": "Monthly Sales",
        "url": "/reports/monthly_sales"
      },
      {
        "icon": Icon(
          Icons.calendar_month,
          size: 40,
          color: Theme.of(context).colorScheme.onPrimaryContainer,
        ),
        "cardName": "Yearly Sales",
        "url": "/reports/yearly_sales"
      }
    ];
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Align(
              alignment: Alignment.centerLeft,
              child: Expanded(
                  child: Text(
                "Reports",
                style: Theme.of(context).textTheme.headlineSmall,
              ))),
          Expanded(
            flex: 10,
            child: ListView.builder(
                itemCount: cardDetails.length,
                itemBuilder: (BuildContext context, int index) {
                  return ReportCard(
                      cardName: cardDetails[index]["cardName"],
                      icon: cardDetails[index]["icon"],
                      url: cardDetails[index]["url"]);
                }),
          ),
        ],
      ),
    );
  }
}
