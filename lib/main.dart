import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/active_todo_count/active_todo_count_cubit.dart';
import 'package:todo_bloc/cubit/filtered_todos/filtered_todos_cubit.dart';
import 'package:todo_bloc/cubit/todo_filter/todo_filter_cubit.dart';
import 'package:todo_bloc/cubit/todo_list/todo_list_cubit.dart';
import 'package:todo_bloc/cubit/todo_search/todo_search_cubit.dart';

void main() {
  runApp(
    const MainApp(),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoFilterCubit>(create: (context) => TodoFilterCubit()),
        BlocProvider<TodoSearchCubit>(create: (context) => TodoSearchCubit()),
        BlocProvider<TodoListCubit>(create: (context) => TodoListCubit()),
        BlocProvider<ActiveTodoCountCubit>(
            create: (context) => ActiveTodoCountCubit(
                todoListCubit: BlocProvider.of<TodoListCubit>(context))),
        BlocProvider<FilteredTodosCubit>(
            create: (context) => FilteredTodosCubit(
                todoFilterCubit: BlocProvider.of<TodoFilterCubit>(context),
                todoListCubit: BlocProvider.of<TodoListCubit>(context),
                todoSearchCubit: BlocProvider.of<TodoSearchCubit>(context))),
      ],
      child: MaterialApp(
        title: 'TODO',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const Scaffold(
          body: Center(
            child: Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
