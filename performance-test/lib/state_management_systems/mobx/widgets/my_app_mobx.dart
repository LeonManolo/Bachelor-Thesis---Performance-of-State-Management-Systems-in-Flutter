import 'package:flutter/material.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/mobx/todos_store.dart';
import 'package:provider/provider.dart';

// It is recommended by MobX to use provider
// https://mobx.netlify.app/guides/stores#using-providers-to-avoid-singletons
//final todosStore = TodosStore()..loadTodos();

class MyAppMobx extends StatelessWidget {
  const MyAppMobx({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => TodosStore()..loadTodos(),
      child: const MyApp(),
    );
  }
}
