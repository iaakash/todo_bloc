part of 'todos_filtered_bloc.dart';

class TodosFilteredState extends Equatable {
  const TodosFilteredState(this.filteredTodos);

  final List<Todo> filteredTodos;

  factory TodosFilteredState.initial() {
    return TodosFilteredState([]);
  }
  @override
  List<Object> get props => [filteredTodos];

  TodosFilteredState copyWith({List<Todo>? filteredTodos}) {
    return TodosFilteredState(filteredTodos ?? this.filteredTodos);
  }
}
