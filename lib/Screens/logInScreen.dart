import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:login/CommonClasses/commonClasses.dart';
import 'package:login/CustomeWidget/bottompartloginScreen.dart';
import 'package:login/CustomeWidget/upperLoginScreen.dart';

// ignore: must_be_immutable
class LoginScreenPage extends StatefulWidget {
  //final upLogScreen = upperLoginScreenPrt();

  @override
  _LoginScreenPageState createState() => _LoginScreenPageState();
}

class _LoginScreenPageState extends State<LoginScreenPage> {

  // Creating Objects
  final upLogScreen = upperLoginScreenPrt();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
            // fit: StackFit.expand,
            children: [
              InkWell(
                onTap: () {
                  print("object");
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.6,
                  // color: primaryColor,
                  decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                          bottomEnd: Radius.circular(50),
                          bottomStart: Radius.circular(50))),
                ),
              ),
              Container(
                  //color: Colors.greenAccent,
                  margin: EdgeInsets.only(left: 20, top: 220, right: 20),
                  child: Column(
                    children: [
                      upperLoginScreenPrt(),
                      //btnLoginSighnup(),
                      Container(
                        //color: Colors.black38,
                        margin: EdgeInsets.only(top: 47),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 1.0,
                                  color: Colors.black,
                                ),
                                color: Colors.white,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30.0),
                                    right: Radius.circular(30.0)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              width: 150,
                              child: FlatButton(
                                child: Text(
                                  "SIGNUP",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                textColor: Colors.black,
                                //elevation: 05.0,
                                onPressed: () {
                                  Navigator.of(context)
                                      .pushNamed("/signUpScreen");
                                },
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                color: Colors.black,
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(30.0),
                                    right: Radius.circular(30.0)),
                              ),
                              clipBehavior: Clip.hardEdge,
                              width: 150,
                              child: FlatButton(
                                child: Text(
                                  "LOGIN",
                                  style: TextStyle(fontWeight: FontWeight.w300),
                                ),
                                textColor: Colors.white,
                                //elevation: 05.0,
                                onPressed: () {
                                  print("${upLogScreen.emailCotroller.text}");
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      // WpsendMsg(),
                      bottomLoginScreen(),
                    ],
                  ))
            ]),
      ),
    );
  }
}
