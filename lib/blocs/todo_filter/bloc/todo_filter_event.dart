part of 'todo_filter_bloc.dart';

sealed class TodoFilterEvent extends Equatable {
  const TodoFilterEvent();

  @override
  List<Object> get props => [];
}

class ChangeActiveFilter extends TodoFilterEvent {
  final Filter activeFilter;

  const ChangeActiveFilter({required this.activeFilter});

  @override
  List<Object> get props => [activeFilter];
}
