import 'package:equatable/equatable.dart';
import 'package:todo_bloc/utils/enums/filter_enum.dart';

class TodoFilterState extends Equatable {
  final Filter filter;

  const TodoFilterState({
    required this.filter,
  });

  TodoFilterState copyWith({
    Filter? filter,
  }) {
    return TodoFilterState(
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [filter];

  factory TodoFilterState.initial() {
    return const TodoFilterState(filter: Filter.all);
  }
}
