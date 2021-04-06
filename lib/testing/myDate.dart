// import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:login/Screens/logInScreen.dart';
// import 'package:login/testing/blanknote.dart';
// import 'package:login/testing/notificationManager.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// //import 'package:intl/intl.dart';

// class Mydate extends StatefulWidget {
//   final NotificationManager manager;
//   final String text;
//   Mydate(this.manager, this.text);
//   @override
//   _MydateState createState() => _MydateState(this.manager, this.text);
// }

// class _MydateState extends State<Mydate> {
//   // Mark:- Creating Variables

//   final GlobalKey<NavigatorState> navigatorKey =
//       GlobalKey(debugLabel: "Main Navigator");

//   //String text;
//   NotificationManager manager1;
//   String text1;
//   DatePicker date;
//   final flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

//   @override
//   void initState() {
//     super.initState();
//     initNotifications();
//   }

//   _MydateState(this.manager1, this.text1);
//   FlutterLocalNotificationsPlugin fltrNotification;
//   DateTime now = DateTime.now();
//   final tz.TZDateTime nowTZDateTime =
//       tz.TZDateTime.now(tz.getLocation("Asia/Kolkata"));
//   bool pressed = false;
//   bool hidden = false;

//   Widget sheduledText(bool hide, String hour, String minute, String sec) {
//     if (hide) {
//       return Text("Sheduled at $hour $minute $sec",
//           style: TextStyle(
//               color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold));
//     } else {
//       return Container();
//     }
//   }

//   void initNotifications() {
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     var initializationSettingsAndroid =
//         new AndroidInitializationSettings('noti');
//     var initializationSettingsIOS = IOSInitializationSettings(
//         onDidReceiveLocalNotification: onDidReceiveLocalNotification);

//     var initializationSettings = InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);

//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }

//   // Future<void> onSelectNotification(String payload) async {
//   //   BuildContext context;
//   //   Scaffold.of(context).showSnackBar(new SnackBar(content: Text("Noti CLicked")));
//   //   print('Notification clicked');
//   //   return Future.value(0);
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(10),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             sheduledText(hidden, "", "", ""),
//             SizedBox(
//               height: 20,
//             ),
//             Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 borderRadius: new BorderRadius.circular(10),
//                 color: Colors.blue,
//               ),
//               child: FlatButton(
//                 onPressed: () {
//                   _submit(widget.manager);
//                 },
//                 child: Text(
//                   'Schedule',
//                   style: TextStyle(
//                       color: Colors.white, fontWeight: FontWeight.w900),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> onSelectNotification(String payload) async {
//     Navigator.push(
//         context, MaterialPageRoute(builder: (context) => blanknote()));
//     print('Notification clicked');
//     return Future.value(0);
//   }

//   void _submit(NotificationManager manager) async {
//     setState(() {
//       pressed = true;
//       hidden = true;
//       DatePicker.showDateTimePicker(
//         context,
//         currentTime: now,
//         locale: LocaleType.en,
//         showTitleActions: true,
//         onChanged: (now) {
//           final nativelocation = tz.getLocation('Asia/Kolkata');
//           tz.TZDateTime getNow = tz.TZDateTime.from(now, nativelocation);
//           // Day day = Day(now.day);
//           // Time now1 = Time(now.hour,now.minute,now.second);
//           manager.showDailyNotification(getNow, 1, "hi", text1);
//           //manager.showWeaklyNotification(1, "title", "body", day, now1);
//           setState(() {
//             sheduledText(
//                 true, "${getNow.hour}", "${getNow.minute}", "${getNow.second}");
//           });
//         },
//       );
//     });
//   }

//   Future notificationSelected(String payload) async {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         content: Text("Notification Clicked $payload"),
//       ),
//     );
//   }

//   Future onDidReceiveLocalNotification(
//       int id, String title, String body, String payload) async {
//     return Future.value(1);
//   }
// }
