import 'package:flutter/material.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/provider/todo_model.dart';
import 'package:provider/provider.dart';

class MyAppProvider extends StatelessWidget {
  const MyAppProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoModel()..loadTodos(),
      child: const MyApp(),
    );
  }
}
