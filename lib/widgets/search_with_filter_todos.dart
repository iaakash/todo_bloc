import 'package:bloc_todo/blocs/todo_filter/todo_filter_bloc.dart';
import 'package:bloc_todo/models/todo_filters.enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchAndFilterTodos extends StatelessWidget {
  const SearchAndFilterTodos({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [toDoFilters(context)]);
  }
}

Widget toDoFilters(context) {
  return Row(
    children: [
      filterButton(context, 'All', Filter.all),
      filterButton(context, 'Active', Filter.active),
      filterButton(context, 'Completed', Filter.completed),
    ],
  );
}

Widget filterButton(BuildContext context, String text, Filter filter) {
  return TextButton(
    onPressed: () {
      print(filter);
      context.read<TodoFilterBloc>().add(
        ChangeActiveFilter(activeFilter: filter),
      );
    },
    child: Text(text),
  );
}
