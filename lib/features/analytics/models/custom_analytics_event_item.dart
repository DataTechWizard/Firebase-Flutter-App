// import 'package:firebase_analytics/firebase_analytics.dart';
// import '../../../models/product_model.dart'; // Adjust the path as necessary to import Product

// class CustomAnalyticsEventItem {
//   final AnalyticsEventItem baseEventItem;
//   final Map<String, Object> customParameters;

//   CustomAnalyticsEventItem({
//     required this.baseEventItem,
//     this.customParameters = const {}, // Default to an empty map if not provided
//   });

//   // Method to convert to a Map for serialization or use in logging events
//   Map<String, dynamic> toMap() {
//     return {
//       'item_id': baseEventItem.itemId,
//       'item_name': baseEventItem.itemName,
//       'item_category': baseEventItem.itemCategory,
//       'item_category2': baseEventItem.itemCategory2,
//       'item_category3': baseEventItem.itemCategory3,
//       'item_category4': baseEventItem.itemCategory4,
//       'item_category5': baseEventItem.itemCategory5,
//       'item_brand': baseEventItem.itemBrand,
//       'item_variant': baseEventItem.itemVariant,
//       'item_list_id': baseEventItem.itemListId,
//       'item_list_name': baseEventItem.itemListName,
//       'affiliation': baseEventItem.affiliation,
//       'price': baseEventItem.price,
//       'currency': baseEventItem.currency,
//       'quantity': baseEventItem.quantity,
//       'coupon': baseEventItem.coupon,
//       'discount': baseEventItem.discount,
//       'promotion_id': baseEventItem.promotionId,
//       'promotion_name': baseEventItem.promotionName,
//       'creative_name': baseEventItem.creativeName,
//       'creative_slot': baseEventItem.creativeSlot,
//       'index': baseEventItem.index,
//       'location_id': baseEventItem.locationId,
//       ...customParameters,
//     }..removeWhere((key, value) => value == null); // Remove null values
//   }

//   // Factory constructor to create an instance from a Product
//   factory CustomAnalyticsEventItem.fromProduct(Product product) {
//     final baseEventItem = AnalyticsEventItem(
//       itemId: product.itemId,
//       itemName: product.itemName,
//       itemCategory: product.itemCategory,
//       itemVariant: product.itemVariant,
//       itemBrand: product.itemBrand,
//       price: product.price,
//       currency: product.currency,
//     );

//     return CustomAnalyticsEventItem(
//       baseEventItem: baseEventItem,
//       customParameters: {
//         'item_stock': product.itemStock,
//         'item_location': product.itemLocation,
//         'item_plan_length': product.itemPlanLength,
//         'is_5g_capable': product.is5GCapable,
//         'release_year': product.releaseYear,
//         'colour': product.colour,
//         'dimensions': product.dimensions,
//         'weight': product.weight,
//       },
//     );
//   }
// }
