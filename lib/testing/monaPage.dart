// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// //import 'package:date_time_picker/date_time_picker.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:intl/intl.dart';
// import 'package:login/testing/notificationManager.dart';
// import 'package:login/testing/scheduleList.dart';
// import 'package:timezone/timezone.dart' as tz;

// class Mydate extends StatefulWidget {
//   var now = DateTime.now();
//   // final String text;
//   // final String contacttext;
//   // final String update1;

//   // Mydate(this.text, this.contacttext, this.update1);

//   static final _androidNotificationDetails = AndroidNotificationDetails(
//     'channel id',
//     'channel name',
//     'channel description',
//     importance: Importance.max,
//     priority: Priority.high,
//   );

//   @override
//   _MydateState createState() => _MydateState();
// }

// class _MydateState extends State<Mydate> {
//   FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//   String updtTime;
//   List<String> updateLIstTime = [];

//   @override
//   initState() {
//     super.initState();
//     // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project
//     // If you have skipped STEP 3 then change app_icon to @mipmap/ic_launcher
//     var initializationSettingsAndroid =
//         new AndroidInitializationSettings('flutter_devs');
//     var initializationSettingsIOS = new IOSInitializationSettings();
//     var initializationSettings = new InitializationSettings(
//         android: initializationSettingsAndroid, iOS: initializationSettingsIOS);
//     flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: onSelectNotification);
//   }

//   // Mark:- Creating Variables
//   String contacttext;
//   //String text;
//   // String update1;
//   // String text1;
//   // DatePicker date;
//   // int val;
//   // _MydateState(this.text1, this.contacttext, this.update1);

//   DateTime now = DateTime.now();

//   final tz.TZDateTime nowTZDateTime =
//       tz.TZDateTime.now(tz.getLocation("Asia/Kolkata"));
//   bool pressed = false;
//   var scheduletext;

//   // @override
//   // void initState() {
//   //   super.initState();
//   // }

//   Future showdatetimenotification(
//       tz.TZDateTime dateTimeNoti, int id, String title, String body) async {
//     var androidChannel = AndroidNotificationDetails(
//         'channelweeklyId', 'channelweeklyName', 'channelweeklyDescription',
//         importance: Importance.max,
//         priority: Priority.high,
//         playSound: true,
//         enableLights: true);
//     var iosChannel = IOSNotificationDetails();
//     var platformchannel =
//         NotificationDetails(android: androidChannel, iOS: iosChannel);
//     //final dateTimeNoti = tz.TZDateTime.now(tz.local);
//     try {
//       await flutterLocalNotificationsPlugin.zonedSchedule(
//           id, title, body, dateTimeNoti, platformchannel,
//           androidAllowWhileIdle: true,
//           payload: 'newpayload',
//           uiLocalNotificationDateInterpretation:
//               UILocalNotificationDateInterpretation.absoluteTime);
//     } catch (ex) {
//       id = -1;
//     }
//     return id;
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<String> updatetime = [];
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(10),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               height: 80,
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(280, 0, 0, 0),
//                 child: IconButton(
//                   alignment: Alignment.topRight,
//                   icon: Icon(
//                     Icons.calendar_view_day,
//                     size: 40,
//                   ),
//                   onPressed: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => schedulelist(
//                                   updatedtimedateList: updateLIstTime,
//                                 )));
//                   },
//                 ),
//               ),
//             ),
//             Text(
//               "you can schedule notification by clicking schedule button",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 18,
//               ),
//             ),
//             SizedBox(
//               height: 40,
//             ),
//             Container(
//                 height: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: new BorderRadius.circular(10),
//                   color: Colors.blue[900],
//                 ),
//                 child: Center(
//                   child: FlatButton(
//                     onPressed: () {
//                       // _submit(widget.manager);
//                       _submit();
//                     },
//                     child: Text(
//                       'Schedule',
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.w900,
//                           fontSize: 20),
//                     ),
//                   ),
//                 ))
//           ],
//         ),
//       ),
//     );
//   }

