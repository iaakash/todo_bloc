import 'package:bloc_todo/blocs/todo_active/active_todo_count_bloc.dart';
import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoHeader extends StatelessWidget {
  const TodoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Todo', style: TextStyle(fontSize: 42)),
          BlocListener<TodolistBloc, TodolistState>(
            listener: (context, state) {
              final int activeTodoCount = state.todolist
                  .where((Todo todo) => !todo.completed)
                  .toList()
                  .length;

              context.read<ActiveTodoCountBloc>().add(
                CalculateActiveTodoCountEvent(activeTodoCount: activeTodoCount),
              );
            },
            child: BlocBuilder<ActiveTodoCountBloc, ActiveTodoCountState>(
              builder: (context, state) {
                return Text(
                  '${state.activeTodoCount}',
                  style: TextStyle(fontSize: 32, color: Colors.deepOrange),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
