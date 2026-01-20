import 'package:bloc_todo/blocs/search_todo/search_todo_bloc.dart';
import 'package:bloc_todo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:bloc_todo/blocs/todos_filtered/todos_filtered_bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:bloc_todo/models/todo_filters.enum.dart';
import 'package:bloc_todo/widgets/create_todo.dart';
import 'package:bloc_todo/widgets/search_todo.dart';
import 'package:bloc_todo/widgets/search_with_filter_todos.dart';
import 'package:bloc_todo/widgets/show_todos.dart';
import 'package:bloc_todo/widgets/todo_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ManageTodos extends StatelessWidget {
  const ManageTodos({super.key});

  List<Todo> setFilteredTodos(
    List<Todo> todos,
    Filter activeFilter,
    String searchTerm,
  ) {
    List<Todo> _filteredTodos;

    switch (activeFilter) {
      case Filter.active:
        _filteredTodos = todos.where((Todo todo) => !todo.completed).toList();
      case Filter.completed:
        _filteredTodos = todos.where((Todo todo) => todo.completed).toList();
      case Filter.all:
      default:
        _filteredTodos = todos;
    }

    _filteredTodos = _filteredTodos
        .where(
          (Todo todo) =>
              todo.desc.toLowerCase().contains(searchTerm.toLowerCase()),
        )
        .toList();

    return _filteredTodos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Todos')),
      body: MultiBlocListener(
        listeners: [
          BlocListener<TodolistBloc, TodolistState>(
            listener: (context, state) {
              print(state.todolist);
              print(context.read<TodoFilterBloc>().state.activeFilter);
              final List<Todo> filteredTodos = setFilteredTodos(
                state.todolist,
                context.read<TodoFilterBloc>().state.activeFilter,
                context.read<SearchTodoBloc>().state.searchString,
              );
              context.read<TodosFilteredBloc>().add(
                SetFilteredTodosEvent(todoList: filteredTodos),
              );
            },
          ),
          BlocListener<TodoFilterBloc, TodoFilterState>(
            listener: (context, state) {
              print(state.activeFilter);
              print(context.read<TodolistBloc>().state.todolist);
              final List<Todo> filteredTodos = setFilteredTodos(
                context.read<TodolistBloc>().state.todolist,
                state.activeFilter,
                context.read<SearchTodoBloc>().state.searchString,
              );
              context.read<TodosFilteredBloc>().add(
                SetFilteredTodosEvent(todoList: filteredTodos),
              );
            },
          ),
          BlocListener<SearchTodoBloc, SearchTodoState>(
            listener: (context, state) {
              final List<Todo> filteredTodos = setFilteredTodos(
                context.read<TodolistBloc>().state.todolist,
                context.read<TodoFilterBloc>().state.activeFilter,
                state.searchString,
              );
              context.read<TodosFilteredBloc>().add(
                SetFilteredTodosEvent(todoList: filteredTodos),
              );
            },
          ),
        ],
        child: Column(
          children: [
            TodoHeader(),
            SearchFilteredTodo(),
            CreateTodo(),
            SearchAndFilterTodos(),
            SizedBox(height: 20),
            ShowTodos(),
          ],
        ),
      ),
    );
  }
}
