import 'package:flutter/material.dart';

class localDataShow extends StatefulWidget {
  localDataShow({Key key}) : super(key: key);

  @override
  _localDataShowState createState() => _localDataShowState();
}

class _localDataShowState extends State<localDataShow> {
  // Future<List> stCount = loadStudent();
  @override
  Widget build(BuildContext context) {
    return Container(
       child: ListView.builder(
         //itemCount:,
         itemBuilder: (context,index){

         }),
    );
  }
}