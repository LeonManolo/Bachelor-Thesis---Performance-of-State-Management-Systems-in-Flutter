// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TodosStore on _TodosStore, Store {
  Computed<ObservableList<TodoItem>>? _$filteredTodosComputed;

  @override
  ObservableList<TodoItem> get filteredTodos => (_$filteredTodosComputed ??=
          Computed<ObservableList<TodoItem>>(() => super.filteredTodos,
              name: '_TodosStore.filteredTodos'))
      .value;
  Computed<int>? _$todoCountComputed;

  @override
  int get todoCount => (_$todoCountComputed ??=
          Computed<int>(() => super.todoCount, name: '_TodosStore.todoCount'))
      .value;
  Computed<int>? _$activeTodoCountComputed;

  @override
  int get activeTodosCount =>
      (_$activeTodoCountComputed ??= Computed<int>(() => super.activeTodosCount,
              name: '_TodosStore.activeTodoCount'))
          .value;
  Computed<int>? _$completedTodoCountComputed;

  @override
  int get completedTodosCount => (_$completedTodoCountComputed ??= Computed<int>(
          () => super.completedTodosCount,
          name: '_TodosStore.completedTodoCount'))
      .value;

  late final _$todosAtom = Atom(name: '_TodosStore.todos', context: context);

  @override
  ObservableList<TodoItem> get todos {
    _$todosAtom.reportRead();
    return super.todos;
  }

  @override
  set todos(ObservableList<TodoItem> value) {
    _$todosAtom.reportWrite(value, super.todos, () {
      super.todos = value;
    });
  }

  late final _$visibilityFilterAtom =
      Atom(name: '_TodosStore.visibilityFilter', context: context);

  @override
  TodosVisibilityFilter get visibilityFilter {
    _$visibilityFilterAtom.reportRead();
    return super.visibilityFilter;
  }

  @override
  set visibilityFilter(TodosVisibilityFilter value) {
    _$visibilityFilterAtom.reportWrite(value, super.visibilityFilter, () {
      super.visibilityFilter = value;
    });
  }

  late final _$loadTodosAsyncAction =
      AsyncAction('_TodosStore.loadTodos', context: context);

  @override
  Future<void> loadTodos() {
    return _$loadTodosAsyncAction.run(() => super.loadTodos());
  }

  late final _$addTodoAsyncAction =
      AsyncAction('_TodosStore.addTodo', context: context);

  @override
  Future<void> addTodo(TodoItem todo) {
    return _$addTodoAsyncAction.run(() => super.addTodo(todo));
  }

  late final _$deleteTodoAsyncAction =
      AsyncAction('_TodosStore.deleteTodo', context: context);

  @override
  Future<void> deleteTodo(String todoId) {
    return _$deleteTodoAsyncAction.run(() => super.deleteTodo(todoId));
  }

  late final _$updateTodoAsyncAction =
      AsyncAction('_TodosStore.updateTodo', context: context);

  @override
  Future<void> updateTodo(String todoId, {String? title, bool? completed}) {
    return _$updateTodoAsyncAction.run(
        () => super.updateTodo(todoId, title: title, completed: completed));
  }

  @override
  String toString() {
    return '''
todos: ${todos},
visibilityFilter: ${visibilityFilter},
filteredTodos: ${filteredTodos},
todoCount: ${todoCount},
activeTodoCount: ${activeTodosCount},
completedTodoCount: ${completedTodosCount}
    ''';
  }
}
