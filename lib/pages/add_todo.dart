//import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/save_task.dart';
import 'package:to_do_list/models/task_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Todo',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller,
              autofocus: true,
              decoration: const InputDecoration(hintText: 'Enter todo here'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                context.read<SaveTask>().addTask(
                  Task(title: controller.text, isComplet: false),
                );
                controller.clear();
                Navigator.of(context).pop();
              },
              child: const Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
