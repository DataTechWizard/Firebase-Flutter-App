import 'package:flutter/material.dart';
import '../../services/event_handler_service.dart';

class EventButtonsWidget extends StatefulWidget {
  const EventButtonsWidget({super.key});

  @override
  State<EventButtonsWidget> createState() => _EventButtonsWidgetState();
}

class _EventButtonsWidgetState extends State<EventButtonsWidget> {
  final EventHandlerService _eventHandlerService = EventHandlerService();

  // Using async to await event handling completion if necessary
  Future<void> _onButtonPressed(String eventName) async {
    await _eventHandlerService.handleEvent(eventName);
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