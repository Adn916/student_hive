
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/db/functions/function.dart';
import 'package:student/db/model/data_model.dart';
import 'package:student/screens/home.dart';

  final namecontroller =TextEditingController();
  final agecontroller =TextEditingController();
  final classcontroller =TextEditingController();
  final phonecontroller =TextEditingController();

  String ? image;
class editscreen extends StatefulWidget {
  final String name;
  final String age;
  final String cls; 
  final String phone;
  final int index;
  dynamic image;

  editscreen({super.key, 
  required this.name, 
  required this.age, 
  required this.cls, 
  required this.phone,
  required this.index, 
  required this.image});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    namecontroller.text = widget.name;
    agecontroller.text = widget.age;
    classcontroller.text = widget.cls;
    phonecontroller.text = widget.phone;
    image = widget.image != '' ? widget.image : null;
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text("EDIT STUDENT"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    GestureDetector(
                      child: CircleAvatar(
                        child: Icon(Icons.add_a_photo),
                        radius: 50,
                        backgroundImage: image!=null
                        ? FileImage(File(image!)):
                        AssetImage('assets/person.png') as ImageProvider,
                      ),
                      onTap:() {
                      _editimage();
                      },
                      onDoubleTap: () => _imageEditCam(),
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "Your Name",
                        labelText: "Name",
                      ),
                      
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      maxLength: 2,
                      controller: agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Age",
                        hintText: "Your Age",
                      ),
                      
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: classcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Class",
                        hintText: "Your Class",
                      ),
                      
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      maxLength: 10,
                      controller: phonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        prefixText: "+91 ",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Phone Number",
                        hintText: "Your Phone Number",
                      ),
                    ),
                    ElevatedButton.icon(onPressed: (){ 
                     Navigator.pop(context);
                     updatestudent(widget.index);
                    }, icon: Icon(Icons.save), label: Text("UPDATE"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future _editimage()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(returnImage == null){
      return;
    }
    setState(() {
      image = returnImage.path;
    });
  }
  _imageEditCam()async{
    final returnImage = await ImagePicker().pickImage(source: ImageSource.camera);
    if(returnImage == null){
      return;
    }
    setState(() {
      image = returnImage.path;
    });
  }
}