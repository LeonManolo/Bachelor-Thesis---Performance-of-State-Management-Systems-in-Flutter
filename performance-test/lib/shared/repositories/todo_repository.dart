import 'package:performance_test/shared/models/models.dart';

abstract interface class TodoRepository {
  Future<List<TodoItem>> fetchTodoItems();
  Future<void> addTodoItem(TodoItem item);
  Future<void> updateTodoItem(String todoId, {String? title, bool? completed});
  Future<void> deleteTodoItem(String id);
}