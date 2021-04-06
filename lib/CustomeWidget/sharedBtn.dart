import 'package:flutter/material.dart';

class sharedbtn extends StatelessWidget {

  
  IconData btnIcon;

  sharedbtn({this.btnIcon});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 50, horizontal: 25),
      height: 50,
      width: 50,
      decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.yellow,
          ),
          boxShadow: [BoxShadow(
            color: Colors.redAccent,
            blurRadius: 02.0,
            offset: Offset(0.0,2.0)
          )],
          gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.topRight,colors: [Colors.black,Colors.red]),
          borderRadius: BorderRadius.horizontal(
              left: Radius.circular(10.0), right: Radius.circular(10.0))),
      child: Icon(
        btnIcon,
        color: Colors.white
      ),
    );
  }
}
