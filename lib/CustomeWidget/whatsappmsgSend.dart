import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_open_whatsapp/flutter_open_whatsapp.dart';
import 'package:flushbar/flushbar.dart';

class WpsendMsg extends StatefulWidget {
  WpsendMsg({Key key}) : super(key: key);

  @override
  _WpsendMsgState createState() => _WpsendMsgState();
}

class _WpsendMsgState extends State<WpsendMsg> {
  TextEditingController numberController = TextEditingController();
  TextEditingController msgController = TextEditingController();

// Custome Alert Diaauge Box

  void showingAlertBox(String desc) {
    AwesomeDialog(
        context: context,
        animType: AnimType.SCALE,
        title: "Warning",
        desc: " ",
        body: Center(
          child: Text(
            desc,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        btnOkOnPress: () =>
            Navigator.of(context, rootNavigator: true).pop(context)).show();
  }

// Custome Snack Bar
  void showingSnackBar(
    BuildContext context,
    String title,
  ) {
    Flushbar(
      title: title,
      message: " ",
      borderRadius: 10,
      borderColor: Colors.yellow,
      backgroundGradient: LinearGradient(
          colors: [Colors.black38, Colors.red],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
          stops: [0.6, 1]),
      boxShadows: [
        BoxShadow(color: Colors.black, offset: Offset(3, 3), blurRadius: 3),
      ],
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          TextFormField(
            decoration: InputDecoration.collapsed(
              hintText: "enter number",
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            controller: numberController,
            obscureText: false,
            keyboardType: TextInputType.number,
            maxLength: 10,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            decoration: InputDecoration.collapsed(
              hintText: "enter msg",
              hintStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 20),
            ),
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            controller: msgController,
            obscureText: false,
            keyboardType: TextInputType.text,
            maxLength: 10,
            onTap: () {
              setState(() {
                if (this.numberController.text.isEmpty) {
                  // print("number field should not be empty");
                  showingSnackBar(context, "number field should not be empty");
                } else if (this.numberController.text.length < 10) {
                  // print("number field should not be empty");
                  showingSnackBar(context, "numbers should be 10 digits");
                }
              });
            },
          ),
          SizedBox(
            height: 10,
          ),
          RaisedButton(
            color: Colors.green,
            child: Text("Whatapp",style: TextStyle(fontSize: 20,color: Colors.white),),
            onPressed: () {
              setState(() {
                if (numberController.text == "" && msgController.text == "") {
                  showingAlertBox("Fielsd should not be emoty");
                } else if (msgController.text == "") {
                  showingSnackBar(context, "password should not be empty");
                } else {
                  FlutterOpenWhatsapp.sendSingleMessage(
                      "91${numberController.text.toString()}",
                      "${msgController.text.toString()}");
                }
              });
            },
          ),
        ],
      ),
    );
  }
}
