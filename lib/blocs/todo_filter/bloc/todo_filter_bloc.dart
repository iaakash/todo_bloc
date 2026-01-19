import 'package:bloc/bloc.dart';
import 'package:bloc_todo/models/todo_filters.enum.dart';
import 'package:equatable/equatable.dart';

part 'todo_filter_event.dart';
part 'todo_filter_state.dart';

class TodoFilterBloc extends Bloc<TodoFilterEvent, TodoFilterState> {
  TodoFilterBloc() : super(TodoFilterState.initial()) {
    on<ChangeActiveFilter>((event, emit) {
      emit(state.copyWith(activeFilter: event.activeFilter));
    });
  }
}
