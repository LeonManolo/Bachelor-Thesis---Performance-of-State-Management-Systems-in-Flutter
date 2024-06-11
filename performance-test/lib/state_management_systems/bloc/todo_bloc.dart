import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/repositories/fake_todo_repository.dart';
import 'package:performance_test/shared/repositories/repositories.dart';
import 'package:performance_test/state_management_systems/bloc/bloc.dart';

part 'todo_event.dart';

part 'todo_state.dart';

class TodoBloc extends Bloc<TodoEvent, TodoState> {
  TodoBloc({TodoRepository? todoRepository})
      : _todoRepository = todoRepository ?? FakeTodoRepository(),
        super(const TodoState(todos: [])) {
    on<AddTodo>(_onAddTodo);
    on<DeleteTodo>(_onDeleteTodo);
    on<UpdateTodo>(_onUpdateTodo);
    on<LoadTodos>(_onLoadTodos);
    on<UpdateTodosFilter>(_onUpdateTodosFilter);
  }

  final TodoRepository _todoRepository;

  FutureOr<void> _onAddTodo(
    AddTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _todoRepository.addTodoItem(event.todo);
    final todos = await _todoRepository.fetchTodoItems();
    emit(
      state.copyWith(
        todos: [...todos],
      ),
    );
  }

  FutureOr<void> _onLoadTodos(
    LoadTodos event,
    Emitter<TodoState> emit,
  ) async {
    final todos = await _todoRepository.fetchTodoItems();
    emit(
      state.copyWith(
        todos: [...todos],
      ),
    );
  }

  FutureOr<void> _onUpdateTodosFilter(
    UpdateTodosFilter event,
    Emitter<TodoState> emit,
  ) {
    emit(
      state.copyWith(
        visibilityFilter: event.visibilityFilter,
      ),
    );
  }

  FutureOr<void> _onDeleteTodo(
    DeleteTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _todoRepository.deleteTodoItem(event.todoId);
    final todos = await _todoRepository.fetchTodoItems();
    emit(
      state.copyWith(
        todos: [...todos],
      ),
    );
  }

  FutureOr<void> _onUpdateTodo(
    UpdateTodo event,
    Emitter<TodoState> emit,
  ) async {
    await _todoRepository.updateTodoItem(
      event.todoId,
      title: event.title,
      completed: event.completed,
    );
    final todos = await _todoRepository.fetchTodoItems();
    emit(
      state.copyWith(
        todos: [...todos],
      ),
    );
  }
}

sealed class CounterEvent {}

class Increment extends CounterEvent {}

class Decrement extends CounterEvent {}

class CounterState extends Equatable {
  const CounterState({required this.counter});

  final int counter;

  @override
  List<Object?> get props => [counter];
}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState(counter: 0)) {
    on<Increment>(_onIncrement);
    on<Decrement>(_onDecrement);
  }

  FutureOr<void> _onIncrement(
    Increment event,
    Emitter<CounterState> emit,
  ) {
    /// access data layer
    emit(CounterState(counter: state.counter + 1));
  }

  FutureOr<void> _onDecrement(
    Decrement event,
    Emitter<CounterState> emit,
  ) {
    /// access data layer
    emit(CounterState(counter: state.counter - 1));
  }
}

class CounterPage extends StatelessWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: const CounterView(),
    );
  }
}

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Counter App')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) => Text('${state.counter}'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () => context.read<CounterBloc>().add(Decrement()),
                icon: const Icon(Icons.remove),
              ),
              IconButton(
                onPressed: () => context.read<CounterBloc>().add(Increment()),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ExampleInheritedWidget extends InheritedWidget {
  const ExampleInheritedWidget({
    required super.child,
    required this.data,
    super.key,
  });

  final int data;

  static ExampleInheritedWidget of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<ExampleInheritedWidget>();
    assert(result != null, 'No ExampleInheritedWidget found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(ExampleInheritedWidget oldWidget) =>
      oldWidget.data != data;
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const ExampleInheritedWidget(data: 15062024, child: NestedWidget());
//   }
// }

class NestedWidget extends StatelessWidget {
  const NestedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Data: ${ExampleInheritedWidget.of(context).data}');
  }
}
