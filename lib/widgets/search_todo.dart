import 'package:bloc_todo/blocs/search_todo/search_todo_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchFilteredTodo extends StatelessWidget {
  const SearchFilteredTodo({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTodo = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: searchTodo,
        decoration: const InputDecoration(labelText: 'Search todo'),
        onChanged: (value) {
          print(value);
          context.read<SearchTodoBloc>().add(
            SetSearchTermEvent(searchString: value),
          );
        },
      ),
    );
  }
}
