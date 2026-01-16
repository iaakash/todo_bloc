part of 'todolist_bloc.dart';

sealed class TodolistEvent extends Equatable {
  const TodolistEvent();

  @override
  List<Object> get props => [];
}

final class AddTodoEvent extends TodolistEvent {
  final String description;

  const AddTodoEvent({required this.description});
}
