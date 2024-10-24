class Summary {
  final Map<String, dynamic> productHighestSales;
  final int monthlySales;
  final int yearlySales;
  final List<Map<String, dynamic>> chartData;
  const Summary(
      {required this.productHighestSales,
      required this.monthlySales,
      required this.yearlySales,
      required this.chartData});

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      productHighestSales: json['productHighestSales'] as Map<String, dynamic>,
      monthlySales: json['monthlySales'] as int,
      yearlySales: json['yearlySales'] as int,
      chartData: (json['ChartData'] as List)
          .map((item) => item as Map<String, dynamic>)
          .toList(),
    );
  }
}

class InventoryGet {
  final List<dynamic> inventoryItems;

  const InventoryGet({required this.inventoryItems});

  factory InventoryGet.fromJson(List<dynamic> json) {
    return InventoryGet(inventoryItems: json);
  }
}

class DailySalesGet{
  final List<dynamic> dailySales;

  const DailySalesGet({required this.dailySales});

  factory DailySalesGet.fromJson(List<dynamic> json) {
    return DailySalesGet(dailySales: json);
  }
}
