import 'package:firebase_analytics/firebase_analytics.dart';
import '../models/AnalyticsEventItems_model.dart';

class AnalyticsService {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logViewItemListEvent(Map<String, dynamic> apiResponse) async {
    final List<CustomAnalyticsEventItem> items = apiResponse['items'];
    final String itemListId = apiResponse['itemListId'];
    final String itemListName = apiResponse['itemListName'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logViewItemList(
      itemListId: itemListId,
      itemListName: itemListName,
      items: analyticsItems,
    );
    // print(
    //     "view_item_list event logged with itemListId: $itemListId and itemListName: $itemListName");
  }

  Future<void> logSelectItemEvent(CustomAnalyticsEventItem item) async {
    // Log a single view_item event
    await _analytics.logSelectItem(
      items: [item],
    );
    // print("view_item event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> logViewItemEvent(CustomAnalyticsEventItem item) async {
    // Log a single view_item event
    await _analytics.logViewItem(
      items: [item],
    );
    // print("view_item event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> logAddToCartEvent(CustomAnalyticsEventItem item) async {
    // Log a single view_item event
    await _analytics.logAddToCart(
      items: [item],
    );
    // print("view_item event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> logRemoveFromCartEvent(CustomAnalyticsEventItem item) async {
    // Log a single view_item event
    await _analytics.logRemoveFromCart(
      items: [item],
    );
    // print("view_item event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> logViewCartEvent(Map<String, dynamic> apiResponse) async {
    final List<CustomAnalyticsEventItem> items = apiResponse['items'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logViewCart(
      currency: "USD", // Use a default or dynamic currency
      value: analyticsItems.fold(
          0.0,
          (sum, item) =>
              (sum ?? 0) + (item.price ?? 0.0)), // Sum of item prices
      items: analyticsItems,
    );
    // print("view_cart event logged with ${items.length} items");
  }

  Future<void> logBeginCheckoutEvent(Map<String, dynamic> apiResponse) async {
    final List<CustomAnalyticsEventItem> items = apiResponse['items'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logBeginCheckout(
      currency: "USD", // Use a default or dynamic currency
      value: analyticsItems.fold(
          0.0,
          (sum, item) =>
              (sum ?? 0) + (item.price ?? 0.0)), // Sum of item prices
      items: analyticsItems,
    );
    // print("begin_checkout event logged with ${items.length} items");
  }

  Future<void> logAddShippingInfoEvent(Map<String, dynamic> apiResponse) async {
    final List<CustomAnalyticsEventItem> items = apiResponse['items'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logAddShippingInfo(
      currency: "USD", // Use a default or dynamic currency
      value: analyticsItems.fold(
          0.0,
          (sum, item) =>
              (sum ?? 0) + (item.price ?? 0.0)), // Sum of item prices
      shippingTier: "Ground", // Example shipping tier
      items: analyticsItems,
    );
    // print("add_shipping_info event logged with ${items.length} items");
  }

  Future<void> logAddPaymentInfoEvent(Map<String, dynamic> apiResponse) async {
    final List<CustomAnalyticsEventItem> items = apiResponse['items'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logAddPaymentInfo(
      currency: "USD", // Use a default or dynamic currency
      value: analyticsItems.fold(
          0.0,
          (sum, item) =>
              (sum ?? 0) + (item.price ?? 0.0)), // Sum of item prices
      paymentType: "Credit Card", // Example payment type
      items: analyticsItems,
    );
    // print("add_payment_info event logged with ${items.length} items");
  }

  Future<void> logPurchaseEvent(Map<String, dynamic> purchaseData) async {
    final String transactionId = purchaseData['transaction_id'];
    final List<CustomAnalyticsEventItem> items = purchaseData['items'];

    // Convert CustomAnalyticsEventItem to AnalyticsEventItem for logging
    final List<AnalyticsEventItem> analyticsItems =
        items.map((item) => item).toList();

    await _analytics.logPurchase(
      transactionId: transactionId,
      value: analyticsItems.fold(
          0.0,
          (sum, item) =>
              (sum ?? 0) + (item.price ?? 0.0)), // Sum of item prices
      currency: "USD", // Use default or dynamic currency
      items: analyticsItems,
    );
    // print(
    //     "purchase event logged with transactionId: $transactionId and ${items.length} items");
  }
}
