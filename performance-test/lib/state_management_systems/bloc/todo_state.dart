part of 'todo_bloc.dart';

final class TodoState extends Equatable {
  const TodoState({
    required this.todos,
    this.visibilityFilter = TodosVisibilityFilter.all,
  });

  final List<TodoItem> todos;
  final TodosVisibilityFilter visibilityFilter;

  /// defines the equality of different states
  @override
  List<Object?> get props => [
        todos,
        visibilityFilter,
      ];

  Iterable<TodoItem> get filteredTodos => visibilityFilter.applyAll(todos);

  int get todoCount => todos.length;

  int get activeTodosCount =>
      TodosVisibilityFilter.active.applyAll(todos).length;

  int get completedTodosCount =>
      TodosVisibilityFilter.completed.applyAll(todos).length;

  TodoState copyWith({
    List<TodoItem>? todos,
    TodosVisibilityFilter? visibilityFilter,
  }) =>
      TodoState(
        todos: todos ?? this.todos,
        visibilityFilter: visibilityFilter ?? this.visibilityFilter,
      );
}
