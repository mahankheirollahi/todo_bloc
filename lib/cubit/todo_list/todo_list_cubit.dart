import 'package:bloc/bloc.dart';
import 'package:todo_bloc/cubit/todo_filter/todo_filter_state.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_state.dart';
import 'package:todo_bloc/models/todo_model.dart';

class TodoListCubit extends Cubit<TodoListState> {
  TodoListCubit() : super(TodoListState.initial());

  void addTodo(String description) {
    final newTodo = Todo(description: description);
    final newsTodos = [...state.todos, newTodo];
    emit(state.copyWith(todos: newsTodos));
  }

  void editTodo(String id, String description) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
            id: id, description: description, isCompleted: todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void toggleTodo(String id) {
    final newTodos = state.todos.map((Todo todo) {
      if (todo.id == id) {
        return Todo(
            id: id,
            description: todo.description,
            isCompleted: !todo.isCompleted);
      }
      return todo;
    }).toList();
    emit(state.copyWith(todos: newTodos));
  }

  void removeTodo(Todo todo) {
    final newTodos = state.todos.where((Todo t) => t.id != todo.id).toList();
    emit(state.copyWith(todos: newTodos));
  }
}
