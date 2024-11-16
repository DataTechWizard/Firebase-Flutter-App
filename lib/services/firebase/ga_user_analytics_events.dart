import 'package:firebase_analytics/firebase_analytics.dart';

class GAUserAnalyticsEvents {
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  Future<void> setUserId(String userId) async {
    await _analytics.setUserId(id: userId);
    print("User ID set to $userId");
  }

  Future<void> setUserProperty(String name, String value) async {
    await _analytics.setUserProperty(name: name, value: value);
  }
}
