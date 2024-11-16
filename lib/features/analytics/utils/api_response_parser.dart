import 'dart:convert';
import '../models/firebase_item_scoped_data_model.dart';
//import '../data/item_list_mock.dart';
import '../data/cart_items_mock.dart';
import '../data/single_item_mock.dart';
import '../data/purchase_data_mock.dart';

// Function to parse the simulated API response for purchase and return a map
Map<String, dynamic> parsePurchaseApiResponse() {
  final Map<String, dynamic> jsonData = json.decode(getPurchaseApiResponse());
  final List<dynamic> itemsJson = jsonData['items'];
  final items =
      itemsJson.map((item) => CustomAnalyticsEventItem.fromJson(item)).toList();
  return {
    'transaction_id': jsonData['transaction_id'],
    'items': items,
  };
}

// Function to parse the simulated API response for cart and return a map
Map<String, dynamic> parseCartApiResponse() {
  final Map<String, dynamic> jsonData = json.decode(cartApiResponse);
  final List<dynamic> itemsJson = jsonData['items'];
  final items =
      itemsJson.map((item) => CustomAnalyticsEventItem.fromJson(item)).toList();
  return {
    'items': items,
  };
}

// Function to parse the single item API response and return a CustomAnalyticsEventItem
CustomAnalyticsEventItem parseSingleItemApiResponse() {
  final Map<String, dynamic> jsonData = json.decode(
      singleItemApiResponse); // Ensure singleItemApiResponse is a String
  return CustomAnalyticsEventItem.fromJson(jsonData);
}
