// lib/services/logger/logger_service.dart
import 'package:firebase_flutter_app/models/custom_event_item.dart';

abstract class LoggerService {
  void logInfo(String message,
      {List<CustomEventItem>? items, Map<String, dynamic>? eventParameters});
  void logWarning(String message,
      {List<CustomEventItem>? items, Map<String, dynamic>? eventParameters});
  void logError(String message,
      {List<CustomEventItem>? items, Map<String, dynamic>? eventParameters});
}
