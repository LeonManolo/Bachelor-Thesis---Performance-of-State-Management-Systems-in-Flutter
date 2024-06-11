import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get.dart' as getX;
import 'package:performance_test/shared/widgets/widgets.dart';
import 'package:performance_test/state_management_systems/getx/getx.dart';
import 'package:performance_test/state_management_systems/getx/todos_controller.dart';

class MyAppGetX extends StatelessWidget {
  const MyAppGetX({super.key});

  @override
  Widget build(BuildContext context) {
    return const _GetxInitWidget(child: MyApp());
  }
}

class _GetxInitWidget extends StatefulWidget {
  const _GetxInitWidget({required this.child, super.key});

  final Widget child;

  @override
  State<_GetxInitWidget> createState() => _GetxInitWidgetState();
}

class _GetxInitWidgetState extends State<_GetxInitWidget> {
  final count = 0.obs;
  @override
  void initState() {
    Get.put(TodosController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
