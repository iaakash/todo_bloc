import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'active_todo_count_event.dart';
part 'active_todo_count_state.dart';

class ActiveTodoCountBloc
    extends Bloc<ActiveTodoCountEvent, ActiveTodoCountState> {
  final int initialCount;

  ActiveTodoCountBloc({required this.initialCount})
    : super(ActiveTodoCountState(initialCount)) {
    on<CalculateActiveTodoCountEvent>((
      CalculateActiveTodoCountEvent event,
      emit,
    ) {
      emit(state.copyWith(activeTodoCount: event.activeTodoCount));
    });
  }
}
