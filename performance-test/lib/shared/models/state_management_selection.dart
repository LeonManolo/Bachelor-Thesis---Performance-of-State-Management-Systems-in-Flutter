import 'package:performance_test/shared/constants/constants.dart';

enum StateManagementSelection {
  bloc,
  provider,
  mobx,
  getX,
  riverpod;

  static StateManagementSelection? fromString(String selection) {
    return switch (selection.toLowerCase()) {
      'bloc' => StateManagementSelection.bloc,
      'provider' => StateManagementSelection.provider,
      'mobx' => StateManagementSelection.mobx,
      'getx' => StateManagementSelection.getX,
      'riverpod' => StateManagementSelection.riverpod,
      _ => null,
    };
  }

  static StateManagementSelection current() {
    final stateSystem =
        StateManagementSelection.fromString(EnvVariables.stateManagementSystem);
    if (stateSystem != null) {
      return stateSystem;
    } else {
      throw Exception("Can't convert state management string!");
    }
  }

  @override
  String toString() {
    return switch (this) {
      StateManagementSelection.bloc => 'bloc',
      StateManagementSelection.provider => 'provider',
      StateManagementSelection.mobx => 'mobx',
      StateManagementSelection.getX => 'getx',
      StateManagementSelection.riverpod => 'riverpod',
    };
  }
}
