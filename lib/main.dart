import 'package:bloc_todo/blocs/todo_active/bloc/active_todo_count_bloc.dart';
import 'package:bloc_todo/blocs/todo_filter/bloc/todo_filter_bloc.dart';
import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:bloc_todo/blocs/todos_filtered/bloc/todos_filtered_bloc.dart';
import 'package:bloc_todo/pages/manage_todos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodolistBloc()),
        BlocProvider(create: (context) => ActiveTodoCountBloc()),
        BlocProvider(create: (context) => TodoFilterBloc()),
        BlocProvider(create: (context) => TodosFilteredBloc()),
      ],
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const ManageTodos(),
      ),
    );
  }
}
