
import 'package:hive/hive.dart';
import '../models/task.dart';

class TaskService {
  static const String boxName = 'tasks';

  Future<void> addTask(Task task) async {
    final box = await Hive.openBox(boxName);
    await box.add(task.toMap());
  }

  Future<List<Task>> getTasks() async {
    final box = await Hive.openBox(boxName);

    return box.values.map((e) {
      return Task.fromMap(Map<String, dynamic>.from(e));
    }).toList();
  }
}
