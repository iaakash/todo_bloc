part of 'todolist_bloc.dart';

class TodolistState extends Equatable {
  final List<Todo> todolist;

  const TodolistState(this.todolist);

  factory TodolistState.initial() {
    return TodolistState([
      Todo(id: '1', desc: 'One', completed: false),
      // Todo(id: '2', desc: 'Two', completed: false),
      // Todo(id: '3', desc: 'Three', completed: false),
      // Todo(id: '4', desc: 'Four', completed: false),
    ]);
  }

  @override
  List<Object> get props => [todolist];

  TodolistState copyWith({List<Todo>? todolist}) {
    return TodolistState(todolist ?? this.todolist);
  }
}
