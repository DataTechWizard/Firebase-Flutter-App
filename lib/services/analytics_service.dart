import 'package:firebase_analytics/firebase_analytics.dart';
import '../models/product_model.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logViewItemListEvent(List<Product> products) async {
    // Convert products to AnalyticsEventItem directly, bypassing unnecessary mapping issues
    final items = products.map((product) {
      // Only include fields supported by AnalyticsEventItem
      return AnalyticsEventItem(
        itemId: product.itemId,
        itemName: product.itemName,
        itemCategory: product.itemCategory,
        itemVariant: product.itemVariant,
        itemBrand: product.itemBrand,
        price: product.price,
        currency: product.currency,
        parameters: {
          // Pass any custom fields as additional parameters
          'itemStock': product.itemStock,
          'itemLocation':
              product.itemLocation.isNotEmpty ? product.itemLocation : 'N/A',
          'itemMrc': product.itemMrc.isNotEmpty ? product.itemMrc : 'N/A',
        },
      );
    }).toList();

    // Log the event using Firebase Analytics
    FirebaseAnalytics.instance.logViewItemList(
      itemListId: "PLP_001", // Example item list ID
      itemListName: "Product List Page",
      items: items,
    );
  }

  Future<void> logSelectItemEvent(Product product) async {
    await _analytics.logEvent(
      name: 'select_item',
      parameters: {
        'item_id': product.itemId,
        'item_name': product.itemName,
        'item_category': product.itemCategory,
        'item_brand': product.itemBrand,
        'item_variant': product.itemVariant,
        'price': product.price,
        'currency': product.currency,
        'itemMrc': product.itemMrc,
      },
    );
  }
}
