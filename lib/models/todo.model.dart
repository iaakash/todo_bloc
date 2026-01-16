import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Todo extends Equatable {
  final String? id;
  final String desc;
  final bool completed;

  Todo({String? id, required this.desc, required this.completed})
    : id = id ?? Uuid().v4();

  @override
  String toString() => 'Todo(id: $id, desc: $desc, completed: $completed)';

  @override
  List<Object> get props => [?id, desc, completed];
}
