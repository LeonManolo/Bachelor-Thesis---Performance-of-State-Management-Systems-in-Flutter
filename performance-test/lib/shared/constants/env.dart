class EnvVariables {
  static const stateManagementSystem =
      String.fromEnvironment('STATE_MANAGEMENT_SYSTEM');

  static const timelineDirectory =
      String.fromEnvironment('TIMELINE_DIR', defaultValue: 'build/timelines');
}
