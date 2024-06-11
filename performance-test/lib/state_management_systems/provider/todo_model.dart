import 'dart:collection';

import 'package:flutter/widgets.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/repositories/repositories.dart';

class TodoModel extends ChangeNotifier {
  TodoModel({TodoRepository? todoRepository})
      : _todoRepository = todoRepository ?? FakeTodoRepository();

  final TodoRepository _todoRepository;

  List<TodoItem> _todos = [];
  TodosVisibilityFilter _filter = TodosVisibilityFilter.all;

  TodosVisibilityFilter get filter => _filter;

  set filter(TodosVisibilityFilter filter) {
    _filter = filter;
    notifyListeners();
  }

  UnmodifiableListView<TodoItem> get todos => UnmodifiableListView(_todos);

  UnmodifiableListView<TodoItem> get filteredTodos {
    return UnmodifiableListView(_filter.applyAll(_todos));
  }

  int get todoCount => _todos.length;

  int get activeTodosCount =>
      TodosVisibilityFilter.active.applyAll(_todos).length;

  int get completedTodosCount =>
      TodosVisibilityFilter.completed.applyAll(_todos).length;

  Future<void> loadTodos() async {
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    _todos = [...fetchedTodos];
    notifyListeners();
  }

  Future<void> addTodo(TodoItem todo) async {
    await _todoRepository.addTodoItem(todo);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    _todos = [...fetchedTodos];
    notifyListeners();
  }

  Future<void> deleteTodo(String todoId) async {
    await _todoRepository.deleteTodoItem(todoId);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    _todos = [...fetchedTodos];
    notifyListeners();
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
    _todos = [...fetchedTodos];
    notifyListeners();
  }
}
