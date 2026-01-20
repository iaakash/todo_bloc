part of 'active_todo_count_bloc.dart';

class ActiveTodoCountState extends Equatable {
  const ActiveTodoCountState(this.activeTodoCount);

  final int activeTodoCount;

  @override
  List<Object> get props => [activeTodoCount];

  ActiveTodoCountState copyWith({int? activeTodoCount}) {
    return ActiveTodoCountState(activeTodoCount ?? this.activeTodoCount);
  }
}
