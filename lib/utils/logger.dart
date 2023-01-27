import 'package:logging/logging.dart';

final log = Logger('EW');

void setupLogger() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((record) {
    // It's used for printing in dev environment
    // ignore: avoid_print
    print('${record.level.name}, ${record.time}, '
        'Msg: ${record.message}, '
        '${record.error != null ? 'Error: ${record.error}, ' : ''}'
        '${record.stackTrace != null ? 'StackTrace: ${record.stackTrace}' : ''}');
  });
}
