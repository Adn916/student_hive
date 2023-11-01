
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student/model/data_model.dart';
import 'package:student/screens/home.dart';
 
class editscreen extends StatefulWidget {
  final String name;
  final String age;
  final String cls; 
  final String phone;
  final int index;
  final String image;

  const editscreen({super.key, required this.name, required this.age, required this.cls, required this.phone,required this.index, required this.image});

  @override
  State<editscreen> createState() => _editscreenState();
}

class _editscreenState extends State<editscreen> {
  final _namecontroller =TextEditingController();
  final _agecontroller =TextEditingController();
  final _classcontroller =TextEditingController();
  final _phonecontroller =TextEditingController();
  final _imagecontroller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _namecontroller.text = widget.name;
    _agecontroller.text = widget.age;
    _classcontroller.text = widget.cls;
    _phonecontroller.text = widget.phone;
    // _imagecontroller.value = widget.image as TextEditingValue;
  }

  Future<void> updatestudent(int index)async{
    final studentdb=await Hive.openBox<studentModel>('student_db');
    if(index >=0 && index<studentdb.length){
      final stdupdate = studentModel(
        name: _namecontroller.text, 
        
        age: _agecontroller.text, 
        cls: _classcontroller.text,
        phone: _phonecontroller.text,
        image: _imagecontroller.text
        );
        await studentdb.putAt(index, stdupdate);
        Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
    }
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
                        // backgroundImage: _image==null? FileImage(_image!): null
                      ),
                      onTap:() {
                      //  _pickImage();
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
                      
                    ),
                    SizedBox(height: 15,),
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
                      
                    ),
                    ElevatedButton.icon(onPressed: (){ 
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>home()));
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
}