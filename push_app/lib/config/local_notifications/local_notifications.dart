import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications {
  static Future<void> requestPermissionLocalNotifications() async {
    final flutterLocalNotifications = FlutterLocalNotificationsPlugin();
    await flutterLocalNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationAndroid = AndroidInitializationSettings('app_icon');
    //TODO iOS

    const initializationSettings = InitializationSettings(
      android: initializationAndroid,
      //iOS:
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings
        //TODO
        // onDidReceiveBackgroundNotificationResponse:
        );
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? payload,
  }) {
    const androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        playSound: true,
        sound: RawResourceAndroidNotificationSound('notification'),
        importance: Importance.max,
        priority: Priority.high);

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      //Todo
      //iOS:
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    print("Hola?");

    flutterLocalNotificationsPlugin.show(
      id,
      title,
      body,
      notificationDetails,
      payload: payload,
    );
  }
}
