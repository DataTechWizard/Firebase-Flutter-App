// import 'package:test_firebase_app/features/analytics/models/custom_analytics_event_item.dart';
// import 'package:test_firebase_app/models/product_model.dart'; // Adjust the path as necessary
// import 'random_product_service.dart'; // Use the new service

// final RandomProductService _randomProductService = RandomProductService();

// // Function to parse purchase data using random items from the file
// Future<Map<String, dynamic>> parsePurchaseApiResponse() async {
//   final List<Product> randomItems =
//       await _randomProductService.getRandomItems(2);
//   final items = randomItems
//       .map((item) => CustomAnalyticsEventItem.fromProduct(item))
//       .toList();
//   return {
//     'transaction_id': 'txn_${DateTime.now().millisecondsSinceEpoch}',
//     'items': items,
//   };
// }

// // Function to parse cart data using random items from the file
// Future<Map<String, dynamic>> parseCartApiResponse() async {
//   final List<Product> randomItems =
//       await _randomProductService.getRandomItems(2);
//   final items = randomItems
//       .map((item) => CustomAnalyticsEventItem.fromProduct(item))
//       .toList();
//   return {
//     'items': items,
//   };
// }

// // Function to parse a single item API response
// Future<CustomAnalyticsEventItem> parseSingleItemApiResponse() async {
//   final Product randomItem = await _randomProductService.getSingleRandomItem();
//   return CustomAnalyticsEventItem.fromProduct(randomItem);
// }
