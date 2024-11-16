//lib/services/event_handler_service.dart
import 'package:test_firebase_app/models/product_model.dart';
import 'package:test_firebase_app/services/firebase/index.dart';

class EventHandlerService {
  final GAEcomAnalyticsEvents _ecomAnalytics = GAEcomAnalyticsEvents();
  final GAScreenAnalyticsEvents _screenAnalytics = GAScreenAnalyticsEvents();
  final GAJourneyAnalyticsEvents _journeyAnalytics = GAJourneyAnalyticsEvents();
  final GAErrorAnalyticsEvents _errorAnalytics = GAErrorAnalyticsEvents();
  final GAUserAnalyticsEvents _userAnalytics = GAUserAnalyticsEvents();

  Future<void> handleEvent(String eventName,
      {List<Product>? products, Product? product}) async {
    switch (eventName) {
      case "screen_view":
        await _screenAnalytics.logScreenView('HomePage', 'Landing Screen');
        break;
      case "set_user_id":
        await _userAnalytics.setUserId('123456');
        break;
      case "set_user_property":
        await _userAnalytics.setUserProperty('preferred_language', 'English');
        await _userAnalytics.setUserProperty('subscription_status', 'premium');
        await _userAnalytics.setUserProperty('favorite_category', 'Technology');
        break;
      case "view_item_list":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logViewItemListEvent(products);
        } else {
          print("No products provided for view_item_list event.");
        }
        break;
      case "select_item":
        if (product != null) {
          await _ecomAnalytics.logSelectItem(product);
        } else {
          print("No product provided for select_item event.");
        }
        break;
      case "view_item":
        if (product != null) {
          await _ecomAnalytics.logViewItem(product);
        }
        break;
      case "add_to_cart":
        if (product != null) {
          await _ecomAnalytics.logAddToCart(product);
        }
        break;
      case "view_cart":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logViewCart(products);
        }
        break;
      case "remove_from_cart":
        if (product != null) {
          await _ecomAnalytics.logRemoveFromCart(product);
        }
        break;
      case "begin_checkout":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logBeginCheckout(products);
        }
        break;
      case "add_shipping_info":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logAddShippingInfo(products, "Standard");
        }
        break;
      case "add_payment_info":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logAddPaymentInfo(products, "Card Payment");
        }
        break;
      case "purchase":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logPurchase(products);
        }
        break;
      case "journey_event":
        await _journeyAnalytics.logJourneyEvent();
        break;
      case "error_event":
        await _errorAnalytics.logErrorEvent('An error occurred');
        break;
      default:
        print("Unhandled event: $eventName");
    }
  }
}
