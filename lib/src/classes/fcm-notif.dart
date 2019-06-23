import 'package:firebase_messaging/firebase_messaging.dart';

class FCMnotif {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  FCMnotif.listen() {
    setUp();
  }

  void setUp() async {
    _firebaseMessaging.configure(
        onMessage: (Map<String, dynamic> message) async {
      print("onMessage: $message");
    }, onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
    }, onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
    });
    _firebaseMessaging.requestNotificationPermissions(
        const IosNotificationSettings(sound: true, badge: true, alert: true));
    _firebaseMessaging.onIosSettingsRegistered
        .listen((IosNotificationSettings settings) {
      print("Settings registered: $settings");
    });
    
    final String token = await _firebaseMessaging.getToken();
    print("RegistrationId $token");
  }
  /*
  to recive data on click push notification, add below data on send push notif
  click_action: FLUTTER_NOTIFICATION_CLICK
  */

}
