import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as rp;
import 'package:performance_test/shared/widgets/widgets.dart';

class MyAppRiverpod extends StatelessWidget {
  const MyAppRiverpod({super.key});

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(child: MyApp());
  }
}
