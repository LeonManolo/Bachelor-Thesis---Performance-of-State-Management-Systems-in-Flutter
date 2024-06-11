import 'package:performance_test/shared/models/models.dart';

enum TodosVisibilityFilter { all, active, completed }

extension TodosViewFilterX on TodosVisibilityFilter {
  bool apply(TodoItem todo) {
    switch (this) {
      case TodosVisibilityFilter.all:
        return true;
      case TodosVisibilityFilter.active:
        return !todo.completed;
      case TodosVisibilityFilter.completed:
        return todo.completed;
    }
  }

  Iterable<TodoItem> applyAll(Iterable<TodoItem> todos) {
    return todos.where(apply);
  }
}