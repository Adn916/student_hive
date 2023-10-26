import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student/model/data_model.dart';

ValueNotifier<List <studentModel>>studentListNotifier = ValueNotifier([]);

void addstudent(studentModel value)async {
 final studentdb = await Hive.openBox<studentModel>('student_db');

 await studentdb.add(value);

 studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
}

Future<void> getAllStudents()async{
  final studentdb=await Hive.openBox<studentModel>('student_db');
  studentListNotifier.value.clear();

  studentListNotifier.value.addAll(studentdb.values);
  studentListNotifier.notifyListeners();
}

Future<void> deleteStudent(int index)async{
  final studentdb=await Hive.openBox<studentModel>('student_db');
  await studentdb.deleteAt(index);
  getAllStudents();
}