import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';


Uuid uuid = const Uuid();

class Todo extends Equatable {
  final String id;
  final String description;
  final bool isCompleted;

  Todo({String? id, required this.description, this.isCompleted = false})
      : id = id ?? uuid.v4();

  @override
  List<Object> get props => [id, description, isCompleted];
}
