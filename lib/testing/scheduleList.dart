import 'package:flutter/material.dart';

class schedulelist extends StatefulWidget {
  final List<String> updatedtimedateList;
  schedulelist({ @required this.updatedtimedateList}) : super();

  @override
  _schedulelistState createState() => _schedulelistState(updatedtimedateList);
}

class _schedulelistState extends State<schedulelist> {
  final List<String> updatedtimedateList1;
  _schedulelistState(this.updatedtimedateList1);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  print(updatedtimedateList1.length);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue[900],
          centerTitle: true,
          title: Text(
            "ScheduledList",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.separated(
              separatorBuilder: (BuildContext context, int index) =>
                  Divider(),
              scrollDirection: Axis.vertical,
              itemCount: updatedtimedateList1.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(updatedtimedateList1[index]),
                );
              }),
        ));
  }
}