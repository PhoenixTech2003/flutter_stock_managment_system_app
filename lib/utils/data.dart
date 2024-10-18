import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';

Future<Summary> fetchSummary() async {
  final response =
      await http.get(Uri.parse('http://localhost:9000/v1/summary/'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Summary.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load summary');
  }
}

Future<InventoryGet> fetchInventory() async {
  final response =
      await http.get(Uri.parse("http://localhost:9000/v1/inventory/"));

  if (response.statusCode == 200) {
    return InventoryGet.fromJson(jsonDecode(response.body) as List<dynamic>);
  } else {
    throw Exception("Failed to load inventory items");
  }
}
