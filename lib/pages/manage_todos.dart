import 'package:bloc_todo/widgets/create_todo.dart';
import 'package:bloc_todo/widgets/show_todos.dart';
import 'package:flutter/material.dart';

class ManageTodos extends StatelessWidget {
  const ManageTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: Column(children: [CreateTodo(), SizedBox(height: 20), ShowTodos()]),
    );
  }
}
