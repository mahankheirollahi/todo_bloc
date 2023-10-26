import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo_model.dart';

class TodoListState extends Equatable {
  final List<Todo> todos;
  const TodoListState({required this.todos});

  TodoListState copyWith({
    List<Todo>? todos,
  }) {
    return TodoListState(
      todos: todos ?? this.todos,
    );
  }

  @override
  List<Object> get props => [todos];

  factory TodoListState.initial() {
    return TodoListState(todos: [
      Todo(id: '1', description: 'Code Flutter'),
      Todo(id: '2', description: 'Workout'),
      Todo(id: '3', description: 'Read Book')
    ]);
  }
}
