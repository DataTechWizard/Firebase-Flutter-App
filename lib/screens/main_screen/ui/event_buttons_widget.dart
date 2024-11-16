import 'package:flutter/material.dart';
import '../../../services/event_handler_service.dart';
import 'package:test_firebase_app/screens/plp/ui/product_list_page.dart'; // Import ProductListPage
//import '../../../models/product_model.dart';
import '../../../utils/random_product_service.dart'; // Import RandomProductService

class EventButtonsWidget extends StatefulWidget {
  const EventButtonsWidget({super.key});

  @override
  State<EventButtonsWidget> createState() => _EventButtonsWidgetState();
}

class _EventButtonsWidgetState extends State<EventButtonsWidget> {
  final EventHandlerService _eventHandlerService =
      EventHandlerService(); // General event handler
  final RandomProductService _randomProductService =
      RandomProductService(); // Use RandomProductService

  // Async button handler for analytics events
  Future<void> _onButtonPressed(String eventName) async {
    if (eventName == "view_item_list") {
      // Navigate to ProductListPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductListPage(),
        ),
      );
    } else if (eventName == "select_item" ||
        eventName == "view_item" ||
        eventName == "add_to_cart" ||
        eventName == "remove_from_cart" ||
        eventName == "view_cart" ||
        eventName == "begin_checkout" ||
        eventName == "add_shipping_info" ||
        eventName == "add_payment_info" ||
        eventName == "purchase") {
      // Fetch 3 random products
      try {
        final products = await _randomProductService.getRandomItems(3);
        if (products.isNotEmpty) {
          final firstProduct =
              products.first; // Example product for single-item events
          switch (eventName) {
            case "select_item":
              await _eventHandlerService.handleEvent(eventName,
                  product: firstProduct);
              break;
            case "view_item":
              await _eventHandlerService.handleEvent(eventName,
                  product: firstProduct);
              break;
            case "add_to_cart":
              await _eventHandlerService.handleEvent(eventName,
                  product: firstProduct);
              break;
            case "remove_from_cart":
              await _eventHandlerService.handleEvent(eventName,
                  product: firstProduct);
              break;
            case "view_cart":
              await _eventHandlerService.handleEvent(eventName,
                  products: products);
              break;
            case "begin_checkout":
              await _eventHandlerService.handleEvent(eventName,
                  products: products);
              break;
            case "add_shipping_info":
              await _eventHandlerService.handleEvent(eventName,
                  products: products);
              break;
            case "add_payment_info":
              await _eventHandlerService.handleEvent(eventName,
                  products: products);
              break;
            case "purchase":
              await _eventHandlerService.handleEvent(eventName,
                  products: products);
              break;
            default:
              print("Unhandled e-commerce event: $eventName");
          }
        } else {
          print("No products available for the event: $eventName");
        }
      } catch (e) {
        print("Error fetching products for event $eventName: $e");
      }
    } else {
      // Handle non-e-commerce events using the general event handler
      await _eventHandlerService.handleEvent(eventName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: [
          ElevatedButton(
            onPressed: () => _onButtonPressed("screen_view"),
            child: const Text("screen_view"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("set_user_id"),
            child: const Text("set_user_id"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("set_user_property"),
            child: const Text("set_user_property"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("view_item_list"),
            child: const Text("view_item_list"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("select_item"),
            child: const Text("select_item"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("view_item"),
            child: const Text("view_item"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("add_to_cart"),
            child: const Text("add_to_cart"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("view_cart"),
            child: const Text("view_cart"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("remove_from_cart"),
            child: const Text("remove_from_cart"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("begin_checkout"),
            child: const Text("begin_checkout"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("add_shipping_info"),
            child: const Text("add_shipping_info"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("add_payment_info"),
            child: const Text("add_payment_info"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("purchase"),
            child: const Text("purchase"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("journey_event"),
            child: const Text("journey_event"),
          ),
          ElevatedButton(
            onPressed: () => _onButtonPressed("error_event"),
            child: const Text("error_event"),
          ),
        ],
      ),
    );
  }
}
