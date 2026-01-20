part of 'search_todo_bloc.dart';

sealed class SearchTodoEvent extends Equatable {
  const SearchTodoEvent();

  @override
  List<Object> get props => [];
}

class SetSearchTermEvent extends SearchTodoEvent {
  final String searchString;

  const SetSearchTermEvent({required this.searchString});
}
