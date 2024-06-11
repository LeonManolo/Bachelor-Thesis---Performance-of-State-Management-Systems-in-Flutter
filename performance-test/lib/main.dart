import 'package:flutter/material.dart';
import 'package:performance_test/shared/constants/constants.dart';
import 'package:performance_test/shared/widgets/widgets.dart';

void main() {
  assert(
    EnvVariables.stateManagementSystem.isNotEmpty,
    'State management system needs to be specified!',
  );
  runApp(const AppBase());
}
