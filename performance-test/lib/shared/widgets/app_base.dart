import 'package:flutter/material.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/state_management_systems/bloc/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/mobx/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/provider/provider.dart';
import 'package:performance_test/state_management_systems/riverpod/riverpod.dart';

class AppBase extends StatelessWidget {
  const AppBase({super.key});

  @override
  Widget build(BuildContext context) {
    final stateManagementSystem = StateManagementSelection.current();
    print(stateManagementSystem);
    return switch (stateManagementSystem) {
      StateManagementSelection.bloc => const MyAppBloc(),
      StateManagementSelection.mobx => const MyAppMobx(),
      StateManagementSelection.getX => const MyAppGetX(),
      StateManagementSelection.provider => const MyAppProvider(),
      StateManagementSelection.riverpod => const MyAppRiverpod(),
    };
  }
}

class CounterExample extends StatefulWidget {
  const CounterExample({super.key});

  @override
  State<CounterExample> createState() => _CounterExampleState();
}

class _CounterExampleState extends State<CounterExample> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stateful counter example'),
      ),
      body: Text(
        '$_counter',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
