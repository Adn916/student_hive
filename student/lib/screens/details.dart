import 'dart:ffi';

import 'package:flutter/material.dart';
import 'home.dart';

class studentdetails {
  final String name;
  final String age;
  final String clas;
  final String phone;

  studentdetails({required this.name, required this.age, required this.clas, required this.phone});
}
class stdetails extends StatefulWidget {
  const stdetails({super.key});

  @override
  State<stdetails> createState() => _stdetailsState();
}

// List<String> studentdetails = []

class _stdetailsState extends State<stdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student details"),
      ),
      body: Container(
      )
    );
  }
}
