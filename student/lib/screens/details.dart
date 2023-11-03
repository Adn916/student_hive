import 'package:flutter/material.dart';

class studentDetails extends StatefulWidget {
  final String name;
  final String age;
  final String cls;
  final String phone;

  const studentDetails({super.key, required this.name, required this.age, required this.cls, required this.phone});

  @override
  State<studentDetails> createState() => _studentDetailsState(); 
}

class _studentDetailsState extends State<studentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            
            Text(widget.name),
            Text(widget.age),
            Text(widget.cls),
            Text(widget.phone)
          ],
        ),
      ),

    );
  }
}