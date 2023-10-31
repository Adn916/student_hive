import 'dart:io';

import 'package:flutter/material.dart';
import 'package:student/screens/details.dart';
import 'package:student/screens/edit.dart';
import 'package:student/screens/search.dart';
import 'text.dart';
import 'package:student/db/functions/function.dart';
import 'package:student/model/data_model.dart';
 
class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
} 

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    getAllStudents();
    
    return Scaffold( 
      appBar: AppBar(
        title: Text("Students info"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(onPressed: (){
            
          }, icon: IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const search()));
            
          }, 
          icon: Icon(Icons.search)
          )
          )
        ],
      ),
      body: ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext context, List<studentModel> studentList, child){
      
        return ListView.separated(
        itemBuilder: (ctx, index) {
          final data = studentList[index];
          return ListTile(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>stdetails()));
            },
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: data.image!=null?
              FileImage(File(data.image!)):AssetImage('student/assets/person.png') as ImageProvider
            ),
            title: Text(data.name),
            subtitle: Text(data.age),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>editscreen(
                    index: index,
                    name: data.name,
                    age: data.age,
                    cls: data.cls,
                    phone: data.phone,
                    image: data.image!,
                  )));
                }, 
                icon: Icon(Icons.edit),color: Colors.blue,),
                IconButton(onPressed: (){
      
                  deleteStudent(index);
                
                },                
                icon: Icon(Icons.delete),color: Colors.red,),
              ],
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return Divider();
        },
        itemCount: studentList.length,
      );
      } ,
        ),
  
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.yellow,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>details()));
        },icon: Icon(Icons.person_add,color: Colors.red,), 
        label: Text("Add Student",style: TextStyle(color: Colors.black),),
      ),
      );
  }
}