//   void _submit() async {
//     setState(() {
//       pressed = true;
//       DatePicker.showDateTimePicker(
//         context,
//         currentTime: now,
//         locale: LocaleType.en,
//         showTitleActions: true,
//         onChanged: (now) {
//           final nativelocation = tz.getLocation('Asia/Kolkata');
//           // final location = new tz.TZDateTime.now(nativelocation);
//           tz.TZDateTime updated = tz.TZDateTime.from(now, nativelocation);
//           updateLIstTime.insert(0, updated.toString());
//           // showdatetimenotification(
//           //   updated,
//           //   1,
//           //   contacttext,
//           //   //text1,
//           // );
//          // print("updateTZDateTime = $updated");
//         },
//       );
//     });
//   }

//   Future<String> onSelectNotification(
//     String payload,
//   ) async {
//     showDialog(
//       context: context,
//       builder: (_) {
//         return new Container();
//       },
//     );
//   }
// }

import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History234 extends StatefulWidget {
  History234({Key key}) : super(key: key);

  @override
  _History234State createState() => _History234State();
}

class _History234State extends State<History234> {
  //static const String testDevice = 'MobileId';

  final textcontroller = TextEditingController();

  String tempNumber;
  //String tempMonth;
  String tempDate;

  DateTime now2 = DateTime.now();
  // final DateFormat formatter12 = DateFormat('MMMM');
  // String tempMonth = formatter12.format(date)


  List<String> item = [];
  //?List<Contact> _contacts;
  // List<dynamic> item = [];
  // String contacts;
  String month;
  int date;
  List<String> months = [];
  List<String> dates = [];
  List<String> wpIndexNo = [];
  DateTime now = DateTime.now();
  // ignore: unused_field
  var _isLoading = false;

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 3));
    print("refresh");
    setState(() {});
  }

// Check Contact permission
// ignore: unused_element
// ingonre permission whta ever u tried

  // ignore: unused_element
  Future<PermissionStatus> _getPermission() async {
    final PermissionStatus permission = await Permission.contacts.status;
    if (permission != PermissionStatus.granted &&
        permission != PermissionStatus.denied) {
      final Map<Permission, PermissionStatus> permissionStatus =
          await [Permission.contacts].request();
      return permissionStatus[Permission.contacts] ??
          PermissionStatus.undetermined;
    } else {
      return permission;
    }
  }
//   PermissionStatus permissionStatus = await _getPermission();
//     if (permissionStatus == PermissionStatus.granted) {
//       // Load without thumbnails initially.
//       var contacts =
//           (await ContactsService.getContacts(withThumbnails: false)).toList();
// //      var contacts = (await ContactsService.getContactsForPhone("8554964652"))
// //          .toList();
//       // ?print(contacts);
//       setState(() {
//         _contacts = contacts;
//       });

