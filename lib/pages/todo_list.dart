import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/models/save_task.dart';

class Todolist extends StatefulWidget {
  const Todolist({super.key});

  @override
  State<Todolist> createState() => _TodolistState();
}

class _TodolistState extends State<Todolist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Todo List',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add-todo-screen');
        },
        child: const Icon(Icons.add),
      ),
      body: Consumer<SaveTask>(
        builder: (context, task, child) {
          return ListView.builder(
            itemCount: task.tasks.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  task.tasks[index].title,
                  style: TextStyle(
                    decoration: task.tasks[index].isComplet
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                ),
                trailing: Wrap(
                  children: [
                    Checkbox(
                      value: task.tasks[index].isComplet,
                      onChanged: (_) {
                        context.read<SaveTask>().checkTask(index);
                      },
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<SaveTask>().removeTask(task.tasks[index]);
                      },
                      icon: Icon(Icons.delete),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        TextEditingController editcontroller = TextEditingController(text: task.tasks[index].title);
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Edit Task'),
                            content: TextField(
                              controller: editcontroller,
                              autofocus: true,
                              decoration: InputDecoration(
                                hintText: 'Enter new task title',
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text('Cancel'),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  context.read<SaveTask>().editTask(index, editcontroller.text);
                                  Navigator.of(context).pop();
                                },
                                child: Text('Save'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
