// import '../models/product_model.dart';
// import '../features/analytics/models/firebase_item_scoped_data_model.dart';

// // Function to transform Product objects to CustomAnalyticsEventItem objects
// List<CustomAnalyticsEventItem> transformProductsToAnalyticsItems(
//     List<Product> products) {
//   return products.map((product) {
//     return CustomAnalyticsEventItem(
//       itemId: product.itemId,
//       itemName: product.itemName,
//       itemCategory: product.itemCategory,
//       itemVariant: product.itemVariant,
//       itemBrand: product.itemBrand,
//       price: product.price,
//       currency: product.currency,
//       customParameters: {
//         'imageUrl': product.imageUrl,
//         'itemLocation':
//             product.itemLocation, // Add more custom parameters if needed
//       },
//     );
//   }).toList();
// }
