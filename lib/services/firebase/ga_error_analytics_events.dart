import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_flutter_app/services/logger/logger_service.dart';

@lazySingleton
class GAErrorAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final LoggerService _loggerService;

  GAErrorAnalyticsEvents(this._loggerService);

  Future<void> logErrorEvent(String errorMessage, String eventName) async {
    await _analytics.logEvent(
      name: 'error_event',
      parameters: {
        'error_message': errorMessage,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    _loggerService.logInfo(
      'Event Name: $eventName',
      eventParameters: {
        'error_message': errorMessage,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
}
