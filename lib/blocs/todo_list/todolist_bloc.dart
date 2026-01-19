import 'package:bloc/bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:equatable/equatable.dart';

part 'todolist_event.dart';
part 'todolist_state.dart';

class TodolistBloc extends Bloc<TodolistEvent, TodolistState> {
  TodolistBloc() : super(TodolistState.initial()) {
    on<AddTodoEvent>(_onAddTodo);
    on<ToggleTodoEvent>(_onToggleTodo);
    on<UpdateTodoEvent>(_onUpdateTodo);
    on<DeleteTodoEvent>(_onDeleteTodo);
  }

  void _onAddTodo(AddTodoEvent event, Emitter<TodolistState> emit) {
    final newTodo = Todo(desc: event.description);
    final allTodos = [...state.todolist, newTodo];

    emit(state.copyWith(todolist: allTodos));
  }

  void _onToggleTodo(ToggleTodoEvent event, Emitter<TodolistState> emit) {
    final newTodos = state.todolist.map((Todo todo) {
      if (todo.id == event.id) {
        return Todo(desc: todo.desc, id: todo.id, completed: !todo.completed);
      }
      return todo;
    }).toList();

    emit(state.copyWith(todolist: newTodos));
  }

  void _onUpdateTodo(UpdateTodoEvent event, Emitter<TodolistState> emit) {
    final newTodoList = state.todolist.map((Todo todo) {
      if (todo.id == event.id) {
        return Todo(
          desc: event.description,
          id: event.id,
          completed: todo.completed,
        );
      }
      return todo;
    }).toList();
    emit(state.copyWith(todolist: newTodoList));
  }

  void _onDeleteTodo(DeleteTodoEvent event, Emitter<TodolistState> emit) {
    final newTodoList = state.todolist
        .where((Todo todo) => todo.id != event.id)
        .toList();

    emit(state.copyWith(todolist: newTodoList));
  }
}
