import 'dart:io';

import 'package:flutter/material.dart';

class studentDetails extends StatefulWidget {
  final String name;
  final String age;
  final String cls;
  final String phone;
  final dynamic image;

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
                    radius: 90,
                    backgroundImage: _image!=null
                        ? FileImage(File(widget.image)):
                        AssetImage('assets/person.png') as ImageProvider,
              ),
              SizedBox(height: 20),
              Card(
                elevation: 7,
                color: Colors.amber,
                child: Text('Name: ${widget.name}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                child: Text('Age: ${widget.age}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Card(
                child: Text('Course: ${widget.cls}',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Card(
                child: Text('Phone: ',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Card(
                child: Text('${widget.phone}',
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