import 'package:flutter/material.dart';

class stdetails extends StatefulWidget {
  const stdetails({super.key});

  @override
  State<stdetails> createState() => _stdetailsState();
}

class _stdetailsState extends State<stdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Student details"),
      ),
      body: Column(
        children: [
          ListView(
            children: [
            ],
          )
        ],
      ),
    );
  }
}