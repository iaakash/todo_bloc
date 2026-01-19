import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreateTodo extends StatelessWidget {
  const CreateTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController addToDoController = TextEditingController();
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        controller: addToDoController,
        decoration: const InputDecoration(labelText: 'What to do?'),
        onSubmitted: (String todoDesc) {
          if (todoDesc != null && todoDesc.trim().isNotEmpty) {
            context.read<TodolistBloc>().add(
              AddTodoEvent(description: todoDesc),
            );
            addToDoController.text = '';
          }
        },
      ),
    );
  }
}
