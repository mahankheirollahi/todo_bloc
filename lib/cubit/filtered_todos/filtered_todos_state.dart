import 'package:equatable/equatable.dart';
import 'package:todo_bloc/models/todo_model.dart';

class FilteredTodosState extends Equatable {
  final List<Todo> filteredTodos;
  const FilteredTodosState({required this.filteredTodos});

  FilteredTodosState copyWith({
    List<Todo>? filteredTodos,
  }) {
    return FilteredTodosState(
      filteredTodos: filteredTodos ?? this.filteredTodos,
    );
  }

  @override
  List<Object> get props => [filteredTodos];

  factory FilteredTodosState.initial() {
    return const FilteredTodosState(filteredTodos: []);
  }
}
