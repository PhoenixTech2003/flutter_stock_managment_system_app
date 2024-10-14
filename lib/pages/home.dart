import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/widgets/custom_card.dart';
import 'package:flutter_stock_managment_system_app/widgets/sales_bar_chart.dart';
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: const EdgeInsets.all(15.0),
      child: (const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            
            children: [
              Expanded(
                  child: CustomCard(
                    
                      Icon(
                        Icons.calendar_month,
                        color: Colors.amber,
                        size: 40,
                      ),
                      "Yearly Sales",
                      "No Data",
                      Colors.black))
            ],
          ),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: CustomCard(
                    Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.blue,
                      size: 40,
                    ),
                    "Monthly Sales",
                    "No Data",
                    Color(0xFFFCD34D)),
              ),
              Expanded(
                  child: CustomCard(
                      Icon(
                        Icons.trending_up,
                        color: Colors.green,
                        size: 40,
                      ),
                      "No Data",
                      "No Data",
                      Color(0xFF172554)))
            ],
          ),
          SizedBox(height: 30,),
          Expanded(child: SalesBarChart())
          
        ],
      )),
    );
  }
}
