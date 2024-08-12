import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:push_app/domain/entities/push_message.dart';
import 'package:push_app/firebase_options.dart';

part 'notifications_event.dart';
part 'notifications_state.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  // print("Handling a background message: ${message.messageId}");
}

class NotificationsBloc extends Bloc<NotificationsEvent, NotificationsState> {
  FirebaseMessaging messaging = FirebaseMessaging.instance;

  static initFirebaseFCM() {
    return Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  NotificationsBloc() : super(const NotificationsState()) {
    on<NotificationStatusChanged>(_onNotificationStatusChanged);
    on<NotificationReceived>(_onPushMessageReceived);
    //Check for permissions
    _initialStatusChange();
    //Handle Notifications
    _onForegroundMessage();
  }

  void _onNotificationStatusChanged(
      NotificationStatusChanged event, Emitter<NotificationsState> emit) {
    emit(state.copyWith(status: event.status));
    _getFCMToken();
  }

  void _onPushMessageReceived(
      NotificationReceived event, Emitter<NotificationsState> emit) {
    final notifications =
        List<PushMessage>.from([event.message, ...state.notifications]);
    emit(state.copyWith(notifications: notifications));
  }

  void _initialStatusChange() async {
    final settings = await messaging.getNotificationSettings();
    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  void _getFCMToken() async {
    if (state.status == AuthorizationStatus.authorized) {
      final token = await messaging.getToken();
      print('FCM Token: $token');
    }
  }

  void handleRemoteMessage(RemoteMessage message) {
    // print('Notification: ${message.data}');
    if (message.notification == null) return;
    final notification = PushMessage(
        messageId: message.messageId?.replaceAll(':', '').replaceAll('%', ''),
        title: message.notification?.title ?? '',
        body: message.notification?.body ?? '',
        sentDate: message.sentTime ?? DateTime.now(),
        data: message.data,
        imageUrl: Platform.isAndroid
            ? message.notification?.android?.imageUrl
            : message.notification?.apple?.imageUrl);

    add(NotificationReceived(notification));

    // print('Notification: ${message.notification!.title}');
    // print('Notification: ${message.notification!.body}');
  }

  void _onForegroundMessage() {
    FirebaseMessaging.onMessage.listen(handleRemoteMessage);
  }

  void requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    add(NotificationStatusChanged(settings.authorizationStatus));
  }

  PushMessage? getMessageById(String pushMessageId) {
    final exists = state.notifications.any(
      (element) => element.messageId == pushMessageId,
    );
    if (!exists) return null;
    return state.notifications.firstWhere(
      (element) => element.messageId == pushMessageId,
    );
  }
}
