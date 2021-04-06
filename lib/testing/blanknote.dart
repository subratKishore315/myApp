import 'dart:async';
import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
//import 'package:easy_contact_picker/easy_contact_picker.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';
//!import 'package:shared_preferences/shared_preferences.dart';
//import 'package:contacts_service/contacts_service.dart';

class History extends StatefulWidget {
  History({Key key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  final textcontroller = TextEditingController();
  final msgcontroller = TextEditingController();
  //final MethodChannel _channel ;

  List<String> item = [];
  String month;
  int date;
  List<dynamic> months = [];
  List<dynamic> dates = [];
  DateTime now = DateTime.now();
  // ignore: unused_field
  bool _isloading = false;
  //List<Contact> _contact;

  // Check Contact permission
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

  readcontacts(String enteredNUmber) async {
    // ignore: unused_local_variable
    String finalNo;
    String addNo = "+91" + enteredNUmber;
    print(enteredNUmber);
    final Iterable<Contact> contacts = await ContactsService.getContacts();
    //  print();
    try {
      for (Contact conatct in contacts) {
        // print(conatct.phones);
        // ignore: unnecessary_brace_in_string_interps
        if (enteredNUmber == conatct.phones.last.value ||
            addNo == conatct.phones.last.value ||
            addNo == conatct.phones.first.value ||
            enteredNUmber == conatct.phones.first.value) {
          print(conatct.displayName);
          finalNo = conatct.displayName;
          print(finalNo);
          return finalNo;
        }
      }
    } catch (_) {
      return enteredNUmber;
    }
  }

  // //! ignore: unused_element
  _saveList(list) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("key", list);
    return true;
  }

  // // ignore: unused_element
  _getSavedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getStringList("key") != null) {
      return item.length;
    } else
      item = prefs.getStringList("key");

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _isloading = true;
    });
    _getSavedList();

    setState(() {
      _isloading = false;
    });
  }

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
                height: 20,
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
                height: 200,
                // color:Colors.grey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Enter a phone number to open a chat without needing to have the contact saved",
                        style: TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.normal),
                        textAlign: TextAlign.center,
                      ),
                      TextField(
                        autocorrect: true,
                        controller: textcontroller,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          hintText: ' Phone Number',
                          suffixIcon: IconButton(
                            icon: Icon(
                              Icons.send,
                              color: Colors.black,
                            ),
                            onPressed: () async {
                              print(textcontroller.text);
                                  
                              dynamic contactname =
                                  await readcontacts(textcontroller.text);
                              DateTime now = DateTime.now();
                              final DateFormat formatter = DateFormat('MMMM');
                              month = formatter.format(now);
                              date = now.day;
                              setState(() {
                                FlutterOpenWhatsapp.sendSingleMessage(
                                  "+91${textcontroller.text}", "hi");
                                item.insert(0, contactname);
                                print(item);
                                months.insert(0, month);
                                dates.insert(0, date);
                                _saveList(item);
                              });
                          
                            },
                          ),
                          border: InputBorder.none,
                        ),
                        keyboardType: TextInputType.text,
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly
                        ],
                      ),
                    ]),
              ),
              Expanded(
                child: Container(
                  color: Colors.greenAccent[100],
                  child: ListView.separated(
                      separatorBuilder: (BuildContext context, int index) =>
                          Divider(),
                      itemCount: item.length,
                      itemBuilder: (BuildContext context, int index) {
                        final items = item[index];
                        return Dismissible(
                            key: Key(items),
                            onDismissed: (direction) {
                              // Remove the item from the data source.
                              setState(() {
                                item.removeAt(index);
                              });

                              // Then show a snackbar.
                              Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text("${item[index]} dismissed")));
                            },
                            background: Container(
                              color: Colors.red[400],
                              child: Icon(Icons.delete),
                            ),
                            child: ListTile(
                              title: Text('${item[index]}'),
                              trailing: Wrap(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 15),
                                    // ignore: unnecessary_brace_in_string_interps
                                    child: Text(
                                        "${dates[index]}  ${months[index]}"),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      FlutterOpenWhatsapp.sendSingleMessage(
                                          "+91${item[index]}", "hi");
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }),
                ),
              )
            ])));
  }
}

// class wpMgSend1 extends StatefulWidget {
//   wpMgSend1({Key key}) : super(key: key);

