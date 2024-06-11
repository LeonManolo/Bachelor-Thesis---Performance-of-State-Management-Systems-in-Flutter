import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/bloc/todo_bloc.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/mobx/mobx.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/providers.dart';
import 'package:provider/provider.dart' as provider;

class AddTodoButtonSMWrapper extends StatelessWidget {
  const AddTodoButtonSMWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagement = StateManagementSelection.current();
    return AddTodoButton(
      onAddTodo: (todo) {
        switch (stateManagement) {
          case StateManagementSelection.bloc:
            {
              BlocProvider.of<TodoBloc>(context).add(AddTodo(todo: todo));
            }
          case StateManagementSelection.mobx:
            {
              context.read<TodosStore>().addTodo(todo);
            }
          case StateManagementSelection.getX:
            {
              TodosController.to.addTodo(todo);
            }
          case StateManagementSelection.provider:
            {
              provider.Provider.of<TodoModel>(context).addTodo(todo);
            }
          case StateManagementSelection.riverpod:
            {
              ProviderScope.containerOf(context)
                  .read(todoListProvider.notifier)
                  .addTodo(todo);
            }
        }
      },
    );
  }
}
