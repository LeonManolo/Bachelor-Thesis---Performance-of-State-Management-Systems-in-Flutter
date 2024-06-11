import 'package:mobx/mobx.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/repositories/repositories.dart';

part 'todos_store.g.dart';

class TodosStore = _TodosStore with _$TodosStore;

/// flutter pub run build_runner build
abstract class _TodosStore with Store {
  final TodoRepository _todoRepository = FakeTodoRepository();

  @observable
  ObservableList<TodoItem> todos = ObservableList<TodoItem>();

  @observable
  TodosVisibilityFilter visibilityFilter = TodosVisibilityFilter.all;

  @computed
  ObservableList<TodoItem> get filteredTodos =>
      ObservableList.of(visibilityFilter.applyAll(todos));

  @computed
  int get todoCount => todos.length;

  @computed
  int get activeTodosCount =>
      TodosVisibilityFilter.active.applyAll(todos).length;

  @computed
  int get completedTodosCount =>
      TodosVisibilityFilter.completed.applyAll(todos).length;

  Future<void> _updateTodos() async {
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos = ObservableList.of([...fetchedTodos]);
  }

  @action
  Future<void> loadTodos() async {
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos = ObservableList.of([...fetchedTodos]);
  }

  @action
  Future<void> addTodo(TodoItem todo) async {
    await _todoRepository.addTodoItem(todo);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos = ObservableList.of([...fetchedTodos]);
  }

  @action
  Future<void> deleteTodo(String todoId) async {
    await _todoRepository.deleteTodoItem(todoId);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos = ObservableList.of([...fetchedTodos]);
  }

  @action
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
    todos = ObservableList.of([...fetchedTodos]);
  }
}
