import 'package:flutter/material.dart';

class TodoCount extends StatelessWidget {
  const TodoCount({required this.count, super.key});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text('Total: $count'),
      ),
    );
  }
}
