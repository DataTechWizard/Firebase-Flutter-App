import 'package:firebase_analytics/firebase_analytics.dart';

class GAJourneyAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logJourneyEvent() async {
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
    print("journey_event logged to Firebase");
  }
}
