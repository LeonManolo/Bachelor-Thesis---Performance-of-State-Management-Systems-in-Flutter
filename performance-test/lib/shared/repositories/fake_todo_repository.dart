import 'package:performance_test/shared/models/todo_item.dart';
import 'package:performance_test/shared/repositories/repositories.dart';

final class FakeTodoRepository implements TodoRepository {

   FakeTodoRepository({List<TodoItem>? initialTodoList})
      : _todoList = initialTodoList ?? [...initialTodos];

  static const initialTodos = <TodoItem>[
    TodoItem(id: '1', title: 'Todo 1', completed: false),
    TodoItem(id: '2', title: 'Todo 2', completed: false),
    TodoItem(id: '3', title: 'Todo 3', completed: false),
    TodoItem(id: '4', title: 'Todo 4', completed: false),
    TodoItem(id: '5', title: 'Todo 5', completed: false),
  ];
  final List<TodoItem> _todoList;

  @override
  Future<void> addTodoItem(TodoItem item) async {
    //await Future<void>.delayed(const Duration(milliseconds: 10));
    _todoList.add(item);
  }

  @override
  Future<void> deleteTodoItem(String id) async {
    //await Future<void>.delayed(const Duration(milliseconds: 10));
    _todoList.removeWhere((todoItem) => todoItem.id == id);
  }

  @override
  Future<List<TodoItem>> fetchTodoItems() async {
    //await Future<void>.delayed(const Duration(milliseconds: 0));
    return [..._todoList];
  }

  @override
  Future<void> updateTodoItem(String todoId, {String? title, bool? completed}) async {
    //await Future<void>.delayed(const Duration(milliseconds: 10));
    final index = _todoList.indexWhere((element) => element.id == todoId);
    if (index != -1) {
      _todoList[index] = _todoList[index].copyWith(
        title: title,
        completed: completed,
      );
    }
  }
}
