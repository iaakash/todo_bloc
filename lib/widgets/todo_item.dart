import 'package:flutter/material.dart';

import 'package:bloc_todo/models/todo.model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem({
    Key? key,
    required this.todo,
    required this.onTodoCheck,
    required this.onTodoTap,
  }) : super(key: key);
  final Todo todo;
  final Function onTodoCheck;
  final Function onTodoTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: todo.completed,
        onChanged: (bool? checked) {
          onTodoCheck(todo);
        },
      ),
      title: Text(todo.desc),
      onTap: () {
        onTodoTap(todo);
      },
    );
  }
}
