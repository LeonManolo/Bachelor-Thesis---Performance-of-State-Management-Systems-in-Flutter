import 'package:flutter/material.dart';
import 'package:performance_test/shared/models/models.dart';

class FilterTodosButton extends StatelessWidget {
  const FilterTodosButton({required this.onFilterChanged, super.key});

  final void Function(TodosVisibilityFilter) onFilterChanged;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      onSelected: onFilterChanged,
      itemBuilder: (BuildContext context) {
        return [
          const PopupMenuItem(
            value: TodosVisibilityFilter.all,
            child: Text('All'),
          ),
          const PopupMenuItem(
            value: TodosVisibilityFilter.active,
            child: Text('Active'),
          ),
          const PopupMenuItem(
            value: TodosVisibilityFilter.completed,
            child: Text('Completed'),
          ),
        ];
      },
      child: const Icon(Icons.filter_alt_outlined),
    );
  }
}
