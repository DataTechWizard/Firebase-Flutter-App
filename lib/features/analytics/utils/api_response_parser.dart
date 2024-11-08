import 'dart:convert';
import '../models/CustomAnalyticsEventItem.dart';
import '../data/item_list_mock.dart';
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

// Ensure this function uses itemListApiResponse
Map<String, dynamic> parseItemListApiResponse() {
  final Map<String, dynamic> jsonData =
      json.decode(itemListApiResponse); // Uses itemListApiResponse
  final List<dynamic> itemsJson = jsonData['items'];
  final items =
      itemsJson.map((item) => CustomAnalyticsEventItem.fromJson(item)).toList();
  return {
    'itemListId': jsonData['itemListId'],
    'itemListName': jsonData['itemListName'],
    'items': items,
  };
}

// Function to parse the single item API response and return a CustomAnalyticsEventItem
CustomAnalyticsEventItem parseSingleItemApiResponse() {
  final Map<String, dynamic> jsonData = json.decode(
      singleItemApiResponse); // Ensure singleItemApiResponse is a String
  return CustomAnalyticsEventItem.fromJson(jsonData);
}
