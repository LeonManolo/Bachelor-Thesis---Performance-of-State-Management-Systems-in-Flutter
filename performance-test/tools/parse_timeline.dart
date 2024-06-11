import 'dart:convert';
import 'dart:io';
import 'package:flutter_driver/flutter_driver.dart'
    show Timeline, TimelineEvent;

// dart run tools/parse_timeline.dart build/timelines/mobx
void main(List<String> arguments) async {
  final inputPath = arguments.firstOrNull;
  if (inputPath == null) throw Exception('Path missing');
  final dir = Directory(inputPath);

  if (dir.existsSync()) {
    final file = File('build/mobx.tsv')
      ..writeAsStringSync('time\ttotal_cpu_time\n');

    final entities = dir.listSync()
      ..sort((a, b) => a.path.compareTo(b.path));

    for (final entity in entities) {
      // Überprüfe, ob die Entität eine Datei ist und mit .json endet
      if (entity is File && entity.path.endsWith('.json')) {
        print(entity.path);
        final (:totalCpuTime, totalGpuTime: _) =
            await _extractThreads(entity.path);
        final dateString = entity.path
            .split('performance_test-')
            .last
            .split('.timeline.json')
            .first;
        _writeToTsvFile(
          [
            (
              date: dateString,
              totalCpuTime: totalCpuTime,
            ),
          ],
          file,
        );
      }
    }
  } else {
    print('Das Verzeichnis existiert nicht.');
  }
}

Future<({int totalCpuTime, int totalGpuTime})> _extractThreads(
  String timelineJsonPath,
) async {
  final timelineFile = await File(timelineJsonPath).readAsString();
  final timelineJson = jsonDecode(timelineFile) as Map<String, dynamic>;
  final timeline = Timeline.fromJson(timelineJson);

  int? uiThreadId;
  int? rasterThreadId;

  // timeline.events?.sort(
  //     (a, b) => a.timestampMicros?.compareTo(b.timestampMicros ?? 0) ?? 0);
  for (final event in timeline.events ?? <TimelineEvent>[]) {
    if (event.name == 'thread_name') {
      final name = event.arguments?['name'];

      if (name is String && name.startsWith('1.ui')) {
        uiThreadId = event.threadId;
      } else if (name is String && name.startsWith('1.raster')) {
        rasterThreadId = event.threadId;
      }
    }
  }

  assert(uiThreadId != null);
  assert(rasterThreadId != null);
  assert(timeline.events?.isNotEmpty ?? false);

  final totalCpuTime =
      _measureTotalThreadDurationInMcs(uiThreadId!, timeline.events!);
  print('total CPU time: $totalCpuTime microseconds');
  return (
    totalCpuTime: totalCpuTime,
    totalGpuTime: 0,
  );
}

int _measureTotalThreadDurationInMcs(int threadId, List<TimelineEvent> events) {
  TimelineEvent? startingEvent;
  var totalTimeInMs = 0;

  // 42323
  for (final event in events) {
    if (event.threadId != threadId) continue;
    // Überprüfe, ob das Event ein Beginn-Event ist
    if (event.phase == 'B' && startingEvent == null && event.name != null) {
      startingEvent = event;
    }
    // Überprüfe, ob das Event ein Ende-Event ist und ob die Namen übereinstimmen
    else if (event.phase == 'E' &&
        startingEvent != null &&
        event.name == startingEvent.name &&
        event.timestampMicros != null) {
      totalTimeInMs += event.timestampMicros! - startingEvent.timestampMicros!;

      startingEvent = null; // Bereite startingEvent für das nächste Paar vor
    }
  }

  return totalTimeInMs;
}

void _writeToTsvFile(
  List<({String date, int totalCpuTime})> data,
  File file,
) {
  for (final (:date, :totalCpuTime) in data) {
    final line = '$date\t$totalCpuTime\n';
    file.writeAsStringSync(line, mode: FileMode.append);
  }
}
