import 'package:bloc/bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:equatable/equatable.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  TodolistBloc() : super(TodolistState.initial()) {
    on<AddTodoEvent>(_onAddTodo);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodolistState> emit) {
    final newTodo = Todo(desc: event.description);
    final allTodos = [...state.todolist, newTodo];

    emit(state.copyWith(todolist: allTodos));
  }
}
