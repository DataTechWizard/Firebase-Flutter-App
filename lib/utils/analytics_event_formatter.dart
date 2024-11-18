// lib/utils/analytics_event_formatter.dart
import 'package:firebase_flutter_app/models/custom_event_item.dart';

class AnalyticsEventFormatter {
  /// Formats [CustomEventItem] objects, either a single item or a list of items, into a string.
  static String formatItems(dynamic items) {
    // Convert single item to list for uniform handling
    List<CustomEventItem> itemList;
    if (items is CustomEventItem) {
      itemList = [items];
    } else if (items is List<CustomEventItem>) {
      itemList = items;
    } else {
      throw ArgumentError(
          'Invalid input type. Expected CustomEventItem or List<CustomEventItem>.');
    }

    // Format each item and separate by newlines
    return itemList.asMap().entries.map((entry) {
      final index = entry.key;
      final item = entry.value;
      final itemString =
          '{\n${item.toJson().entries.map((e) => '  ${e.key}: ${e.value}').join(',\n')}\n}';
      return 'item$index:\n$itemString'; // Format each item with index and indentation
    }).join('\n'); // Join all formatted strings with a newline
  }
}
