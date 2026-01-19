import 'package:bloc/bloc.dart';
import 'package:bloc_todo/models/todo.model.dart';
import 'package:equatable/equatable.dart';

part 'todos_filtered_event.dart';
part 'todos_filtered_state.dart';

class TodosFilteredBloc extends Bloc<TodosFilteredEvent, TodosFilteredState> {
  TodosFilteredBloc() : super(TodosFilteredState.initial()) {
    on<SetFilteredTodosEvent>((event, emit) {
      emit(state.copyWith(filteredTodos: event.todoList));
    });
  }
}
