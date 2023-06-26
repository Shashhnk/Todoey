import 'package:flutter/material.dart';
import 'task.dart';
import 'dart:collection';
class TaskData extends ChangeNotifier{
  final List<Task> _tasks = [
    Task(name: 'Buy Milk'),
    Task(name: 'Buy Eggs'),
    Task(name: 'Buy Bread'),
  ];
  UnmodifiableListView<Task> get tasks {
    return UnmodifiableListView(_tasks);
  }
  int get taskCount{
    return _tasks.length;
  }

  void addtask (String title){
    _tasks.add(Task(name: title));
    notifyListeners();
  }
  void updateTask (Task task){
    task.toggleDone();
    notifyListeners();
  }
  void deleteTask(Task task){
    _tasks.remove(task);
    notifyListeners();
  }


}