import 'package:flutter/foundation.dart';

class Student {
  String studentId;
  String sudentName;
  int studentScores;

  Student({this.studentId, this.studentScores, this.sudentName});

  factory Student.fromjson(Map<String, dynamic> parsejson) {
    // factory used bcox it does not require any object to call a function withuhin it
    return Student(
      studentId: parsejson["id"],
      sudentName:parsejson["name"], // this fromJson Function convert rawData(dynamic) to
      studentScores: parsejson["score"], //jsonObject Model (Student)
    );
  }
}
