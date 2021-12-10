import 'package:firebase_analytics/firebase_analytics.dart';

class AnalyticsService {
  static FirebaseAnalytics? analytics;
  static FirebaseAnalyticsObserver? observerGlobal;

  static setAnalytics(FirebaseAnalytics _analytics) {
    analytics = _analytics;

    FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: _analytics);

    observerGlobal = observer;

    return observer;
  }

  static Future<void> registerAnalyticsEvent(String nameEvent, Map<String, dynamic> parameters) async {
    if (parameters.isNotEmpty) {
      await analytics!.logEvent(name: nameEvent, parameters: parameters);
    } else {
      await analytics!.logEvent(name: nameEvent);
    }
  }

  static Future<void> setEventLogin() async {
    await registerAnalyticsEvent("LOGGED_IN", {});
  }
}
