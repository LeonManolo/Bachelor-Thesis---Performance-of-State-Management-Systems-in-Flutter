import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:get/get.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/bloc/todo_bloc.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/mobx/mobx.dart';
import 'package:performance_test/state_management_systems/mobx/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/providers.dart';
import 'package:provider/provider.dart' as provider;

class TodoListViewSMWrapper extends StatelessWidget {
  const TodoListViewSMWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagement = StateManagementSelection.current();

    switch (stateManagement) {
      case StateManagementSelection.bloc:
        {
          final todoBloc = BlocProvider.of<TodoBloc>(context);
          return BlocBuilder<TodoBloc, TodoState>(
            builder: (_, state) => TodoListView(
              todos: state.filteredTodos.toList(),
              onDelete: (todoId) {
                todoBloc.add(DeleteTodo(todoId: todoId));
              },
              onUpdate: (
                String todoId, {
                String? title,
                bool? completed,
              }) {
                todoBloc.add(
                  UpdateTodo(
                    todoId: todoId,
                    title: title,
                    completed: completed,
                  ),
                );
              },
              onRefresh: () async {
                todoBloc.add(const LoadTodos());
              },
            ),
          );
        }

      case StateManagementSelection.mobx:
        {
          final todosStore = context.read<TodosStore>();
          return Observer(
            builder: (_) => TodoListView(
              todos: todosStore.filteredTodos,
              onDelete: todosStore.deleteTodo,
              onUpdate: todosStore.updateTodo,
              onRefresh: todosStore.loadTodos,
            ),
          );
        }

      case StateManagementSelection.getX:
        {
          final todoController = TodosController.to;
          return Obx(
            () => TodoListView(
              /// https://github.com/jonataslaw/getx/issues/1763
              /// In this case not relevant because every SM has the same disadvantage
              todos: todoController.filteredTodos.toList(), //workaround
              onDelete: todoController.deleteTodo,
              onUpdate: todoController.updateTodo,
              onRefresh: todoController.loadTodos,
            ),
          );
        }

      case StateManagementSelection.provider:
        {
          final todoModel = context.read<TodoModel>();
          return provider.Consumer<TodoModel>(
            builder: (_, __, ___) => TodoListView(
              todos: todoModel.filteredTodos,
              onDelete: todoModel.deleteTodo,
              onUpdate: todoModel.updateTodo,
              onRefresh: todoModel.loadTodos,
            ),
          );
        }

      case StateManagementSelection.riverpod:
        {
          /// https://pub.dev/documentation/flutter_riverpod/latest/flutter_riverpod/Consumer-class.html
          return riverpod.Consumer(
            builder: (context, ref, child) {
              final todos = ref.watch(filteredTodos);
              final todosNotifier = ref.watch(todoListProvider.notifier);
              return TodoListView(
                todos: todos,
                onDelete: todosNotifier.deleteTodo,
                onUpdate: todosNotifier.updateTodo,
                onRefresh: todosNotifier.loadTodos,
              );
            },
          );
        }
    }
  }
}
