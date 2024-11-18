import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:firebase_flutter_app/services/logger/logger_service.dart';

@lazySingleton
class GAJourneyAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  final LoggerService _loggerService;

  GAJourneyAnalyticsEvents(this._loggerService);

  Future<void> logJourneyEvent(String eventName) async {
    await _analytics.logEvent(
      name: 'journey',
      parameters: {
        'journey_action': 'start',
        'journey_step': '1',
        'journey_name': 'BroadbandPurchase',
        'journey_service_name': 'BroadbandService',
        'journey_attribute1': 'plan: Full Fibre 100',
        'journey_attribute2': 'promotion: WinterSale2024',
      },
    );
    _loggerService.logInfo(
      'Event Name: $eventName',
      eventParameters: {
        'journey_action': 'start',
        'journey_step': '1',
        'journey_name': 'BroadbandPurchase',
        'journey_service_name': 'BroadbandService',
        'journey_attribute1': 'plan: Full Fibre 100',
        'journey_attribute2': 'promotion: WinterSale2024',
      },
    );
  }
}
