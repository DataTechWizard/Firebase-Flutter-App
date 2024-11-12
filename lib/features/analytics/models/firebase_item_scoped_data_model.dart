// File: lib/features/analytics/models/custom_analytics_event_item.dart
import 'package:firebase_analytics/firebase_analytics.dart';

class CustomAnalyticsEventItem extends AnalyticsEventItem {
  final Map<String, Object> customParameters;

  CustomAnalyticsEventItem({
    // Required fields
    required super.itemId, // Unique identifier for the item
    required super.itemName, // Name of the item

    // Optional fields (inherited from AnalyticsEventItem)
    super.itemCategory, // Category of the item
    super.itemCategory2, // Secondary category
    super.itemCategory3, // Tertiary category
    super.itemCategory4, // Fourth-level category
    super.itemCategory5, // Fifth-level category
    super.itemBrand, // Brand of the item
    super.itemVariant, // Variant of the item
    super.itemListId, // ID of the item list
    super.itemListName, // Name of the item list
    super.affiliation, // Affiliation or store name
    super.price, // Price of the item
    super.currency, // Currency of the price
    super.quantity, // Quantity of the item
    super.coupon, // Coupon code applied
    super.discount, // Discount applied
    super.promotionId, // Promotion ID
    super.promotionName, // Promotion name
    super.creativeName, // Name of the creative
    super.creativeSlot, // Slot of the creative
    super.index, // Index of the item in a list
    super.locationId, // Location ID

    // Optional parameters for custom fields
    Map<String, Object>? parameters, // Additional parameters
    this.customParameters = const {}, // Default to empty map if not provided
  }) : super(
          parameters: {
            ...?parameters, // Include base parameters if provided
            ...customParameters, // Merge custom parameters with existing ones
          },
        );

  // Convert to a Map for serialization or use in logging events
  Map<String, dynamic> toMap() {
    return {
      'item_id': itemId,
      'item_name': itemName,
      'item_category': itemCategory,
      'item_category2': itemCategory2,
      'item_category3': itemCategory3,
      'item_category4': itemCategory4,
      'item_category5': itemCategory5,
      'item_brand': itemBrand,
      'item_variant': itemVariant,
      'item_list_id': itemListId,
      'item_list_name': itemListName,
      'affiliation': affiliation,
      'price': price,
      'currency': currency,
      'quantity': quantity,
      'coupon': coupon,
      'discount': discount,
      'promotion_id': promotionId,
      'promotion_name': promotionName,
      'creative_name': creativeName,
      'creative_slot': creativeSlot,
      'index': index,
      'location_id': locationId,
      // Include custom parameters (ensuring supported types)
      ...customParameters,
    }..removeWhere((key, value) => value == null); // Remove null values
  }

  // Factory constructor to create an instance from JSON
  factory CustomAnalyticsEventItem.fromJson(Map<String, dynamic> json) {
    // Extract known parameters (those supported by the base class)
    final extractedKnownParameters = {
      'affiliation': json['affiliation'],
      'currency': json['currency'],
      'coupon': json['coupon'],
      'creativeName': json['creativeName'],
      'creativeSlot': json['creativeSlot'],
      'discount': json['discount'],
      'index': json['index'],
      'itemBrand': json['itemBrand'],
      'itemCategory': json['itemCategory'],
      'itemCategory2': json['itemCategory2'],
      'itemCategory3': json['itemCategory3'],
      'itemCategory4': json['itemCategory4'],
      'itemCategory5': json['itemCategory5'],
      'itemId': json['itemId'],
      'itemListId': json['itemListId'],
      'itemListName': json['itemListName'],
      'itemName': json['itemName'],
      'itemVariant': json['itemVariant'],
      'locationId': json['locationId'],
      'price': (json['price'] as num?)?.toDouble(), // Ensure double conversion
      'promotionId': json['promotionId'],
      'promotionName': json['promotionName'],
      'quantity': json['quantity'],
    }..removeWhere((key, value) => value == null); // Remove null values

    // Extract remaining fields as custom parameters
    final customParameters = Map<String, Object>.from(json)
      ..removeWhere((key, value) => extractedKnownParameters.containsKey(key));

    // Return the constructed instance
    return CustomAnalyticsEventItem(
      itemId: json['itemId'],
      itemName: json['itemName'],
      itemCategory: json['itemCategory'],
      itemVariant: json['itemVariant'],
      itemBrand: json['itemBrand'],
      price: (json['price'] as num?)?.toDouble(),
      currency: json['currency'],
      customParameters: customParameters,
    );
  }
}
