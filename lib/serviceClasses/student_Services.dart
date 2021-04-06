import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

Future<String> _loadAStudentAsset() async {
  return await rootBundle.loadString('assets/student.json');
}

Future<void> loadStudent() async {
  String jsonString = await _loadAStudentAsset();
  final jsonResponse = json.decode(jsonString);
  List students = jsonResponse as List;
  print(students.length);
}
