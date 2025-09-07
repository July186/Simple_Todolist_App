import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/pages/add_todo.dart';
import 'package:to_do_list/pages/todo_list.dart';
import 'package:to_do_list/models/save_task.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SaveTask(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      theme: ThemeData(brightness: Brightness.dark),
      initialRoute: '/',
      routes: {
        '/': (_) => const Todolist(),
        '/add-todo-screen': (_) => const AddTodo(),
      },
    );
  }
}
