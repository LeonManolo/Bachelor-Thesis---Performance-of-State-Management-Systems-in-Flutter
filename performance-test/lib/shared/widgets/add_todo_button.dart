import 'package:flutter/material.dart';
import 'package:performance_test/shared/models/models.dart';
import 'package:performance_test/shared/models/todo_item.dart';
import 'package:uuid/uuid.dart';

class AddTodoButton extends StatelessWidget {
  const AddTodoButton({super.key, required this.onAddTodo});

  final void Function(TodoItem) onAddTodo;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showDialog<void>(
          context: context,
          builder: (context) => _AddTodoDialog(onAddTodo: onAddTodo),
        );
      },
    );
  }
}

class _AddTodoDialog extends StatefulWidget {
  const _AddTodoDialog({required this.onAddTodo});

  final void Function(TodoItem) onAddTodo;

  @override
  State<_AddTodoDialog> createState() => _AddTodoDialogState();
}

class _AddTodoDialogState extends State<_AddTodoDialog> {
  final _textFieldController = TextEditingController();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Todo'),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: _onAddTodo,
          child: const Text('Save'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextFormField(
            controller: _textFieldController,
            decoration: InputDecoration(
              labelText: 'Title',
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            ),
          ),
          const SizedBox(height: 16),
          CheckboxListTile(
            title: const Text('Completed'),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
            },
          )
        ],
      ),
    );
  }

  void _onAddTodo() {
    Navigator.pop(context);
    widget.onAddTodo(
      TodoItem(
        id: const Uuid().v4(),
        title: _textFieldController.text,
        completed: _isChecked,
      ),
    );
  }
}
