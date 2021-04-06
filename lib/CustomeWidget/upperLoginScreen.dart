import 'package:flutter/material.dart';

// ignore: camel_case_types
class upperLoginScreenPrt extends StatefulWidget {
  // Creating Variables
  TextEditingController emailCotroller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //upperLoginScreenPrt({@required this.emailCotroller,@required this.passwordController});

  @override
  // ignore: missing_required_param
  _upperLoginScreenPrtState createState() => _upperLoginScreenPrtState();
}

// ignore: camel_case_types
class _upperLoginScreenPrtState extends State<upperLoginScreenPrt> {
  String emailEnter = " ";
  final upscreen = upperLoginScreenPrt();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Login",
            style: TextStyle(fontSize: 40.0, fontWeight: FontWeight.w400)),
        Container(
          height: 3,
          width: 40,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(10.0), left: Radius.circular(10.0))),
        ),
        SizedBox(
          height: 85,
        ),
        Text("Email"),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          obscureText: false,
          controller: upscreen.emailCotroller,
          decoration: InputDecoration.collapsed(
            hintText: "",
            //border: UnderlineInputBorder(),
          ),
          style: TextStyle(
              //backgroundColor: Colors.yellow,
              color: Colors.white70,
              fontWeight: FontWeight.normal),
          onTap: () {},
        ),
        SizedBox(
          height: 30,
        ),
        Text("Password"),
        SizedBox(
          height: 4,
        ),
        TextFormField(
          obscureText: true,
          controller: upscreen.passwordController,
          decoration: InputDecoration.collapsed(
            hintText: "",
            //border: UnderlineInputBorder(),
          ),
          style: TextStyle(
              //backgroundColor: Colors.yellow,
              color: Colors.white70,
              fontWeight: FontWeight.normal),
          onTap: () {
            if (upscreen.emailCotroller.text.isNotEmpty) {
              return print("_emial should not be emoty}");
            }
          },
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
            child: Container(
              // color: Colors.green,
              margin: EdgeInsets.only(left: 255),
              height: 20,
              child: Text(
                "forgot password!",
                style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.white70),
              ),
            ),
            onTap: () {
              print("${upscreen.emailCotroller.text}");
            }),
      ],
    );
  }
}
