import 'package:equatable/equatable.dart';

class ActiveTodoCountState extends Equatable {
  final int activeTodoAcount;
  const ActiveTodoCountState({required this.activeTodoAcount});

  ActiveTodoCountState copyWith({
    int? activeTodoAcount,
  }) {
    return ActiveTodoCountState(
      activeTodoAcount: activeTodoAcount ?? this.activeTodoAcount,
    );
  }

  @override
  List<Object> get props => [activeTodoAcount];

  factory ActiveTodoCountState.initial() {
    return const ActiveTodoCountState(activeTodoAcount: 0);
  }
}
