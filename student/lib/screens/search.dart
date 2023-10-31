import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class search extends StatefulWidget {
  const search({super.key});

  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  get studentList => null;
  
  get index => null;

  @override
  Widget build(BuildContext context) {
    final data = studentList[index];
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("image"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: CircleAvatar(
                radius: 150,
                backgroundImage: data.image!=null?
                  FileImage(File(data.image!)):AssetImage('student/assets/person.png') as ImageProvider
              ),
            )
          ],
        )
      ),
    );
  }
}