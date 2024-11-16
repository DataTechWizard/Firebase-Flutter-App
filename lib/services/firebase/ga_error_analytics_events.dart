import 'package:firebase_analytics/firebase_analytics.dart';

class GAErrorAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logErrorEvent(String errorMessage) async {
    await _analytics.logEvent(
      name: 'error_event',
      parameters: {
        'error_message': errorMessage,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    print("error_event logged to Firebase");
  }
}