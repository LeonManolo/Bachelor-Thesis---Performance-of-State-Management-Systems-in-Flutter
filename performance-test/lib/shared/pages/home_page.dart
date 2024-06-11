import 'package:flutter/material.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do's (${StateManagementSelection.current()})"),
        actions: const [
          FilteredTodosButtonSMWrapper(),
        ],
      ),
      body: const Column(
        children: [
          Row(
            children: [
              TodoCountSMWrapper(),
              ActiveTodoCountSMWrapper(),
            ],
          ),
          TodoListViewSMWrapper(),
        ],
      ),
      floatingActionButton: const AddTodoButtonSMWrapper(),
    );
  }
}
