import 'package:bloc_todo/blocs/bloc/todolist_bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({super.key});

  @override
  Widget build(BuildContext context) {
    // To read state value
    final List<Todo> todoList = context.watch<TodolistBloc>().state.todolist;

    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          final todo = todoList[index];

          return ListTile(
            leading: Icon(
              todo.completed
                  ? Icons.check_circle
                  : Icons.radio_button_unchecked,
              color: todo.completed ? Colors.green : Colors.grey,
            ),
            title: Text(
              todo.desc,
              style: TextStyle(
                decoration: todo.completed ? TextDecoration.lineThrough : null,
              ),
            ),
          );
        },
      ),
    );
  }
}
