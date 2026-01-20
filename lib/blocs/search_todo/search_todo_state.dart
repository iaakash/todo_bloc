part of 'search_todo_bloc.dart';

class SearchTodoState extends Equatable {
  const SearchTodoState(this.searchString);
  final String searchString;

  factory SearchTodoState.initial() {
    return SearchTodoState('');
  }
  @override
  List<Object> get props => [searchString];

  SearchTodoState copyWith({String? searchString}) {
    return SearchTodoState(searchString ?? this.searchString);
  }

  @override
  String toString() => 'SearchTodoState(searchString: $searchString)';
}
