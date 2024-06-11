import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/bloc/todo_bloc.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/mobx/mobx.dart';
import 'package:performance_test/state_management_systems/mobx/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/riverpod.dart';
import 'package:provider/provider.dart' as provider;

class FilteredTodosButtonSMWrapper extends StatelessWidget {
  const FilteredTodosButtonSMWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagement = StateManagementSelection.current();

    return FilterTodosButton(
      onFilterChanged: (visibilityFilter) {
        switch (stateManagement) {
          case StateManagementSelection.bloc:
            {
              BlocProvider.of<TodoBloc>(context)
                  .add(UpdateTodosFilter(visibilityFilter: visibilityFilter));
            }
          case StateManagementSelection.mobx:
            {
              context.read<TodosStore>().visibilityFilter =
                  visibilityFilter;
            }
          case StateManagementSelection.getX:
            {
              TodosController.to.visibilityFilter.value = visibilityFilter;
            }
          case StateManagementSelection.provider:
            {
              context.read<TodoModel>().filter = visibilityFilter;
            }
          case StateManagementSelection.riverpod:
            {
              riverpod.ProviderScope.containerOf(context)
                  .read(todosVisibilityFilter.notifier)
                  .state = visibilityFilter;
            }
        }
      },
    );
  }
}
