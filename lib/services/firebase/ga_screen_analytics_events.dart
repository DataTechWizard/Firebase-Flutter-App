import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GAScreenAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> logScreenView(String screenName, String appSection) async {
    await _analytics.logEvent(
      name: 'screen_view',
      parameters: {
        'screen_name': screenName,
        'app_section': appSection,
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
    print("Screen view logged to Firebase for $screenName");
  }
}
