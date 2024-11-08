import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:test_firebase_app/features/analytics/service/analytics_service.dart';
import 'package:test_firebase_app/features/analytics/utils/api_response_parser.dart';

class EventHandlerService {
  final AnalyticsService _analyticsService = AnalyticsService();
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> handleEvent(String eventName) async {
    switch (eventName) {
      case "screen_view":
        await _logScreenView();
        break;
      case "view_item_list":
        await _logViewItemList();
        break;
      case "select_item":
        await _logSelectItem();
        break;
      case "view_item":
        await _logViewItem();
        break;
      case "add_to_cart":
        await _logAddToCart();
        break;
      case "view_cart":
        await _logViewCart();
        break;
      case "remove_from_cart":
        await _logRemoveFromCart();
        break;
      case "begin_checkout":
        await _logBeginCheckout();
        break;
      case "add_shipping_info":
        await _logAddShippingInfo();
        break;
      case "add_payment_info":
        await _logAddPaymentInfo();
        break;
      case "purchase":
        await _logPurchase();
        break;
      case "journey_event":
        await _logJourneyEvent();
        break;
      case "error_event":
        await _logErrorEvent();
        break;
      default:
        await _logDefaultEvent(eventName);
    }
  }

  Future<void> _logScreenView() async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'screen_name': 'HomePage',
        'app_section': 'Landing Screen',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    print("Screen view logged to Firebase for HomePage");
  }

  Future<void> _logViewItemList() async {
    final apiResponse = parseItemListApiResponse();
    _analyticsService.logViewItemListEvent(apiResponse);
    print("logViewItemListEvent event logged to Firebase with items");
  }

  Future<void> _logSelectItem() async {
    final item = parseSingleItemApiResponse();
    _analyticsService.logSelectItemEvent(item);
    print(
        "logSelectItemEvent event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> _logViewItem() async {
    final item = parseSingleItemApiResponse();
    _analyticsService.logViewItemEvent(item);
    print(
        "logViewItemEvent event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> _logAddToCart() async {
    final item = parseSingleItemApiResponse();
    _analyticsService.logAddToCartEvent(item);
    print(
        "logAddToCartEvent event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> _logViewCart() async {
    final cartItems = parseCartApiResponse();
    _analyticsService.logViewCartEvent(cartItems);
    print("view_cart event logged to Firebase with items");
  }

  Future<void> _logRemoveFromCart() async {
    final item = parseSingleItemApiResponse();
    _analyticsService.logRemoveFromCartEvent(item);
    print(
        "remove_from_cart event logged to Firebase for item: ${item.itemName}");
  }

  Future<void> _logBeginCheckout() async {
    final cartItems = parseCartApiResponse();
    _analyticsService.logBeginCheckoutEvent(cartItems);
    print("begin_checkout event logged to Firebase with items");
  }

  Future<void> _logAddShippingInfo() async {
    final cartItems = parseCartApiResponse();
    _analyticsService.logAddShippingInfoEvent(cartItems);
    print("add_shipping_info event logged to Firebase with items");
  }

  Future<void> _logAddPaymentInfo() async {
    final cartItems = parseCartApiResponse();
    _analyticsService.logAddPaymentInfoEvent(cartItems);
    print("add_payment_info event logged to Firebase with items");
  }

  Future<void> _logPurchase() async {
    final purchaseData = parsePurchaseApiResponse();
    _analyticsService.logPurchaseEvent(purchaseData);
    print(
        "purchase event logged to Firebase with transactionId: ${purchaseData['transaction_id']}");
  }

  Future<void> _logJourneyEvent() async {
    await _analytics.logEvent(
      name: 'journey',
      parameters: {
        'journey_action': 'start',
        'journey_step': '1',
        'journey_name': 'BroadbandPurchase',
        'journey_service_name': 'BroadbandService',
        'journey_attribute1': 'plan: Full Fibre 100',
        'journey_attribute2': 'promotion: WinterSale2024',
      },
    );
    print("journey_event logged to Firebase");
  }

  Future<void> _logErrorEvent() async {
    await _analytics.logEvent(
      name: 'error_event',
      parameters: {
        'error_message': 'An error occurred',
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    print("error_event logged to Firebase");
  }

  Future<void> _logDefaultEvent(String eventName) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: {
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    print("$eventName event logged to Firebase");
  }
}
