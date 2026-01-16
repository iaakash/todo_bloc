import 'package:bloc_todo/blocs/bloc/todolist_bloc.dart';
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
    return BlocProvider(
      create: (context) => TodolistBloc(),
      child: MaterialApp(
        title: 'Todo',
        theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
        home: const ManageTodos(),
      ),
    );
  }
}
