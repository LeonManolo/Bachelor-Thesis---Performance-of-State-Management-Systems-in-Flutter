import 'package:flutter/material.dart';
import 'package:performance_test/shared/models/models.dart';

typedef UpdateTodoCallback = void Function(
  String todoId, {
  String? title,
  bool? completed,
});

class TodoListView extends StatelessWidget {
  const TodoListView({
    required this.todos,
    required this.onDelete,
    required this.onUpdate,
    required this.onRefresh,
    super.key,
  });

  final List<TodoItem> todos;

  final void Function(String todoId) onDelete;
  final UpdateTodoCallback onUpdate;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: RefreshIndicator(
        onRefresh: onRefresh,
        child: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) => TodoListTile(
            todo: todos[index],
            onUpdate: onUpdate,
            onDelete: onDelete,
          ),
        ),
      ),
    );
  }
}

/// A provider which exposes the [Todo] displayed by a [TodoItem].
///
/// By retrieving the [Todo] through a provider instead of through its
/// constructor, this allows [TodoItem] to be instantiated using the `const` keyword.
///
/// This ensures that when we add/remove/edit todos, only what the
/// impacted widgets rebuilds, instead of the entire list of items.
class TodoListTile extends StatelessWidget {
  const TodoListTile({super.key,
    required this.todo,
    required this.onDelete,
    required this.onUpdate,
  });

  final TodoItem todo;
  final void Function(String todoId) onDelete;
  final UpdateTodoCallback onUpdate;

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      value: todo.completed,
      title: Text(todo.title),
      secondary: IconButton(
        onPressed: () => onDelete(todo.id),
        icon: const Icon(Icons.delete_outline_rounded),
      ),
      onChanged: (bool? value) {
        onUpdate(todo.id, completed: value);
      },
    );
  }
}
