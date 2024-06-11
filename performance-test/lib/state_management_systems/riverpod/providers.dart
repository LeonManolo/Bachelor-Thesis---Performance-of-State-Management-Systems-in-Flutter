import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/repositories/repositories.dart';

final todoListProvider =
    NotifierProvider<TodoListNotifier, List<TodoItem>>(TodoListNotifier.new);

final todosVisibilityFilter = StateProvider((_) => TodosVisibilityFilter.all);

final filteredTodos = Provider<List<TodoItem>>((ref) {
  final filter = ref.watch(todosVisibilityFilter);
  final todos = ref.watch(todoListProvider);

  return filter.applyAll(todos).toList();
});

final todoCount = Provider<int>((ref) => ref.watch(todoListProvider).length);

final activeTodosCount = Provider<int>((ref) {
  final todos = ref.watch(todoListProvider);
  return TodosVisibilityFilter.active.applyAll(todos).length;
});

final completedTodosCount = Provider<int>((ref) {
  final todos = ref.watch(todoListProvider);
  return TodosVisibilityFilter.completed.applyAll(todos).length;
});

class TodoListNotifier extends Notifier<List<TodoItem>> {
  TodoListNotifier({TodoRepository? todoRepository})
      : _todoRepository = todoRepository ?? FakeTodoRepository();

  final TodoRepository _todoRepository;

  @override
  List<TodoItem> build() {
    loadTodos();
    return [];
  }

  Future<void> loadTodos() async {
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    state = [...fetchedTodos];
  }

  Future<void> addTodo(TodoItem todo) async {
    await _todoRepository.addTodoItem(todo);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    state = [...fetchedTodos];
  }

  Future<void> deleteTodo(String todoId) async {
    await _todoRepository.deleteTodoItem(todoId);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    state = [...fetchedTodos];
  }

  Future<void> updateTodo(
    String todoId, {
    String? title,
    bool? completed,
  }) async {
    await _todoRepository.updateTodoItem(
      todoId,
      title: title,
      completed: completed,
    );
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    state = [...fetchedTodos];
  }
}
