part of 'todo_filter_bloc.dart';

class TodoFilterState extends Equatable {
  const TodoFilterState(this.activeFilter);
  final Filter activeFilter;

  factory TodoFilterState.initial() {
    return TodoFilterState(Filter.all);
  }
  @override
  List<Object> get props => [activeFilter];

  TodoFilterState copyWith({Filter? activeFilter}) {
    return TodoFilterState(activeFilter ?? this.activeFilter);
  }

  @override
  String toString() => 'TodoFilterState(activeFilter: $activeFilter)';
}
