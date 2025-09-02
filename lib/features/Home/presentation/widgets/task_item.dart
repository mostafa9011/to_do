import 'package:flutter/material.dart';

import '../../data/task_model.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({required this.task, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(10),
      child: ListTile(
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (value) {
            task.isCompleted = value ?? false;
            task.save(); // Save updated task
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
            const SizedBox(height: 8),

            // description
            Text(
              task.description,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                decoration:
                    task.isCompleted ? TextDecoration.lineThrough : null,
              ),
            ),
          ],
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red),
          onPressed: () {
            task.delete();
          },
        ),
      ),
    );
  }
}
