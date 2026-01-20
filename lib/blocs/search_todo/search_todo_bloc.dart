import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_todo_event.dart';
part 'search_todo_state.dart';

class SearchTodoBloc extends Bloc<SearchTodoEvent, SearchTodoState> {
  SearchTodoBloc() : super(SearchTodoState.initial()) {
    on<SetSearchTermEvent>((event, emit) {
      emit(state.copyWith(searchString: event.searchString));
    });
  }
}
