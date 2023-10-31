import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/screens/home.dart';
import 'package:student/model/data_model.dart';
import 'package:student/db/functions/function.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}
 
class _detailsState extends State<details> {

  final ImagePicker image=ImagePicker();

  final _namecontroller = TextEditingController();
  final _agecontroller = TextEditingController();
  final _classcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();

  final _sub = GlobalKey<FormState>();

  File? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("ADD STUDENT"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: _sub,
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
                        backgroundImage: _image!=null? FileImage(_image!): AssetImage('student/assets/person.png')as ImageProvider,
                      ),
                      onTap:() {
                       _pickImage();
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "Your Name",
                        labelText: "Name",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      maxLength: 2,
                      controller: _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Age",
                        hintText: "Your Age",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _classcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Class",
                        hintText: "Your Class",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      maxLength: 10,
                      controller: _phonecontroller,
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
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    ElevatedButton.icon(onPressed: (){ 
                      if(_sub.currentState!.validate()){
                      _onAddStudentButtonClicked();
                      Navigator.pop(context, MaterialPageRoute(builder: (context)=> home()));
                      }
                    }, icon: Icon(Icons.save), label: Text("SUBMIT"))
              
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  Future <void> _onAddStudentButtonClicked()async {
    final _name=_namecontroller.text.trim();
    final _age=_agecontroller.text.trim();
    final _class=_classcontroller.text.trim();
    final _address=_phonecontroller.text.trim();
    if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _address.isEmpty){
      return;
    }
    final _student = studentModel(name: _name, age: _age, cls: _class, phone: _address,image: _image!.path);
    addstudent(_student);
  }
  Future<void> _pickImage()async {
  final image=await ImagePicker().pickImage(source: ImageSource.camera);
  if(image == null){
    return ;
  }else{
    setState(() {
      _image = File(image.path);
    });
  }
}

}