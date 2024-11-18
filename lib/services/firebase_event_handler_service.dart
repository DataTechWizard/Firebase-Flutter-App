import 'package:firebase_flutter_app/models/product_model.dart';
import 'package:firebase_flutter_app/services/firebase/index.dart';
import 'package:injectable/injectable.dart';

@injectable
class FirebaseEventHandlerService {
  final GAEcomAnalyticsEvents _ecomAnalytics;
  final GAScreenAnalyticsEvents _screenAnalytics;
  final GAJourneyAnalyticsEvents _journeyAnalytics;
  final GAErrorAnalyticsEvents _errorAnalytics;
  final GAUserAnalyticsEvents _userAnalytics;

  FirebaseEventHandlerService(
    this._ecomAnalytics,
    this._screenAnalytics,
    this._journeyAnalytics,
    this._errorAnalytics,
    this._userAnalytics,
  );

  Future<void> handleEvent(String eventName,
      {List<Product>? products, Product? product}) async {
    switch (eventName) {
      case "screen_view":
        await _screenAnalytics.logScreenView(
            eventName: eventName, 'HomePage', 'Landing Screen');
        break;
      case "set_user_id":
        await _userAnalytics.setUserId(eventName, '123456');
        break;
      case "set_user_property":
        await _userAnalytics.setUserProperty(
            eventName, 'preferred_language', 'English');
        await _userAnalytics.setUserProperty(
            eventName, 'subscription_status', 'premium');
        await _userAnalytics.setUserProperty(
            eventName, 'favorite_category', 'Technology');
        break;
      case "view_item_list":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logViewItemListEvent(products, eventName);
        } else {
          print("No products provided for view_item_list event.");
        }
        break;
      case "select_item":
        if (product != null) {
          await _ecomAnalytics.logSelectItem(product, eventName);
        } else {
          print("No product provided for select_item event.");
        }
        break;
      case "view_item":
        if (product != null) {
          await _ecomAnalytics.logViewItem(product, eventName);
        }
        break;
      case "add_to_cart":
        if (product != null) {
          await _ecomAnalytics.logAddToCart(product, eventName);
        }
        break;
      case "view_cart":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logViewCart(products, eventName);
        }
        break;
      case "remove_from_cart":
        if (product != null) {
          await _ecomAnalytics.logRemoveFromCart(product, eventName);
        }
        break;
      case "begin_checkout":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logBeginCheckout(products, eventName);
        }
        break;
      case "add_shipping_info":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logAddShippingInfo(
              products, "Standard", eventName);
        }
        break;
      case "add_payment_info":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logAddPaymentInfo(
              products, "Card Payment", eventName);
        }
        break;
      case "purchase":
        if (products != null && products.isNotEmpty) {
          await _ecomAnalytics.logPurchase(products, eventName);
        }
        break;
      case "journey_event":
        await _journeyAnalytics.logJourneyEvent(eventName);
        break;
      case "error_event":
        await _errorAnalytics.logErrorEvent('An error occurred', eventName);
        break;
      default:
        print("Unhandled event: $eventName");
    }
  }
}
