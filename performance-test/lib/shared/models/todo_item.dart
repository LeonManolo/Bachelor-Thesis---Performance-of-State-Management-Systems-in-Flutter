import 'package:equatable/equatable.dart';

class TodoItem extends Equatable {
  const TodoItem({
    required this.id,
    required this.title,
    required this.completed,
  });

  final String id;
  final String title;
  final bool completed;

  TodoItem copyWith({
    String? todoId,
    String? title,
    bool? completed,
  }) =>
      TodoItem(
        id: todoId ?? id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );

  @override
  List<Object?> get props => [
        id,
        title,
        completed,
      ];
}
