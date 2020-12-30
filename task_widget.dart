import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dp_helper.dart';
import 'package:todo_app/task_model.dart';
import 'package:todo_app/todo_provider.dart';
import 'constants.dart';

class TaskWidget extends StatefulWidget{
final Task task;
final isComplete;
final taskName;
TaskWidget({@required this.task,this.taskName,this.isComplete});

  @override
  _TaskWidgetState createState() => _TaskWidgetState();

}
class _TaskWidgetState extends State<TaskWidget> {



 void delete(Task task) async {
   await DBHelper.dbHelper.deleteTask(task);
   Provider.of<TodoProvider>(context, listen: false).deleteTask(task);
 }
Task task;


  @override
  Widget build(BuildContext context) {
  
    return Card(
      margin: EdgeInsets.all(10),
      child:Padding(
       padding: EdgeInsets.symmetric(horizontal: 10) ,

      child:Row(
        mainAxisAlignment:MainAxisAlignment.spaceBetween ,
        children: [
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  size: 20.0,
                  color: Colors.black,
                ),
                onPressed: (){
                   delete(task);
                }, 
                alignment: Alignment.centerLeft,
              ),
        Text(task.taskName),
        Checkbox(value: task.isComplete,
         onChanged: (bool check){
        Provider.of<TodoProvider>(context, listen: false).toggleTask(task);     
        
        },
        )
      ],
      )
    ),
    );
    
  }
}

