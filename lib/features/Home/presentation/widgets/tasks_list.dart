import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../data/task_model.dart';
import '../enums/filter_tasks_enum.dart';
import 'task_item.dart';

class TasksList extends StatelessWidget {
  final Filter filter;

  const TasksList({required this.filter, super.key});

  @override
  Widget build(BuildContext context) {
    final Box<TaskModel> _taskBox = Hive.box<TaskModel>('tasks');

    return ValueListenableBuilder(
      valueListenable: _taskBox.listenable(),
      builder: (context, Box<TaskModel> box, _) {
        List<TaskModel> tasks = box.values.toList();

        if (filter == Filter.active) {
          tasks = tasks.where((task) => !task.isCompleted).toList();
        } else if (filter == Filter.completed) {
          tasks = tasks.where((task) => task.isCompleted).toList();
        }

        if (tasks.isEmpty) {
          return const Center(child: Text("No tasks yet"));
        }

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            final task = tasks[index];

            return TaskItem(task: task);
          },
        );
      },
    );
  }
}
