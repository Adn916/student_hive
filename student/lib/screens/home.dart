import 'package:flutter/material.dart';
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
            TextField();
          }, icon: IconButton(onPressed: (){}, icon: Icon(Icons.search)))
        ],
      ),
      body: ValueListenableBuilder(
      valueListenable: studentListNotifier,
      builder: (BuildContext context, List<studentModel> studentList, child){

        return ListView.separated(
        itemBuilder: (ctx, index) {
          final data = studentList[index];
          return ListTile(
            title: Text(data.name),
            subtitle: Text(data.age),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(onPressed: (){}, 
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