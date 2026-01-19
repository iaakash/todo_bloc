part of 'todos_filtered_bloc.dart';

sealed class TodosFilteredEvent extends Equatable {
  const TodosFilteredEvent();

  @override
  List<Object> get props => [];
}

class SetFilteredTodosEvent extends TodosFilteredEvent {
  final List<Todo> todoList;

  const SetFilteredTodosEvent({required this.todoList});
}
