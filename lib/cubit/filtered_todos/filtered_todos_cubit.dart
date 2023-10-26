import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:todo_bloc/cubit/filtered_todos/filtered_todos_state.dart';
import 'package:todo_bloc/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:todo_bloc/cubit/todo_filter/todo_filter_state.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_state.dart';
import 'package:todo_bloc/cubit/todo_search/todo_search_cubit.dart';
import 'package:todo_bloc/cubit/todo_search/todo_search_state.dart';
import 'package:todo_bloc/models/todo_model.dart';
import 'package:todo_bloc/utils/enums/filter_enum.dart';

class FilteredTodosCubit extends Cubit<FilteredTodosState> {
  final TodoFilterCubit todoFilterCubit;
  final TodoSearchCubit todoSearchCubit;
  final TodoListCubit todoListCubit;
  late StreamSubscription todoFilterSubscription;
  late StreamSubscription todoSearchSubscription;
  late StreamSubscription todoListSubscription;
  FilteredTodosCubit({
    required this.todoFilterCubit,
    required this.todoListCubit,
    required this.todoSearchCubit,
  }) : super(FilteredTodosState.initial()) {
    todoFilterSubscription =
        todoFilterCubit.stream.listen((TodoFilterState todoFilterState) {
      setFilteredTodos();
    });
    todoSearchSubscription =
        todoSearchCubit.stream.listen((TodoSearchState todoSearchState) {
      setFilteredTodos();
    });

    todoListSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      setFilteredTodos();
    });
  }

  void setFilteredTodos() {
    List<Todo> filteredTodos;

    switch (todoFilterCubit.state.filter) {
      case Filter.active:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => !todo.isCompleted)
            .toList();
        break;

      case Filter.completed:
        filteredTodos = todoListCubit.state.todos
            .where((Todo todo) => todo.isCompleted)
            .toList();
        break;

      case Filter.all:
        filteredTodos = todoListCubit.state.todos;
        break;
    }

    if (todoSearchCubit.state.searchTerm.isNotEmpty) {
      filteredTodos = filteredTodos
          .where((Todo todo) => todo.description
              .toLowerCase()
              .contains(todoSearchCubit.state.searchTerm))
          .toList();
    }
    emit(state.copyWith(filteredTodos: filteredTodos));
  }

  @override
  Future<void> close() {
    todoFilterSubscription.cancel();
    todoListSubscription.cancel();
    todoSearchSubscription.cancel();
    return super.close();
  }
}
