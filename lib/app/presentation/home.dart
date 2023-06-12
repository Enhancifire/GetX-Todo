import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_todo/app/controllers/task_controller.dart';
import 'package:getx_todo/app/models/task_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetX Task Manager'),
        actions: [
          IconButton(
            onPressed: () {
              final TextEditingController titleController =
                  TextEditingController();
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(
                    'Add Task',
                    style:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                  ),
                  content: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      hintText: 'Title',
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        final newTask = Task(title: titleController.value.text);
                        taskController.addTask(newTask);
                        Get.back();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Obx(() {
        return Column(
          children: taskController.taskList
              .map(
                (e) => ListTile(
                    title: Text(
                      e.title,
                      style: TextStyle(
                        decoration: e.isDone
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                    ),
                    leading: Checkbox(
                      value: e.isDone,
                      onChanged: (value) => taskController.editTask(
                        taskController.taskList.indexOf(e),
                        e.copyWith(isDone: value),
                      ),
                    ),
                    trailing: IconButton(
                      onPressed: () => taskController.removeTask(
                        taskController.taskList.indexOf(e),
                      ),
                      icon: const Icon(Icons.delete),
                    )),
              )
              .toList(),
        );
      }),
    );
  }
}
