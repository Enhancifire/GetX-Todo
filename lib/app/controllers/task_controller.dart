import 'package:get/get.dart';
import 'package:getx_todo/app/models/task_model.dart';

class TaskController extends GetxController {
  List<Task> taskList = <Task>[].obs;

  void addTask(Task task) {
    taskList.add(task);
  }

  void removeTask(int index) {
    taskList.removeAt(index);
  }

  void editTask(int index, Task task) {
    taskList[index] = task;
  }
}
