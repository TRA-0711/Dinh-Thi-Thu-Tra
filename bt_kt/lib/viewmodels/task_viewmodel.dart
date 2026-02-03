import 'package:flutter/material.dart';
import '../models/task.dart';
import '../services/task_service.dart';

class TaskViewModel extends ChangeNotifier {
  final TaskService _service = TaskService();

  List<Task> tasks = [];

  Future<void> loadTasks() async {
    tasks = await _service.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title, String description) async {
    if (title.isEmpty) return;

    await _service.addTask(
      Task(title: title, description: description),
    );

    await loadTasks();
  }
}
