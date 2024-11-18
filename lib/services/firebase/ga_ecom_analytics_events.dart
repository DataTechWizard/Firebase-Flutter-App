import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_flutter_app/models/custom_event_item.dart';
import 'package:firebase_flutter_app/utils/random_transactionId.dart';
import '../../models/product_model.dart';
import 'package:firebase_flutter_app/services/logger/logger_service.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GAEcomAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final LoggerService _loggerService;

  GAEcomAnalyticsEvents(this._loggerService);

  // Helper method to convert Product to AnalyticsEventItem
  CustomEventItem _convertToAnalyticsEventItem(Product product) {
    return CustomEventItem(
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

  Future<void> logViewItemListEvent(
      List<Product> products, String eventName) async {
    final items = products.map(_convertToAnalyticsEventItem).toList();
    const itemListId = "PLP_001";
    const itemListName = "Product List Page";

    await _analytics.logViewItemList(
      itemListId: itemListId,
      itemListName: itemListName,
      items: items,
    );
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {
        'itemListId': itemListId,
        'itemListName': itemListName,
      },
    );
  }

  Future<void> logSelectItem(Product product, String eventName) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logSelectItem(
      items: [item],
    );

    _loggerService.logInfo(
      'Event Name: $eventName',
      items: [item],
      eventParameters: {},
    );
  }

  Future<void> logViewItem(Product product, String eventName) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logViewItem(
      items: [item],
    );
    _loggerService.logInfo(
      'Select Event: $eventName',
      items: [item],
      eventParameters: {},
    );
  }

  Future<void> logAddToCart(Product product, String eventName) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logAddToCart(
      items: [item],
    );
    _loggerService.logInfo(
      'Select Event: $eventName',
      items: [item],
      eventParameters: {},
    );
  }

  Future<void> logRemoveFromCart(Product product, String eventName) async {
    final item = _convertToAnalyticsEventItem(product);

    await _analytics.logRemoveFromCart(
      items: [item],
    );
    _loggerService.logInfo(
      'Select Event: $eventName',
      items: [item],
      eventParameters: {},
    );
  }

  Future<void> logViewCart(List<Product> products, String eventName) async {
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

    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {'value': totalValue},
    );
  }

  Future<void> logBeginCheckout(
      List<Product> products, String eventName) async {
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
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {'value': totalValue},
    );
  }

  Future<void> logAddShippingInfo(
      List<Product> products, String shippingTier, String eventName) async {
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
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {'value': totalValue},
    );
  }

  Future<void> logAddPaymentInfo(
      List<Product> products, String paymentType, String eventName) async {
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
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {'value': totalValue, 'paymentType': paymentType},
    );
  }

  Future<void> logPurchase(List<Product> products, String eventName,
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
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: items,
      eventParameters: {
        'value': totalValue,
        'tax': tax,
        'shipping': shipping,
      },
    );
  }
}
