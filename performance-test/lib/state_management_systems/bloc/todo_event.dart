part of 'todo_bloc.dart';

sealed class TodoEvent extends Equatable {
  const TodoEvent();
}

final class LoadTodos extends TodoEvent {
  const LoadTodos();

  @override
  List<Object?> get props => [];
}

final class AddTodo extends TodoEvent {

  const AddTodo({
    required this.todo,
  });
  final TodoItem todo;

  @override
  List<Object?> get props => [
        todo
      ];
}

final class DeleteTodo extends TodoEvent {

  const DeleteTodo({required this.todoId});
  final String todoId;

  @override
  List<Object?> get props => [todoId];
}

final class UpdateTodo extends TodoEvent {

  const UpdateTodo({
    required this.todoId,
    required this.title,
    required this.completed,
  });
  final String todoId;
  final String? title;
  final bool? completed;

  @override
  List<Object?> get props => [
        todoId,
        title,
        completed,
      ];
}

final class UpdateTodosFilter extends TodoEvent {
  const UpdateTodosFilter({required this.visibilityFilter});

  final TodosVisibilityFilter visibilityFilter;

  @override
  List<Object?> get props => [visibilityFilter];

}
