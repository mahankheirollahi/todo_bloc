import 'package:equatable/equatable.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoCount;
  const ActiveTodoCountState({required this.activeTodoCount});

  ActiveTodoCountState copyWith({
    int? activeTodoAcount,
  }) {
    return ActiveTodoCountState(
      activeTodoCount: activeTodoAcount ?? this.activeTodoCount,
    );
  }

  @override
  List<Object> get props => [activeTodoCount];

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoCount: 0);
  }
}
