part of 'todolist_bloc.dart';

sealed class TodolistEvent extends Equatable {
  const TodolistEvent();

  @override
  List<Object> get props => [];
}

final class AddTodoEvent extends TodolistEvent {
  final String description;

  const AddTodoEvent({required this.description});

  @override
  List<Object> get props => [description];
}

final class ToggleTodoEvent extends TodolistEvent {
  final String id;

  const ToggleTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}

final class UpdateTodoEvent extends TodolistEvent {
  final String id;
  final String description;

  const UpdateTodoEvent({required this.id, required this.description});

  @override
  List<Object> get props => [description];
}

final class DeleteTodoEvent extends TodolistEvent {
  final String id;

  const DeleteTodoEvent({required this.id});

  @override
  List<Object> get props => [id];
}
