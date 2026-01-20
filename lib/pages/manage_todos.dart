import 'package:bloc_todo/blocs/todo_filter/bloc/todo_filter_bloc.dart';
import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:bloc_todo/blocs/todos_filtered/bloc/todos_filtered_bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:bloc_todo/models/todo_filters.enum.dart';
import 'package:bloc_todo/widgets/create_todo.dart';
import 'package:bloc_todo/widgets/search_with_filter_todos.dart';
import 'package:bloc_todo/widgets/show_todos.dart';
import 'package:bloc_todo/widgets/todo_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageTodos extends StatelessWidget {
  const ManageTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: Column(
        children: [
          TodoHeader(),
          CreateTodo(),
          SearchAndFilterTodos(),
          SizedBox(height: 20),
          ShowTodos(),
        ],
      ),
    );
  }
}
