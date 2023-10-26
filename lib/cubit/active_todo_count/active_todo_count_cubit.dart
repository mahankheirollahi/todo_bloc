import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:todo_bloc/cubit/active_todo_count/active_todo_count_state.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_state.dart';
import 'package:todo_bloc/models/todo_model.dart';

class ActiveTodoCountCubit extends Cubit<ActiveTodoCountState> {
  late final StreamSubscription todoListCubitSubscription;
  final TodoListCubit todoListCubit;
  ActiveTodoCountCubit({required this.todoListCubit})
      : super(ActiveTodoCountState.initial()) {
    todoListCubitSubscription =
        todoListCubit.stream.listen((TodoListState todoListState) {
      print(todoListState);

      final int currentActiveTodoCount = todoListState.todos
          .where((Todo todo) => !todo.isCompleted)
          .toList()
          .length;
      emit(state.copyWith(activeTodoAcount: currentActiveTodoCount));
    });
  }
  @override
  Future<void> close() {
    todoListCubitSubscription.cancel();
    return super.close();
  }
}
