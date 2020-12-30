
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dp_helper.dart';
import 'package:todo_app/task_model.dart';
import 'package:todo_app/todo_provider.dart';

class NewTasks extends StatefulWidget {
  final String taskName;
   bool isComplete = false;
  NewTasks(this.taskName,this.isComplete);

  @override
  _NewTasksState createState() => _NewTasksState();
}


class _NewTasksState extends State<NewTasks> {
  final textEditingController = TextEditingController();
  bool isComplete = false ;
   Task task;


 @override
 void dispose(){
   textEditingController.dispose();
   super.dispose();
 }

void todoAdd(){
  final String textVal = textEditingController.text;
  final bool complete = isComplete;
  if(textVal.isNotEmpty){
    final Task task = Task(taskName: textVal,isComplete: complete);
    DBHelper.dbHelper.insertNewTask(task);
    Provider.of<TodoProvider>(context,listen: false).addTask(task);
    Navigator.pop(context);
  }
}

  @override

  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       leading: new GestureDetector(
      child: Icon(Icons.close, size: 30),
      onTap:(){
      Navigator.pop(context);
      DBHelper.dbHelper.updateTask(task);
     
      },
       ) ,
       title:Text('New Task',style: TextStyle(fontSize:26),),
       
     ),
   body:Container(
     padding: EdgeInsets.all(20),
     child: Container(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget> [
       TextField(
         decoration: InputDecoration(
           labelText: "Task: ",
           hintText: "E.g. Cleaning home",
           labelStyle:TextStyle(
             fontSize: 20, fontFamily: "Lato",color: Colors.purple,fontWeight: FontWeight.bold),
             hintStyle: TextStyle(fontSize: 18,fontFamily: "Lato",color: Colors.grey),
           border: OutlineInputBorder(
             borderRadius: BorderRadius.circular(10)
           ),
          
         ),

       ), 
       CheckboxListTile(
         value: isComplete, 
         onChanged: (checked)=>setState((){
           isComplete = checked;
         }
         
         ),
         title: Text('Is Complete?'),
       ),
       
    
       RaisedButton( 
         child: Text('Add new Task' , 
         style:TextStyle(color:Colors.orange,fontFamily: "Lato"),),
         color: Colors.tealAccent,
         onPressed: (){
                      todoAdd();
                       }
                       ),
                   
                     
                   ],
                   
                   ),
     ),
                 ) ,
                 
                 );
                
                }
              }
       
    