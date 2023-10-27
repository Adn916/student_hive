import 'package:flutter/material.dart';

class editpage extends StatefulWidget {
  const editpage({super.key});

  @override
  State<editpage> createState() => _editpageState();
}

class _editpageState extends State<editpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
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
                      },
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      // controller: _namecontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        hintText: "Your Name",
                        labelText: "Name",
                      ),
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return "value is empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      // controller: _agecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.calendar_month),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Age",
                        hintText: "Your Age",
                      ),
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return "value is empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      // controller: _classcontroller,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.class_),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Class",
                        hintText: "Your Class",
                      ),
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return "value is empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                    ),
                    SizedBox(height: 15,),
                    TextFormField(
                      // controller: _phonecontroller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        ),
                        labelText: "Phone Number",
                        hintText: "Your Phone Number",
                      ),
                      // validator: (value) {
                      //   if(value == null || value.isEmpty){
                      //     return "value is empty";
                      //   }else{
                      //     return null;
                      //   }
                      // },
                    ),
                    ElevatedButton.icon(onPressed: (){ 
                      
                    }, icon: Icon(Icons.update), label: Text("UPDATE"))
              
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