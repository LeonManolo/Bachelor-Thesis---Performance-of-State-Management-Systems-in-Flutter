import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:get/get.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/bloc/bloc.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/mobx/mobx.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/riverpod.dart';
import 'package:provider/provider.dart' as provider;

class ActiveTodoCountSMWrapper extends StatelessWidget {
  const ActiveTodoCountSMWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagement = StateManagementSelection.current();

    switch (stateManagement) {
      case StateManagementSelection.bloc:
        {
          return BlocBuilder<TodoBloc, TodoState>(
            buildWhen: (prev, current) =>
                prev.activeTodosCount != current.activeTodosCount,
            builder: (_, state) => ActiveTodoCount(
              count: state.activeTodosCount,
            ),
          );
        }
      case StateManagementSelection.mobx:
        {
          return Observer(
            builder: (_) => ActiveTodoCount(
                count:
                    context.read<TodosStore>().activeTodosCount),
          );
        }
      case StateManagementSelection.getX:
        {
          return Obx(
            () => ActiveTodoCount(count: TodosController.to.activeTodosCount),
          );
        }
      case StateManagementSelection.riverpod:
        {
          return riverpod.Consumer(
            builder: (context, ref, child) =>
                ActiveTodoCount(count: ref.watch(activeTodosCount)),
          );
        }
      case StateManagementSelection.provider:
        {
          return provider.Selector<TodoModel, int>(
            selector: (_, todoModel) => todoModel.activeTodosCount,
            builder: (_, activeTodosCount, __) =>
                ActiveTodoCount(count: activeTodosCount),
          );
        }
    }
  }
}
