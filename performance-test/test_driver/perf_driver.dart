import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';
import 'package:performance_test/shared/models/models.dart';

Future<void> main() {
  const includeSummary = false;

  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(
          data['scrolling_timeline'] as Map<String, dynamic>,
        );

        final stateManagement = _getStateManagementConfig(data);
        print(stateManagement);


        // Convert the Timeline into a TimelineSummary that's easier to
        // read and understand.
        final summary = driver.TimelineSummary.summarize(timeline);
        final now = DateTime.now();
        final id = 'performance_test-${now.toIso8601String()}';
        final filename = id.replaceAll(':', '-');

        // Then, write the entire timeline to disk in a json format.
        // This file can be opened in the Chrome browser's tracing tools
        // found by navigating to chrome://tracing.
        // Optionally, save the summary to disk by setting includeSummary
        // to true
        await summary.writeTimelineToFile(
          filename,
          destinationDirectory: 'build/timelines/$stateManagement',
          pretty: true,
          includeSummary: includeSummary,
        );
      }
    },
  );
}

StateManagementSelection _getStateManagementConfig(
  Map<String, dynamic> data,
) {
  final stateManagement = data['stateManagementSystem'] as String;
  final stateManagementSelection =
      StateManagementSelection.fromString(stateManagement);
  if (stateManagementSelection != null) {
    return stateManagementSelection;
  } else {
    throw Exception('State management system unspecified or unknown!');
  }
}
