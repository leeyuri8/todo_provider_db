import 'package:flutter/material.dart';
import 'package:todo_app/dp_helper.dart';

class Task{
  String taskName;
  bool isComplete;

  Task({@required this.taskName, this.isComplete=false});

  void toggleCompleted(){
    isComplete = !isComplete;
  }
  toJson(){
    return {
    DBHelper.taskIdColumn : this.taskName,
    DBHelper.taskIsCompleteColumnName : this.isComplete? 1 : 0
    };
  }
}