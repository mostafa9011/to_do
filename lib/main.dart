import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'features/Home/data/task_model.dart';
import 'features/Home/presentation/widgets/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>('tasks');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'To Do',
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