//       // Lazy load thumbnails after rendering initial contacts.
//        contacts.sort((a, b) => a.toString().compareTo(b.toString()));
//       for (final contact in contacts) {
//         ContactsService.getAvatar(contact).then((avatar) {
//           if (avatar == null) return; // Don't redraw if no change.
//           setState(() => contact.avatar = avatar);
//         });
//       }
//     } else {
//       _handleInvalidPermissions(permissionStatus);
//     }

  readcontacts(String enteredNumber) async {
    String finalNo;
    //print(enteredNumber);
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    try {
      for (Contact conatct in contacts) {
        String updatedConatct =
            conatct.phones.last.value.replaceAll(new RegExp(r"\s+"), "");
        if (enteredNumber == updatedConatct ||
            enteredNumber == updatedConatct) {
          print(conatct.displayName);
          finalNo = conatct.displayName;

          print(finalNo);
          return finalNo;
        }
      }
    } catch (_) {
      //throw Exception(error);
      return enteredNumber;
    }
  }

  _saveList(list, list1, dateList, monthList) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setStringList("key", list);
    prefs.setStringList("key1", list1);
    prefs.setStringList("key2", dateList);
    prefs.setStringList("key3", monthList);

    return true;
  }

  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) item = prefs.getStringList("key");
    if (prefs.getStringList("key1") != null)
      wpIndexNo = prefs.getStringList("key1");
    if (prefs.getStringList("key2") != null)
      dates = prefs.getStringList("key2");
    if (prefs.getStringList("key3") != null)
      months = prefs.getStringList("key3");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();

    setState(() {
      _isLoading = true;
    });
    _getSavedList();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // List<dynamic> item = [];
  String contactname;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                height: 70,
              ),
              Text('History',
                  style: TextStyle(
                      color: Colors.blue[900],
                      fontSize: 36,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 10,
              ),
              Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.blue[300],
                    Colors.purple[300],
                    Colors.pink[200]
                  ])),
                  padding: const EdgeInsets.all(8),
                  height: 100,
                  // color:Colors.grey,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Enter a phone number to open a chat without needing to have the contact saved",
                          textAlign: TextAlign.center,
                        ),
                        TextField(
                          autocorrect: true,
                          controller: textcontroller,
                          maxLength: 10,
                          textAlign: TextAlign.center,

                          decoration: InputDecoration(
                            hintText: ' Phone Number',
                            counterText: "",
                            suffixIcon: IconButton(
                              icon: Icon(
                                Icons.send,
                                color: Colors.black,
                              ),
                              onPressed: () async {
                                dynamic contactname =
                                    await readcontacts(textcontroller.text);
                                wpIndexNo.insert(0, textcontroller.text);
                                FlutterOpenWhatsapp.sendSingleMessage(
                                    "+91${textcontroller.text}", "hi");
                                setState(() {
                                  print(textcontroller.text);
                                  if (textcontroller.text != "") {
                                    print(textcontroller.text);
                                    item.insert(0, contactname);

                                    print(wpIndexNo);
                                    DateTime now = DateTime.now();
                                    final DateFormat formatter =
                                        DateFormat('MMMM');
                                    month = formatter.format(now);
                                    date = now.day;
                                    months.insert(0, month.toString());
                                    dates.insert(0, date.toString());

                                    _saveList(item, wpIndexNo, dates, months);
                                  } else {
                                    //? Then show a snackbar.
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                        content: Text(
                                            "phone number can not be emplty")));
                                  }
                                });
                              },
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.phone,
                          // inputFormatters: <TextInputFormatter>[
                          //   FilteringTextInputFormatter.digitsOnly
                          // ],
                        ),
                      ])),

              Expanded(
                flex: 1,
                child: RefreshIndicator(
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      scrollDirection: Axis.vertical,
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = item[index];
                        return Dismissible(
                            // Each Dismissible must contain a Key. Keys allow Flutter to
                            // uniquely identify widgets.
                            key: UniqueKey(),
                            // Provide a function that tells the app
                            // what to do after an item has been swiped away.
                            onDismissed: (DismissDirection direction) async {
                              // Remove the item from the data source.
                              setState(() {
                                item.removeAt(index);
                              });
                              SharedPreferences prefs =
                                  await SharedPreferences.getInstance();
                              prefs.remove("key");
                              prefs.remove("key1");
                              prefs.remove("key2");
                              prefs.remove("key3");
                              _saveList(item, wpIndexNo, dates, months);
                              // Then show a snackbar.
                              // Scaffold.of(context).showSnackBar(
                              //     SnackBar(content: Text("$item dismissed")));
                            },
                            // Show a red background as the item is swiped away.
                            background: Container(
                              color: Colors.red[400],
                              child: Icon(Icons.delete),
                            ),
                            child: ListTile(
                                title: Text('${item[index]}'),
                                // onLongPress: () => Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => contactpopup())),
                                trailing:
                                    Wrap(spacing: 12, // space between two icons
                                        children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(top: 15),
                                        child: Text(
                                            "${dates[index]} ${months[index]}"),
                                        // "${dates[index]} ${months[index]}"),
                                      ),
                                      IconButton(
                                        onPressed: () async {
                                          setState(() {
                                            FlutterOpenWhatsapp
                                                .sendSingleMessage(
                                                    "+91${wpIndexNo[index]}",
                                                    "hi");
                                            tempNumber = item[index];
                                            item.remove(item[index]);
                                            item.insert(0, tempNumber);
                                            // dates.insert(0, dates[index]);
                                            // months.insert(0, months[index]);
                                          });

                                          _saveList(
                                              item, wpIndexNo, dates, months);
                                        },
                                        icon: Icon(
                                          Icons.send,
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ])));
                      }),
                  onRefresh: _handleRefresh,
                ),
              )
              // )
            ])));
  }
}
