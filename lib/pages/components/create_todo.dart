import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_bloc/cubit/cubits.dart';

class CreateTodo extends StatefulWidget {
  const CreateTodo({super.key});

  @override
  State<CreateTodo> createState() => _CreateTodoState();
}

class _CreateTodoState extends State<CreateTodo> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController newTodoController = TextEditingController();
    return TextField(
      controller: newTodoController,
      decoration: const InputDecoration(labelText: 'What to do?'),
      onSubmitted: (String? todoDescription) {
        if (todoDescription != null && todoDescription.trim().isNotEmpty) {
          context.read<TodoListCubit>().addTodo(todoDescription);
          newTodoController.clear();
        }
      },
    );
  }
}
