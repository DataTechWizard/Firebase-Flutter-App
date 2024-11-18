import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_flutter_app/services/logger/logger_service.dart';

@lazySingleton
class GAUserAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final LoggerService _loggerService;

  GAUserAnalyticsEvents(this._loggerService);

  Future<void> setUserId(String eventName, String userId) async {
    await _analytics.setUserId(id: userId);
    _loggerService.logInfo(
      'Event Name: $eventName',
      eventParameters: {'id': userId},
    );
  }

  Future<void> setUserProperty(
      String eventName, String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
    _loggerService.logInfo(
      'Event Name: $eventName',
      eventParameters: {'name': name, 'value': value},
    );
  }
}
