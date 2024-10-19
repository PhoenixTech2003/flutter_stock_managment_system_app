import 'dart:convert';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_stock_managment_system_app/utils/api_definitions.dart';

part 'data.g.dart';

@riverpod
Future<Summary> fetchSummary(FetchSummaryRef ref) async {
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

@riverpod
class InventoryItems extends _$InventoryItems {
  @override
  Future<InventoryGet> build() async {
    final response =
        await http.get(Uri.parse("http://localhost:9000/v1/inventory/"));

    if (response.statusCode == 200) {
      return InventoryGet.fromJson(jsonDecode(response.body) as List<dynamic>);
    } else {
      throw Exception("Failed to load inventory items");
    }
  }

  Future<void> deleteInventoryItem(String productId) async {
    final response = await http.delete(
        Uri.parse('http://localhost:9000/v1/inventory/$productId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });

    if (response.statusCode == 200) {
      ref.invalidateSelf();
      await future;
    } else {
      throw Exception("Failed to delete item");
    }
  }
}
