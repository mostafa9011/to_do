import 'package:flutter/material.dart';

import 'features/Home/presentation/widgets/home_screen.dart';

void main() {
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
