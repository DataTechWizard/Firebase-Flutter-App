// lib/services/logger/logger_service_impl.dart
import 'package:firebase_flutter_app/utils/analytics_event_formatter.dart';
import 'package:logger/logger.dart';
import 'logger_service.dart';
import 'package:injectable/injectable.dart';

@Singleton(as: LoggerService)
class LoggerServiceImpl implements LoggerService {
  final Logger _logger = Logger();

  @override
  void logInfo(String message,
      {dynamic items, Map<String, dynamic>? eventParameters}) {
    _logWithItems('INFO', message, items, eventParameters);
  }

  @override
  void logWarning(String message,
      {dynamic items, Map<String, dynamic>? eventParameters}) {
    _logWithItems('WARNING', message, items, eventParameters);
  }

  @override
  void logError(String message,
      {dynamic items, Map<String, dynamic>? eventParameters}) {
    _logWithItems('ERROR', message, items, eventParameters);
  }

  void _logWithItems(String level, String message, dynamic items,
      Map<String, dynamic>? eventParameters) {
    // Handle formatting for single or multiple items
    final formattedItemDetails =
        items != null ? AnalyticsEventFormatter.formatItems(items) : 'No items';

    // Build the main log message
    final formattedMessage = '$level: $message\nItems:\n$formattedItemDetails';

    // Log parameters only if they're not duplicating item information
    final parameterDetails =
        eventParameters != null && eventParameters.isNotEmpty
            ? eventParameters.entries
                .map((e) => '  ${e.key}: ${e.value}')
                .join(',\n')
            : null;

    // Only log parameters separately if they aren't already part of item details
    _logger.i(parameterDetails != null
        ? '$formattedMessage\nEvent Parameters:\n$parameterDetails'
        : formattedMessage);
  }
}
