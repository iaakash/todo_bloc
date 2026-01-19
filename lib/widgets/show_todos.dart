import 'package:bloc_todo/blocs/todos_filtered/bloc/todos_filtered_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloc_todo/blocs/todo_list/todolist_bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:bloc_todo/widgets/todo_item.dart';

class ShowTodos extends StatelessWidget {
  const ShowTodos({super.key});

  void onToDoCheck(Todo todo, BuildContext ctx) {
    ctx.read<TodolistBloc>().add(ToggleTodoEvent(id: todo.id as String));
  }

  void openEditModal(BuildContext ctx, Todo todo) {
    final editTextController = TextEditingController();

    // TODO: Error handling inside modal
    showDialog(
      context: ctx,
      builder: (ctx) {
        editTextController.text = todo.desc;
        return AlertDialog(
          title: Text('Edit Todo'),
          content: TextField(controller: editTextController, autofocus: true),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                ctx.read<TodolistBloc>().add(
                  UpdateTodoEvent(
                    id: todo.id as String,
                    description: editTextController.text,
                  ),
                );
                Navigator.pop(ctx);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // To read state value
    final List<Todo> todoList = context
        .watch<TodosFilteredBloc>()
        .state
        .filteredTodos;

    return Expanded(
      child: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          final todo = todoList[index];

          return DismissableListItem(
            todos: todoList,
            idx: index,
            onToDoCheck: onToDoCheck,
            openEditModal: openEditModal,
          );
        },
      ),
    );
  }
}

class DismissableListItem extends StatelessWidget {
  const DismissableListItem({
    Key? key,
    required this.todos,
    required this.idx,
    required this.onToDoCheck,
    required this.openEditModal,
  }) : super(key: key);
  final List<Todo> todos;
  final int idx;
  final Function onToDoCheck;
  final Function openEditModal;
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(todos[idx].id),
      background: showBackground(0),
      secondaryBackground: showBackground(1),
      onDismissed: (_) => context.read<TodolistBloc>().add(
        DeleteTodoEvent(id: todos[idx].id as String),
      ),
      confirmDismiss: (_) {
        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Are you sure?'),
              content: Text('Do you really want to delete ${todos[idx].desc}'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: Text('No'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: Text('Yes'),
                ),
              ],
            );
          },
        );
      },
      child: TodoItem(
        todo: todos[idx],
        onTodoCheck: (todo) {
          onToDoCheck(todo, context);
        },
        onTodoTap: (Todo todo) {
          openEditModal(context, todo);
        },
      ),
    );
  }
}

Widget showBackground(int direction) {
  return Container(
    margin: const EdgeInsets.all(4.0),
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    color: Colors.red,
    alignment: direction == 0 ? Alignment.centerLeft : Alignment.centerRight,
    child: const Icon(Icons.delete, size: 30.0, color: Colors.white),
  );
}
