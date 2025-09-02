import 'package:flutter/material.dart';

import '../enums/filter_tasks_enum.dart';
import 'custom_bottom_sheet.dart';
import 'tasks_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // All, Active, Completed
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Todo App"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "All"),
              Tab(text: "Active"),
              Tab(text: "Completed"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TasksList(filter: Filter.all),
            TasksList(filter: Filter.active),
            TasksList(filter: Filter.completed),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () => _showBottomSheet(context),
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  /// Show bottom sheet to add a new task
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return const CustomBottomSheet();
      },
    );
  }
}
