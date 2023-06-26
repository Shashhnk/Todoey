import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey/screen/TaskScreen.dart';
import 'package:todoey/widget/task_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<TaskData>(
      create: (context) => TaskData(),
      child: const MaterialApp(
        home: TaskScreen(),
      ),
    );
  }
}
