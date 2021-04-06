import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:login/CommonClasses/calls_and_messages_services.dart';
import 'package:login/CustomeWidget/sharedBtn.dart';
import 'package:url_launcher/url_launcher.dart';

class bottomLoginScreen extends StatefulWidget {
  const bottomLoginScreen({Key key}) : super(key: key);

  @override
  _bottomLoginScreenState createState() => _bottomLoginScreenState();
}

class _bottomLoginScreenState extends State<bottomLoginScreen> {
  final CallsAndMessagesServices _services = CallsAndMessagesServices();
  String phoneNo = 'tel:+919238518773';
  final String email = "derasubrat123@gmail.com";

  // Call function
  Future<void> callNow() async {
    if (await canLaunch(phoneNo)) {
      await launch(phoneNo);
    } else {
      throw 'call not possible';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 110),
          alignment: Alignment.center,
          //color: Colors.yellow,
          child: Text(
            "or Login with",
            style:
                TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              autofocus: false,
              //hoverColor: Colors.teal,
              child: sharedbtn(
                btnIcon: Icons.sms,
              ),
              onTap: () => _services.sendSms(phoneNo),
            ),
            InkWell(
              child: sharedbtn(
                btnIcon: Icons.mail,
              ),
              onTap: () => _services.sendEmail(email),
            ),
            InkWell(
              child: sharedbtn(
                btnIcon: Icons.send_to_mobile,
              ),
              onTap: () => _services.call(phoneNo),
            ),
          ],
        ),
        Container(
          //color: Colors.black,
          margin: EdgeInsets.only(top: 15, bottom: 05),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              new Text(
                "Don't have any Account ?",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 5,
              ),
              InkWell(
                child: Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.of(context).pushNamed("/signUpScreen");
                },
              ),
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          // mainAxisSize: MainAxisSize.min,
          children: [
            Text("for any help",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 10,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              width: 5,
            ),
            InkWell(
              child: Text("Contact us 9238518773",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
              onTap: () async => await callNow(),
            ),
          ],
        ),
        SizedBox(
          height: 3,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You can contact us on whatsapp by",
                style: TextStyle(
                    color: Colors.black45,
                    fontSize: 10,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              width: 2,
            ),
            InkWell(
              child: Text("8455947722",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      fontWeight: FontWeight.bold)),
              onTap: () {
                FlutterOpenWhatsapp.sendSingleMessage(
                    "918455947722", "we are also happy to have you");
              },
            ),
          ],
        ),
      ],
    );
  }
}
