import 'package:flutter/material.dart';
import 'package:todo_bloc/cubit/cubits.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/pages/components/create_todo.dart';
import 'package:todo_bloc/pages/components/todo_header.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              children: [
                TodoHeader(),
                CreateTodo(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
