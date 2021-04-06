import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class NotificationManager {
  var flutterLocalNotificationsPlugin;
  final fltrNotification = FlutterLocalNotificationsPlugin();
  var now = DateTime.now();

  NotificationManager() {
    // flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    // initNotifications();
  }

  // ignore: unused_field
  static final _androidNotificationDetails = AndroidNotificationDetails(
    'channel id',
    'channel name',
    'channel description',
    importance: Importance.max,
    priority: Priority.high,
  );
  getNotificationInstance() {
    return flutterLocalNotificationsPlugin;
  }

  // void initNotifications() {
  //   // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
  //   var initializationSettingsAndroid =
  //       new AndroidInitializationSettings('noti');
  //   var initializationSettingsIOS = IOSInitializationSettings(
  //       onDidReceiveLocalNotification: onDidReceiveLocalNotification);

  //   var initializationSettings = InitializationSettings(
  //       android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

  //   flutterLocalNotificationsPlugin.initialize(initializationSettings,
  //       onSelectNotification: onSelectNotification);
  // }

  getPlatformChannelSpecfics() {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max,
        priority: Priority.high,
        ticker: 'Medicine Reminder');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);

    return platformChannelSpecifics;
  }

  // Future<dynamic> onSelectNotification(String payload) async {
  //   print('Notification clicked');
  //   return Future.value(0);
  // }

  // Future onDidReceiveLocalNotification(
  //     int id, String title, String body, String payload) async {
  //   return Future.value(1);
  // }

  void removeReminder(int notificationId) {
    flutterLocalNotificationsPlugin.cancel(notificationId);
  }

  Future showDailyNotification(
      tz.TZDateTime dateTimeNoti, int id, String title, String body) async {
    var androidChannel = AndroidNotificationDetails(
        'channelweeklyId', 'channelweeklyName', 'channelweeklyDescription',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        timeoutAfter: 5000,
        enableLights: true);
    var iosChannel = IOSNotificationDetails();
    var platformchannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);

    try {
      await fltrNotification.zonedSchedule(
          id, title, body, dateTimeNoti, platformchannel,
          androidAllowWhileIdle: true,
          //payload: 'newpayload',
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      //print("${DateTimeComponents.dayOfWeekAndTime}");
    } catch (ex) {
      id = -1;
    }
    return id;
  }

  Future showWeaklyNotification(
      int id, String title, String body, Day day, Time now) async {
    var androidChannel = AndroidNotificationDetails(
        'channelweeklyId', 'channelweeklyName', 'channelweeklyDescription',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        timeoutAfter: 5000,
        enableLights: true);
    var iosChannel = IOSNotificationDetails();
    var platformchannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);

    try {
      await fltrNotification.showWeeklyAtDayAndTime(
          id, title, body, day, now, platformchannel);
      //print("${DateTimeComponents.dayOfWeekAndTime}");
    } catch (ex) {
      id = -1;
    }
    return id;
  }

  Future showMonthlyNotification(
      tz.TZDateTime dateTimeNoti, int id, String title, String body) async {
    var androidChannel = AndroidNotificationDetails(
        'channelweeklyId', 'channelweeklyName', 'channelweeklyDescription',
        importance: Importance.max,
        priority: Priority.high,
        playSound: true,
        enableVibration: true,
        timeoutAfter: 5000,
        enableLights: true);
    var iosChannel = IOSNotificationDetails();
    var platformchannel =
        NotificationDetails(android: androidChannel, iOS: iosChannel);

    try {
      await fltrNotification.zonedSchedule(
          id, title, body, dateTimeNoti, platformchannel,
          androidAllowWhileIdle: true,
          payload: 'newpayload',
          matchDateTimeComponents: DateTimeComponents.dayOfWeekAndTime,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime);
      //print("${DateTimeComponents.dayOfWeekAndTime}");
    } catch (ex) {
      id = -1;
    }
    return id;
  }
}
