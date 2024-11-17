import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_flutter_app/utils/random_transactionId.dart';
import '../../models/product_model.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GAEcomAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  // Helper method to convert Product to AnalyticsEventItem
  AnalyticsEventItem _convertToAnalyticsEventItem(Product product) {
    return AnalyticsEventItem(
      itemId: product.itemId,
      itemName: product.itemName,
      itemCategory: product.itemCategory,
      itemVariant: product.itemVariant,
      itemBrand: product.itemBrand,
      price: product.price,
      currency: product.currency,
      affiliation: product.affiliation,
      coupon: product.coupon,
      discount: product.discount,
      index: product.index,
      itemListId: product.itemListId,
      itemListName: product.itemListName,
      locationId: product.locationId,
      promotionId: product.promotionId,
      promotionName: product.promotionName,
      quantity: product.quantity,
      parameters: {
        if (product.itemStock != null) 'item_stock': product.itemStock!,
        if (product.itemLocation != null && product.itemLocation!.isNotEmpty)
          'item_location': product.itemLocation!,
        if (product.itemMrc != null && product.itemMrc!.isNotEmpty)
          'item_mrc': product.itemMrc!,
      },
    );
  }

  Future<void> logViewItemListEvent(List<Product> products) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();

    await _analytics.logViewItemList(
      itemListId: "PLP_001",
      itemListName: "Product List Page",
      items: items,
    );
  }

  Future<void> logSelectItem(Product product) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logSelectItem(
      items: [item],
    );
  }

  Future<void> logViewItem(Product product) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logViewItem(
      items: [item],
    );
  }

  Future<void> logAddToCart(Product product) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logAddToCart(
      items: [item],
    );
  }

  Future<void> logRemoveFromCart(Product product) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logRemoveFromCart(
      items: [item],
    );
  }

  Future<void> logViewCart(List<Product> products) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    final totalValue = items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price ?? 0.0) * (item.quantity ?? 1),
    );

    await _analytics.logViewCart(
      currency: items.isNotEmpty ? items.first.currency : 'USD',
      value: totalValue,
      items: items,
    );
  }

  Future<void> logBeginCheckout(List<Product> products) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    final totalValue = items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price ?? 0.0) * (item.quantity ?? 1),
    );

    await _analytics.logBeginCheckout(
      currency: items.isNotEmpty ? items.first.currency : 'USD',
      value: totalValue,
      items: items,
    );
  }

  Future<void> logAddShippingInfo(
      List<Product> products, String shippingTier) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    final totalValue = items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price ?? 0.0) * (item.quantity ?? 1),
    );

    await _analytics.logAddShippingInfo(
      currency: items.isNotEmpty ? items.first.currency : 'USD',
      value: totalValue,
      shippingTier: shippingTier,
      items: items,
    );
  }

  Future<void> logAddPaymentInfo(
      List<Product> products, String paymentType) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    final totalValue = items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price ?? 0.0) * (item.quantity ?? 1),
    );

    await _analytics.logAddPaymentInfo(
      currency: items.isNotEmpty ? items.first.currency : 'USD',
      value: totalValue,
      paymentType: paymentType,
      items: items,
    );
  }

  Future<void> logPurchase(List<Product> products,
      {double? tax, double? shipping}) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    final totalValue = items.fold<double>(
      0.0,
      (sum, item) => sum + (item.price ?? 0.0) * (item.quantity ?? 1),
    );
    final String transactionId = generateRandomTransactionId();
    await _analytics.logPurchase(
      transactionId: transactionId,
      value: totalValue,
      currency: items.isNotEmpty ? items.first.currency : 'USD',
      tax: tax,
      shipping: shipping,
      items: items,
    );
  }
}
