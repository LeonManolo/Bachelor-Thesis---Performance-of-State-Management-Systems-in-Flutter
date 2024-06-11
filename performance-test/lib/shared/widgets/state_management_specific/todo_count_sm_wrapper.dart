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
import 'package:performance_test/state_management_systems/mobx/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/riverpod.dart';
import 'package:provider/provider.dart' as provider;

class TodoCountSMWrapper extends StatelessWidget {
  const TodoCountSMWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagement = StateManagementSelection.current();

    switch (stateManagement) {
      case StateManagementSelection.bloc:
        {
          return BlocBuilder<TodoBloc, TodoState>(
            buildWhen: (previous, current) =>
                previous.todoCount != current.todoCount,
            builder: (_, state) => TodoCount(count: state.todoCount),
          );
        }
      case StateManagementSelection.mobx:
        {
          return Observer(
            builder: (_) => TodoCount(
              count:  context.read<TodosStore>().todoCount,
            ),
          );
        }
      case StateManagementSelection.getX:
        {
          return Obx(() => TodoCount(count: TodosController.to.todoCount));
        }
      case StateManagementSelection.provider:
        {
          return provider.Selector<TodoModel, int>(
            selector: (_, todoModel) => todoModel.todoCount,
            builder: (_, count, __) => TodoCount(count: count),
          );
        }
      case StateManagementSelection.riverpod:
        {
          return riverpod.Consumer(
            builder: (context, ref, child) =>
                TodoCount(count: ref.watch(todoCount)),
          );
        }
    }
  }
}
