import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:todo_app/task_model.dart';

class TodoProvider extends ChangeNotifier {
final List<Task> tasks =[];
UnmodifiableListView<Task> get allTasks => UnmodifiableListView(tasks);
  UnmodifiableListView<Task> get incompleteTasks =>
      UnmodifiableListView(tasks.where((task) => !task.isComplete));
      UnmodifiableListView<Task> get completeTasks =>
      UnmodifiableListView(tasks.where((task) => task.isComplete));


      void addTask(Task task){
        tasks.add(task);
        notifyListeners();
      }

      void toggleTask(Task task){
        final taskIndex = tasks.indexOf(task);
        tasks[taskIndex].toggleCompleted();
        notifyListeners();

      }
      void deleteTask(Task task){
        tasks.remove(task);
        notifyListeners();
      }
}