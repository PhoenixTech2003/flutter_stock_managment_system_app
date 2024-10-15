import 'package:flutter/material.dart';
import 'package:flutter_stock_managment_system_app/widgets/custom_card.dart';
import 'package:flutter_stock_managment_system_app/widgets/sales_bar_chart.dart';
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';
import 'package:flutter_stock_managment_system_app/utils/data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Summary> futureSummary;

  @override
  void initState() {
    super.initState();
    futureSummary = fetchSummary();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: FutureBuilder<Summary>(
          future: futureSummary,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return (Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Summary",
                        style: Theme.of(context).textTheme.headlineSmall,
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: CustomCard(
                              const Icon(
                                Icons.calendar_month,
                                color: Colors.amber,
                                size: 40,
                              ),
                              "Yearly Sales",
                              "K ${snapshot.data!.yearlySales}",
                              Colors.black))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: CustomCard(
                            const Icon(
                              Icons.calendar_month_outlined,
                              color: Colors.blue,
                              size: 40,
                            ),
                            "Monthly Sales",
                            "K ${snapshot.data!.monthlySales}",
                            const Color(0xFFFCD34D)),
                      ),
                      Expanded(
                          child: CustomCard(
                              const Icon(
                                Icons.trending_up,
                                color: Colors.green,
                                size: 40,
                              ),
                              "${snapshot.data!.productHighestSales["product_name"]}",
                              "K ${snapshot.data!.productHighestSales["total_sales"]}",
                              const Color(0xFF172554)))
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text("Monthly Sales",
                      style: Theme.of(context).textTheme.bodyLarge),
                  const SizedBox(
                    height: 20,
                  ),
                  const Expanded(child: SalesBarChart())
                ],
              ));
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          }),
    );
  }
}