//   @override
//   _wpMgSend1State createState() => _wpMgSend1State();
// }

// // ignore: camel_case_types
// class _wpMgSend1State extends State<wpMgSend1> {
//   TextEditingController numberController = TextEditingController();
//   List<dynamic> item = [];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text("History"),
//       ),
//       body: Column(
//         children: [
//           Container(
//               height: MediaQuery.of(context).size.height / 4.5,
//               width: MediaQuery.of(context).size.width,
//               decoration: BoxDecoration(
//                   gradient: LinearGradient(colors: [
//                 Colors.blue,
//                 Colors.red,
//                 Colors.green,
//                 Colors.yellow
//               ])),
//               child: Column(
//                 children: [
//                   Text("Enter a phone number to open a chat in WhatsApp",
//                       style: TextStyle(
//                           fontSize: 30.0, fontWeight: FontWeight.bold)),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     style:
//                         TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
//                     maxLength: 10,
//                     keyboardType: TextInputType.number,
//                     controller: numberController,
//                     onTap: () {
//                       numberController.clear();
//                     },
//                   ),
//                   RaisedButton(
//                       color: Colors.green,
//                       child: Text("Send",
//                           style: TextStyle(
//                               fontSize: 15.0,
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold)),
//                       onPressed: () {
//                         setState(() {
//                           item.insert(0, numberController.text);
//                           //numberController.clear();
//                         });
//                       })
//                 ],
//               )),
//           Expanded(
//               child: Container(
//                   child: ListView.separated(
//             separatorBuilder: (BuildContext context, int index) => Divider(),
//             itemCount: item.length,
//             itemBuilder: (BuildContext context, int index) {
//               return ListTile(
//                 title: Text("${item[index]}"),
//               );
//             },
//           )))
//         ],
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:login/serviceClasses/student_Services.dart';
// import 'package:login/testing/myDate.dart';
// import 'package:login/testing/notificationManager.dart';
// //import 'package:http/http.dart' as http;

// // ignore: camel_case_types
// class b_note extends StatelessWidget {
//   // const b_note({Key key}) : super(key: key);
//   final GlobalKey<NavigatorState> navigatiorKey =
//       GlobalKey(debugLabel: "Main Navigator");

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       navigatorKey: navigatiorKey,
//       debugShowCheckedModeBanner: false,
//       home: blanknote(),
//     );
//   }
// }

// // ignore: camel_case_types
// class blanknote extends StatefulWidget {
//   blanknote({
//     Key key,
//   }) : super(
//           key: key,
//         );

//   @override
//   _blanknoteState createState() => _blanknoteState();
// }

// // ignore: camel_case_types
// class _blanknoteState extends State<blanknote> {
//   final notescontoller = TextEditingController();

//   //_blanknoteState(@required navigatorK
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     loadStudent();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final NotificationManager notificationManager = NotificationManager();

//     return Scaffold(
//         body: Container(
//             margin: new EdgeInsets.all(20),
//             height: MediaQuery.of(context).size.height,
//             width: MediaQuery.of(context).size.width,
//             child: Column(children: [
//               SizedBox(
//                 height: 50,
//               ),
//               Container(
//                   margin: new EdgeInsets.all(20),
//                   height: MediaQuery.of(context).size.height / 2.4,
//                   width: MediaQuery.of(context).size.width,
//                   child: Card(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(30.0),
//                       ),
//                       child: Container(
//                           child: TextFormField(
//                         controller: notescontoller,
//                         decoration: const InputDecoration(
//                           hintText: 'Talk about something!',
//                           labelText: 'Message',
//                           border: InputBorder.none,
//                         ),
//                         validator: (value) {
//                           if (value.isEmpty) {
//                             return "Please enter some text";
//                           }
//                           return null;
//                         },
//                         maxLines: null,
//                         maxLength: 60,

//                         // keyboardType: TextInputType.multiline,
//                       )))),
//               RaisedButton(
//                 onPressed: () {
//                   String task = notescontoller.text;
//                   Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                           builder: (context) =>
//                               Mydate(notificationManager, task)));
//                 },
//                 color: Color(0xffFF1744),
//                 textColor: Colors.white,
//                 padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
//                 child:
//                     Text('Click Here To Send All Entered Items To Next Screen'),
//               ),
//             ])));
//   }
// }
