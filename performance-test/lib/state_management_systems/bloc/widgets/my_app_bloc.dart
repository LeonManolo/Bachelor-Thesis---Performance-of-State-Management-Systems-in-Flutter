import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/bloc/todo_bloc.dart';

class MyAppBloc extends StatelessWidget {
  const MyAppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TodoBloc()..add(const LoadTodos()),
      child: const MyApp(),
    );
  }
}


