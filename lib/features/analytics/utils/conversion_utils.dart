// File: lib/features/analytics/utils/conversion_utils.dart
import 'package:firebase_analytics/firebase_analytics.dart';
import '../models/AnalyticsEventItems_model.dart';

// Example utility function for additional transformations if needed
List<AnalyticsEventItem> convertToAnalyticsEventItems(
    List<CustomAnalyticsEventItem> customItems) {
  return customItems.map((item) => item).toList();
}
