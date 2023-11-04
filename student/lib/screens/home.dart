import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/screens/details.dart';
import 'package:student/screens/edit.dart';
import 'add.dart';
import 'package:student/db/functions/function.dart';
import 'package:student/db/model/data_model.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String _search = '';
  List<studentModel> searchList = [];
  List<studentModel> studentList = [];

  loadstd() async {
    final allStudent = await getAllStudents();
    studentListNotifier.value = allStudent;
  }

  @override
  void initState() {
    super.initState();

    loadstd();
    getAllStudents();
  }

  void searchResult() {
    setState(() {
      searchList = studentListNotifier.value
          .where((StudentModel) =>
              StudentModel.name.toLowerCase().contains(_search.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return Scaffold(
        appBar: AppBar(
          title: Text("Students info"),
          backgroundColor: Colors.green,
          actions: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Icon(Icons.home),
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: TextFormField(
                  style: TextStyle(color: Colors.blue),
                  decoration: InputDecoration(
                    hintText: "Search",
                    contentPadding: EdgeInsets.all(20),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey,
                  ),
                  onChanged: (value) {
                    setState(() {
                      _search = value;
                    });
                    searchResult();
                  },
                ),
              ),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: studentListNotifier,
                  builder: (BuildContext ctx, List<studentModel> studentList,
                      Widget? child) {
                        final displaystudent =
                        searchList.isNotEmpty ? searchList : studentList;
                    return ListView.builder(
                      itemBuilder: (ctx, index) {
                        final data = displaystudent[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 8,
                            child: ListTile(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => studentDetails(
                                            name: data.name,
                                            age: data.age,
                                            cls: data.cls,
                                            phone: data.phone, 
                                            image: data.image,
                                            )));
                              },
                              leading: CircleAvatar(
                                  radius: 30,
                                  backgroundImage: data.image != null
                                      ? FileImage(File(data.image!))
                                      : AssetImage('student/assets/person.png')
                                          as ImageProvider),
                              title: Text(data.name),
                              subtitle: Text(data.age),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => editscreen(
                                                    index: index,
                                                    name: data.name,
                                                    age: data.age,
                                                    cls: data.cls,
                                                    phone: data.phone,
                                                    image: data.image,
                                                  )));
                                    },
                                    icon: Icon(Icons.edit),
                                    color: Colors.blue,
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      deleteStudent(index);
                                    },
                                    icon: Icon(Icons.delete),
                                    color: Colors.red,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: displaystudent.length,
                    );
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: FloatingActionButton.extended(
                  backgroundColor: Colors.yellow,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => details()));
                  },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.red,
                  ),
                  label: Text(
                    "Add Student",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}