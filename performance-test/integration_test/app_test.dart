import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:performance_test/shared/constants/constants.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/widgets/widgets.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  /// to disable real keyboards in profile mode:
  /// https://github.com/flutter/flutter/issues/87990
  binding.testTextInput.register();

  const enableTests = false;

  testWidgets('App test', (tester) async {
    await binding.traceAction(
      () async {
        // Build our app and trigger a frame.
        await tester.pumpWidget(const AppBase());
        await tester.pumpAndSettle();

        /// checks whether there are the initial 5 todos
        expect(find.byType(TodoListTile), findsNWidgets(5));

        /// Checks if the widgets correctly displays a text with
        /// a total of 5 todos and 5 todos left
        expect(find.text('Total: 5'), findsOneWidget);
        expect(find.text('Left: 5'), findsOneWidget);

        /// taps the first second and fourth "todo" (mark as completed)
        final secondTodo = find.text('Todo 2');
        final fourthTodo = find.text('Todo 4');
        await tester.tap(secondTodo);
        await tester.tap(fourthTodo);
        await tester.pumpAndSettle();

        /// Check wether the tapped todos are now marked as "completed"
        final secondTodoCheckboxWidget = tester.widget<CheckboxListTile>(
          find.widgetWithText(CheckboxListTile, 'Todo 2'),
        );
        expect(
          secondTodoCheckboxWidget.value,
          true,
        );

        /// taps the floating action button to open the "Add Todo" dialog
        final floatingActionButton = find.byType(FloatingActionButton);
        await tester.tap(floatingActionButton);
        await tester.pumpAndSettle();

        /// create a new todo
        final textField = find.byType(TextFormField);
        await tester.enterText(textField, 'Hello Flutter');
        await tester.pump();
        expect(find.text('Hello Flutter'), findsOneWidget);

        final saveButton = find.widgetWithText(TextButton, 'Save');
        await tester.tap(saveButton);
        await tester.pump();
        expect(find.byType(TodoListTile), findsNWidgets(6));

        /// Filter todos
        final filterButton = find.byIcon(Icons.filter_alt_outlined);
        await tester.tap(filterButton);
        await tester.pumpAndSettle();

        /// filter by active todos
        await tester.tap(
          find.widgetWithText(
            PopupMenuItem<TodosVisibilityFilter>,
            'Active',
          ),
        );
        await tester.pump();
        expect(find.byType(TodoListTile), findsNWidgets(4));

        /// filter by completed todos
        await tester.tap(filterButton);
        await tester.pumpAndSettle();
        await tester.tap(
          find.widgetWithText(
            PopupMenuItem<TodosVisibilityFilter>,
            'Completed',
          ),
        );
        await tester.pump();
        expect(find.byType(TodoListTile), findsNWidgets(2));

        /// all todos
        await tester.tap(filterButton);
        await tester.pumpAndSettle();
        await tester.tap(
          find.widgetWithText(
            PopupMenuItem<TodosVisibilityFilter>,
            'All',
          ),
        );
        await tester.pumpAndSettle();
        expect(find.byType(TodoListTile), findsNWidgets(6));

        /// delete first and last todo
        await tester.tap(find.byIcon(Icons.delete_outline_rounded).first);
        await tester.pumpAndSettle();
        await tester.tap(find.byIcon(Icons.delete_outline_rounded).last);
        await tester.pumpAndSettle();

        expect(find.byType(TodoListTile), findsNWidgets(4));

        await tester.pumpAndSettle(const Duration(milliseconds: 10000));
      },
      reportKey: 'scrolling_timeline',
    );

    binding.reportData?['stateManagementSystem'] =
        EnvVariables.stateManagementSystem;
  });
}
