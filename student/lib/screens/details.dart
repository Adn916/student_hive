import 'dart:io';

import 'package:flutter/material.dart';

class studentDetails extends StatefulWidget {
  final String name;
  final String age;
  final String cls;
  final String phone;
  final String image;

  const studentDetails({
    Key? key,
    required this.name,
    required this.age,
    required this.cls,
    required this.phone,
    required this.image,
  }) : super(key: key);

  @override
  State<studentDetails> createState() => _studentDetailsState();
}

class _studentDetailsState extends State<studentDetails> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 239, 223, 82),
        title: Text('Profile'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(90),
          child: Column(
            children: [
              CircleAvatar(
                radius: 70,
                child: CircleAvatar(
                  backgroundImage: FileImage(File(widget.image!)),
                  radius: 90,
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Name: ${widget.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Age: ${widget.age}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Course: ${widget.cls}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Phone: ${widget.phone}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}