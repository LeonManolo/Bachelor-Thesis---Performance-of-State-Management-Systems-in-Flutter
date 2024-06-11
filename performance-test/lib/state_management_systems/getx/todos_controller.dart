
import 'package:get/get.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/repositories/repositories.dart';

abstract class Testl {
  abstract String widget;
}


class TodosController extends GetxController {
  TodosController({TodoRepository? todoRepository})
      : _todoRepository = todoRepository ?? FakeTodoRepository();
  final TodoRepository _todoRepository;

  /// You do not need that. I recommend using it just for ease of syntax.
  /// with static method: Controller.to.increment();
  /// with no static method: Get.find<Controller>().increment();
  /// There is no difference in performance, nor any side effect of using either syntax. Only one does not need the type, and the other the IDE will autocomplete it.
  static TodosController get to => Get.find();

  RxList<TodoItem> todos = <TodoItem>[].obs;
  Rx<TodosVisibilityFilter> visibilityFilter = TodosVisibilityFilter.all.obs;

  Iterable<TodoItem> get filteredTodos =>
      visibilityFilter.value.applyAll(todos);

  int get todoCount => todos.length;

  int get activeTodosCount =>
      TodosVisibilityFilter.active.applyAll(todos).length;

  int get completedTodosCount =>
      TodosVisibilityFilter.completed.applyAll(todos).length;

  @override
  void onInit() {
    loadTodos();
    super.onInit();
  }

  Future<void> loadTodos() async {
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos.value = fetchedTodos;
  }

  Future<void> addTodo(TodoItem todo) async {
    await _todoRepository.addTodoItem(todo);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos.value = fetchedTodos;
  }

  Future<void> deleteTodo(String todoId) async {
    await _todoRepository.deleteTodoItem(todoId);
    final fetchedTodos = await _todoRepository.fetchTodoItems();
    todos.value = fetchedTodos;
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
    todos.value = fetchedTodos;
  }
}
