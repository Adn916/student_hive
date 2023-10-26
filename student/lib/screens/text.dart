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
  final _addresscontoller = TextEditingController();

  final _sub = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      ),
                      onTap:() {
                      
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.abc),
                        border: OutlineInputBorder(),
                        hintText: "Your Name",
                        helperText: "Enter your name here",
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
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _agecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.numbers),
                        border: OutlineInputBorder(),
                        labelText: "Age",
                        hintText: "Your Age",
                        helperText: "Enter your age",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _classcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_),
                        border: OutlineInputBorder(),
                        labelText: "Class",
                        hintText: "Your Class",
                        helperText: "Enter your class",
                      ),
                      validator: (value) {
                        if(value == null || value.isEmpty){
                          return "value is empty";
                        }else{
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      controller: _addresscontoller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.details),
                        border: OutlineInputBorder(),
                        labelText: "Address",
                        hintText: "Your Address",
                        helperText: "Enter your address"
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
    final _address=_addresscontoller.text.trim();
    if (_name.isEmpty || _age.isEmpty || _class.isEmpty || _address.isEmpty){
      return;
    }
    print('$_name , $_age , $_class , $_address');
    final _student = studentModel(name: _name, age: _age, cls: _class, address: _address);
    addstudent(_student);
  }

}