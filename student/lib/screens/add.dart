import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:student/screens/home.dart';
import 'package:student/db/model/data_model.dart';
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
  final _imagePicker = ImagePicker();

  final _formkey = GlobalKey<FormState>();

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
          key: _formkey,
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
                        backgroundImage: _image!=null? 
                        FileImage(_image!)
                        : AssetImage('assets/person.png')as ImageProvider,
                      ),
                      onTap:() {
                        _showImageSourceDialog();
                      },
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration:  InputDecoration(
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
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
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
                      if(_formkey.currentState!.validate()){
                      _onAddStudentButtonClicked();
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> home()));
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
    Navigator.of(context).pop();
  }
  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () =>  _pickImage(ImageSource.camera),
              child: Text("Camera"),
            ),
            TextButton(
              onPressed: () =>  _pickImage(ImageSource.gallery) (),
              child: Text("Gallery"),
            ),
          ],
        ),
      ),
    );
  }

    _pickImage(ImageSource source) async {
    final image = await _imagePicker.pickImage(source: source);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
    Navigator.pop(context);
  }

}