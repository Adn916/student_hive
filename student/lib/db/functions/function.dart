

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:student/db/model/data_model.dart'; 
import 'package:student/screens/edit.dart';

ValueNotifier<List <studentModel>> studentListNotifier = ValueNotifier([]);


void addstudent(studentModel value)async {
 final studentdb = await Hive.openBox<studentModel>('student_db'); 
 await studentdb.add(value);
 studentListNotifier.value.add(value);
  studentListNotifier.notifyListeners();
} 

getAllStudents()async{
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

Future<void> updatestudent(int index)async{
    final studentdb=await Hive.openBox<studentModel>('student_db');
      final stdupdate = studentModel(
        name: namecontroller.text,
        age: agecontroller.text, 
        cls: classcontroller.text,
        phone: phonecontroller.text,
        
        image: image,
        );
        await studentdb.putAt(index, stdupdate);
        getAllStudents();
  }