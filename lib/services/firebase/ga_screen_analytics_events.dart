import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_flutter_app/services/logger/logger_service.dart';

@lazySingleton
class GAScreenAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final LoggerService _loggerService;

  GAScreenAnalyticsEvents(this._loggerService);

  Future<void> logScreenView(String screenName, String appSection,
      {required String eventName}) async {
    await _analytics.logEvent(
      name: eventName,
      parameters: {
        'screen_name': screenName,
        'app_section': appSection,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    _loggerService.logInfo(
      'Event Name: $eventName',
      items: [],
      eventParameters: {
        'screen_name': screenName,
        'app_section': appSection,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }
}
