import 'package:flutter/material.dart';
import 'package:to_do_list/models/task_model.dart';

class SaveTask extends ChangeNotifier {
  List<Task> _tasks = [
    Task(title: 'learn flutter', isComplet: false),
    Task(title: 'EAT SOMETHING', isComplet: false),
  ];

  List<Task> get tasks => _tasks;

  void addTask(Task task) {
    tasks.add(task);
    notifyListeners();
  }

  void removeTask(Task task) {
    tasks.remove(task);
    notifyListeners();
  }

  void checkTask(int index) {
    tasks[index].isDone();
    notifyListeners();
  }

    void editTask(int index, String newTitle) {
    tasks[index].title = newTitle;
    notifyListeners();
  }
}
